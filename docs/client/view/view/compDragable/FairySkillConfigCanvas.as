// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.FairySkillConfigCanvas

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.FairySkillComp;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.FairySkillListComp;
    import mx.controls.CheckBox;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
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

    public class FairySkillConfigCanvas extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3616s3:FairySkillComp;
        private var _1872787359saveBtn:DelayButton;
        public var _FairySkillConfigCanvas_IntroText1:IntroText;
        private var _102982482list0:FairySkillListComp;
        private var _476548482cancelBtn:CheckBox;
        private var _3615s2:FairySkillComp;
        public var _FairySkillConfigCanvas_Label1:Label;
        public var _FairySkillConfigCanvas_Label2:Label;
        public var _FairySkillConfigCanvas_Label3:Label;
        private var _3619s6:FairySkillComp;
        private var _102982484list2:FairySkillListComp;
        private var _3614s1:FairySkillComp;
        private var _3618s5:FairySkillComp;
        private var useIndex:int = -1;
        private var _607339634pageSelector:PageSelector;
        private var SKILL_COUNT_PER_PAGE:int = 7;
        private var _3613s0:FairySkillComp;
        private var _102982483list1:FairySkillListComp;
        private var _3617s4:FairySkillComp;
        private var _fairy:Object;
        private var SKILL_LIST_COUNT:int = 3;
        public var saveAlert:Boolean = false;
        public var _FairySkillConfigCanvas_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":420,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FairySkillConfigCanvas_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":30,
                                "width":420,
                                "height":370,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":120,
                                            "height":358,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_FairySkillConfigCanvas_Label1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "5";
                                                    this.top = "4";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":103});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalGap = 1;
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":25,
                                                        "width":108,
                                                        "height":297,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":FairySkillComp,
                                                            "id":"s0"
                                                        }), new UIComponentDescriptor({
                                                            "type":FairySkillComp,
                                                            "id":"s1"
                                                        }), new UIComponentDescriptor({
                                                            "type":FairySkillComp,
                                                            "id":"s2"
                                                        }), new UIComponentDescriptor({
                                                            "type":FairySkillComp,
                                                            "id":"s3"
                                                        }), new UIComponentDescriptor({
                                                            "type":FairySkillComp,
                                                            "id":"s4"
                                                        }), new UIComponentDescriptor({
                                                            "type":FairySkillComp,
                                                            "id":"s5"
                                                        }), new UIComponentDescriptor({
                                                            "type":FairySkillComp,
                                                            "id":"s6"
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.bottom = "5";
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "18";
                                        this.top = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":265,
                                            "height":107,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"_FairySkillConfigCanvas_IntroText1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":270,
                                                        "height":103,
                                                        "x":0,
                                                        "y":0
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "18";
                                        this.bottom = "8";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":270,
                                            "height":250,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_FairySkillConfigCanvas_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.top = "5";
                                                    this.color = 0xFFFFFF;
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":15,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":FairySkillListComp,
                                                            "id":"list0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":0,
                                                                    "y":16
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FairySkillListComp,
                                                            "id":"list1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":1,
                                                                    "y":88
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FairySkillListComp,
                                                            "id":"list2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":2,
                                                                    "y":160
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"cancelBtn",
                                                "events":{"click":"__cancelBtn_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":180,
                                                        "y":29
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"saveBtn",
                                                "events":{"click":"__saveBtn_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":210,
                                                        "y":7,
                                                        "styleName":"CrystalYellowButton",
                                                        "width":40,
                                                        "height":22
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_FairySkillConfigCanvas_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 45296;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":197,
                                                        "y":28,
                                                        "width":70
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var skillAC:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FairySkillConfigCanvas()
        {
            mx_internal::_document = this;
            this.width = 420;
            this.height = 400;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___FairySkillConfigCanvas_DragableCanvas1_creationComplete);
            this.addEventListener("remove", ___FairySkillConfigCanvas_DragableCanvas1_remove);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FairySkillConfigCanvas._watcherSetupUtil = _arg_1;
        }


        public function set cancelBtn(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._476548482cancelBtn;
            if (_local_2 !== _arg_1)
            {
                this._476548482cancelBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtn", _local_2, _arg_1));
            };
        }

        public function __saveBtn_click(_arg_1:MouseEvent):void
        {
            saveConfig();
        }

        private function init():void
        {
            pageSelector.lastBtnLabel = "";
            pageSelector.nextBtnLabel = "";
            pageSelector.btnLastPage.width = 13;
            pageSelector.btnNextPage.width = 13;
            pageSelector.setLastBtnStyle("fazendaPageLast");
            pageSelector.setNextBtnStyle("fazendaPageNext");
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < SKILL_COUNT_PER_PAGE)
            {
                this[("s" + _local_1)].init();
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < SKILL_LIST_COUNT)
            {
                this[("list" + _local_1)].init();
                this[("list" + _local_1)].addEventListener("select", skilllistSelect);
                _local_1++;
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
        }

        private function refreshSkillConfig():void
        {
            var _local_2:Object;
            useIndex = -1;
            cancelBtn.selected = false;
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < SKILL_LIST_COUNT)
            {
                this[("list" + _local_1)].init();
                _local_1++;
            };
            if (_fairy)
            {
                if (!_fairy.skillConfig)
                {
                    _local_2 = {};
                }
                else
                {
                    _local_2 = _fairy.skillConfig;
                };
                useIndex = int(_local_2.select);
                cancelBtn.selected = (useIndex == -1);
                _local_1 = 0;
                while (_local_1 < SKILL_LIST_COUNT)
                {
                    if (this[("list" + _local_1)])
                    {
                        this[("list" + _local_1)].refresh(useIndex, _local_2[_local_1]);
                    };
                    _local_1++;
                };
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s1():FairySkillComp
        {
            return (this._3614s1);
        }

        private function saveConfig():void
        {
            if (!_fairy)
            {
                return;
            };
            saveAlert = false;
            var _local_1:Object = {};
            var _local_2:int;
            while (_local_2 < SKILL_LIST_COUNT)
            {
                _local_1[_local_2] = this[("list" + _local_2)].getConfigData();
                _local_2++;
            };
            _local_1.select = useIndex;
            _fairy.skillConfig = _local_1;
            _core.remote.call("fairySkillConfigChange", null, _fairy.id, _local_1);
        }

        [Bindable(event="propertyChange")]
        public function get s3():FairySkillComp
        {
            return (this._3616s3);
        }

        [Bindable(event="propertyChange")]
        public function get s4():FairySkillComp
        {
            return (this._3617s4);
        }

        [Bindable(event="propertyChange")]
        public function get s0():FairySkillComp
        {
            return (this._3613s0);
        }

        [Bindable(event="propertyChange")]
        public function get s2():FairySkillComp
        {
            return (this._3615s2);
        }

        [Bindable(event="propertyChange")]
        public function get s5():FairySkillComp
        {
            return (this._3618s5);
        }

        [Bindable(event="propertyChange")]
        public function get s6():FairySkillComp
        {
            return (this._3619s6);
        }

        public function set s1(_arg_1:FairySkillComp):void
        {
            var _local_2:Object = this._3614s1;
            if (_local_2 !== _arg_1)
            {
                this._3614s1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s1", _local_2, _arg_1));
            };
        }

        public function set s2(_arg_1:FairySkillComp):void
        {
            var _local_2:Object = this._3615s2;
            if (_local_2 !== _arg_1)
            {
                this._3615s2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s2", _local_2, _arg_1));
            };
        }

        public function set s3(_arg_1:FairySkillComp):void
        {
            var _local_2:Object = this._3616s3;
            if (_local_2 !== _arg_1)
            {
                this._3616s3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s3", _local_2, _arg_1));
            };
        }

        public function ___FairySkillConfigCanvas_DragableCanvas1_remove(_arg_1:FlexEvent):void
        {
            askSave();
        }

        public function open(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                Alert.show(Language.FAIRY_MANAGER_PANEL_U[105]);
                return;
            };
            fairy = _arg_1;
            if (!visible)
            {
                visible = true;
            };
        }

        private function skilllistSelect(_arg_1:MouseEvent):void
        {
            cancelBtn.selected = false;
            var _local_2:int;
            while (_local_2 < SKILL_LIST_COUNT)
            {
                if (this[("list" + _local_2)] == _arg_1.target)
                {
                    useIndex = _local_2;
                    this[("list" + _local_2)].beSelect(true);
                }
                else
                {
                    this[("list" + _local_2)].beSelect(false);
                };
                _local_2++;
            };
            saveAlert = true;
        }

        [Bindable(event="propertyChange")]
        public function get list0():FairySkillListComp
        {
            return (this._102982482list0);
        }

        [Bindable(event="propertyChange")]
        public function get list1():FairySkillListComp
        {
            return (this._102982483list1);
        }

        public function set s6(_arg_1:FairySkillComp):void
        {
            var _local_2:Object = this._3619s6;
            if (_local_2 !== _arg_1)
            {
                this._3619s6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s6", _local_2, _arg_1));
            };
        }

        public function set saveBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1872787359saveBtn;
            if (_local_2 !== _arg_1)
            {
                this._1872787359saveBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "saveBtn", _local_2, _arg_1));
            };
        }

        public function set s4(_arg_1:FairySkillComp):void
        {
            var _local_2:Object = this._3617s4;
            if (_local_2 !== _arg_1)
            {
                this._3617s4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get list2():FairySkillListComp
        {
            return (this._102982484list2);
        }

        public function set s0(_arg_1:FairySkillComp):void
        {
            var _local_2:Object = this._3613s0;
            if (_local_2 !== _arg_1)
            {
                this._3613s0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s0", _local_2, _arg_1));
            };
        }

        public function learnSkill(_arg_1:int):void
        {
            if ((((visible) && (_fairy)) && (_arg_1 == _fairy.id)))
            {
                fairy = _core.player.fairyList[_arg_1];
            };
        }

        public function set s5(_arg_1:FairySkillComp):void
        {
            var _local_2:Object = this._3618s5;
            if (_local_2 !== _arg_1)
            {
                this._3618s5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s5", _local_2, _arg_1));
            };
        }

        public function ___FairySkillConfigCanvas_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function allCancel():void
        {
            var _local_1:int;
            if (cancelBtn.selected)
            {
                _local_1 = 0;
                while (_local_1 < SKILL_LIST_COUNT)
                {
                    this[("list" + _local_1)].beSelect(false);
                    _local_1++;
                };
                useIndex = -1;
            }
            else
            {
                useIndex = -2;
            };
            saveAlert = true;
        }

        private function clearPage():void
        {
            var _local_1:int;
            while (_local_1 < SKILL_COUNT_PER_PAGE)
            {
                this[("s" + _local_1)].init();
                _local_1++;
            };
        }

        public function changeSkill(_arg_1:ItemSlot, _arg_2:ItemSlot):void
        {
            if ((((!(_arg_2)) || (!(_arg_1))) || (_arg_2 == _arg_1)))
            {
                return;
            };
            var _local_3:int;
            while (_local_3 < SKILL_LIST_COUNT)
            {
                if (this[("list" + _local_3)].changeSkill(_arg_1, _arg_2))
                {
                    saveAlert = true;
                    return;
                };
                _local_3++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get cancelBtn():CheckBox
        {
            return (this._476548482cancelBtn);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        private function askSave():void
        {
            if (!saveAlert)
            {
                return;
            };
            saveAlert = false;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    saveConfig();
                };
            };
            Alert.show(Language.FAIRY_MANAGER_PANEL_U[106], Language.FAIRY_MANAGER_PANEL_U[106], (Alert.YES | Alert.NO), null, func);
        }

        override public function initialize():void
        {
            var target:FairySkillConfigCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FairySkillConfigCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_FairySkillConfigCanvasWatcherSetupUtil");
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

        public function getSkill(_arg_1:ItemSlot, _arg_2:ItemSlot):void
        {
            if ((((!(_arg_2)) || (!(_arg_1))) || (_arg_2 == _arg_1)))
            {
                return;
            };
            var _local_3:int;
            while (_local_3 < SKILL_LIST_COUNT)
            {
                if (this[("list" + _local_3)].getSkill(_arg_1, _arg_2))
                {
                    saveAlert = true;
                    return;
                };
                _local_3++;
            };
        }

        public function set list0(_arg_1:FairySkillListComp):void
        {
            var _local_2:Object = this._102982482list0;
            if (_local_2 !== _arg_1)
            {
                this._102982482list0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "list0", _local_2, _arg_1));
            };
        }

        private function _FairySkillConfigCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[95];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[96];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[107];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[97];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[104];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[101];
        }

        public function set list1(_arg_1:FairySkillListComp):void
        {
            var _local_2:Object = this._102982483list1;
            if (_local_2 !== _arg_1)
            {
                this._102982483list1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "list1", _local_2, _arg_1));
            };
        }

        public function set list2(_arg_1:FairySkillListComp):void
        {
            var _local_2:Object = this._102982484list2;
            if (_local_2 !== _arg_1)
            {
                this._102982484list2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "list2", _local_2, _arg_1));
            };
        }

        public function __cancelBtn_click(_arg_1:MouseEvent):void
        {
            allCancel();
        }

        [Bindable(event="propertyChange")]
        public function get saveBtn():DelayButton
        {
            return (this._1872787359saveBtn);
        }

        public function set fairy(_arg_1:Object):void
        {
            _fairy = _arg_1;
            refreshSkillAC();
            refreshSkillConfig();
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_3:int;
            while (_local_3 < SKILL_COUNT_PER_PAGE)
            {
                _local_4 = skillAC[(_local_3 + _arg_1)];
                if (_local_4)
                {
                    this[("s" + _local_3)].refresh(_local_4);
                };
                _local_3++;
            };
        }

        private function refreshSkillAC():void
        {
            var _local_1:Object;
            var _local_2:int;
            var _local_3:Object;
            skillAC.length = 0;
            if (((_fairy) && (_fairy.skillFlag)))
            {
                for (_local_1 in _fairy.skillFlag)
                {
                    _local_2 = int(_fairy.skillFlag[_local_1]);
                    _local_3 = _core.data.gameData[GamePredef.TBL_SKILL][_local_2];
                    if (((_local_3) && (_local_3.kind == 1)))
                    {
                        skillAC.push(_local_3);
                    };
                };
            };
            pageSelector.initPageSeletor(skillAC.length, SKILL_COUNT_PER_PAGE);
        }

        private function _FairySkillConfigCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[95];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairySkillConfigCanvas_BasicTitleCanvas1.text = _arg_1;
            }, "_FairySkillConfigCanvas_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[96];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairySkillConfigCanvas_Label1.text = _arg_1;
            }, "_FairySkillConfigCanvas_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[107];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairySkillConfigCanvas_IntroText1.htmlText = _arg_1;
            }, "_FairySkillConfigCanvas_IntroText1.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[97];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairySkillConfigCanvas_Label2.text = _arg_1;
            }, "_FairySkillConfigCanvas_Label2.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[104];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                saveBtn.label = _arg_1;
            }, "saveBtn.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[101];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairySkillConfigCanvas_Label3.text = _arg_1;
            }, "_FairySkillConfigCanvas_Label3.text");
            result[5] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

