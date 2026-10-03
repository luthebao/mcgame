// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CallBoardPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.QuestCanvas;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.collections.ArrayCollection;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import mx.events.PropertyChangeEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.game.config.ItemConfig;
    import mx.events.ListEvent;
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

    public class CallBoardPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1783104352questList:List;
        private var _1603303783takeButton:BasicGlowButton;
        private var _3602qc:QuestCanvas;
        public var _CallBoardPanel_DelayButton1:DelayButton;
        public var _CallBoardPanel_DelayButton2:DelayButton;
        public var _CallBoardPanel_DelayButton3:DelayButton;
        public var _CallBoardPanel_DelayButton4:DelayButton;
        public var _CallBoardPanel_DelayButton5:DelayButton;
        public var _CallBoardPanel_DelayButton6:DelayButton;
        private var firstTimeFlag:Boolean = true;
        private var refreshNum:int = 0;
        private var qList:Object;
        public var _CallBoardPanel_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":480,
                    "height":362,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_CallBoardPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":280,
                                "y":40,
                                "width":147,
                                "x":12,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":List,
                                    "id":"questList",
                                    "events":{
                                        "itemClick":"__questList_itemClick",
                                        "mouseDown":"__questList_mouseDown"
                                    },
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CSSBorder",
                                            "horizontalScrollPolicy":"off",
                                            "y":0,
                                            "height":210,
                                            "width":145,
                                            "x":1,
                                            "itemRenderer":_CallBoardPanel_ClassFactory1_c()
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"_CallBoardPanel_DelayButton1",
                                    "events":{"click":"___CallBoardPanel_DelayButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":91,
                                            "y":248,
                                            "styleName":"BtnCallBoardFlag0",
                                            "width":29,
                                            "height":29
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"_CallBoardPanel_DelayButton2",
                                    "events":{"click":"___CallBoardPanel_DelayButton2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27,
                                            "y":217,
                                            "styleName":"BtnCallBoardFlag1",
                                            "width":29,
                                            "height":29
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"_CallBoardPanel_DelayButton3",
                                    "events":{"click":"___CallBoardPanel_DelayButton3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":59,
                                            "y":217,
                                            "styleName":"BtnCallBoardFlag2",
                                            "width":29,
                                            "height":29
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"_CallBoardPanel_DelayButton4",
                                    "events":{"click":"___CallBoardPanel_DelayButton4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":91,
                                            "y":217,
                                            "styleName":"BtnCallBoardFlag3",
                                            "width":29,
                                            "height":29
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"_CallBoardPanel_DelayButton5",
                                    "events":{"click":"___CallBoardPanel_DelayButton5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27,
                                            "y":248,
                                            "styleName":"BtnCallBoardFlag4",
                                            "width":29,
                                            "height":29
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"_CallBoardPanel_DelayButton6",
                                    "events":{"click":"___CallBoardPanel_DelayButton6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":59,
                                            "y":248,
                                            "styleName":"BtnCallBoardFlag5",
                                            "width":29,
                                            "height":29
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":QuestCanvas,
                        "id":"qc",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "x":164
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"takeButton",
                        "events":{"click":"__takeButton_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":59,
                                "y":322,
                                "styleName":"BtnStdRed",
                                "width":52.2
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

        public function CallBoardPanel()
        {
            mx_internal::_document = this;
            this.width = 480;
            this.height = 362;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CallBoardPanel._watcherSetupUtil = _arg_1;
        }


        private function onTakeCBQuest(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.f)))
            {
                if (qList)
                {
                    delete qList[_arg_1.i];
                    updateView();
                };
            };
        }

        public function ___CallBoardPanel_DelayButton1_click(_arg_1:MouseEvent):void
        {
            refresh(0);
        }

        public function ___CallBoardPanel_DelayButton3_click(_arg_1:MouseEvent):void
        {
            refresh(2);
        }

        public function ___CallBoardPanel_DelayButton5_click(_arg_1:MouseEvent):void
        {
            refresh(4);
        }

        private function updateView():void
        {
            var _local_1:ArrayCollection;
            var _local_2:String;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            viewClear();
            if (qList)
            {
                _local_1 = new ArrayCollection();
                for (_local_2 in qList)
                {
                    if (qList[_local_2])
                    {
                        qList[_local_2].sIndex = _local_2;
                        _local_1.addItem({
                            "text":qList[_local_2].data.name,
                            "color":GamePredef.MSG_ITEM_COLOR[qList[_local_2].c],
                            "questData":qList[_local_2]
                        });
                    };
                };
                questList.dataProvider = _local_1;
            };
        }

        override public function initialize():void
        {
            var target:CallBoardPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CallBoardPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CallBoardPanelWatcherSetupUtil");
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

        private function listClick():void
        {
            if (questList.selectedItem)
            {
                qc.questData = questList.selectedItem.questData;
                if (ToolKit.isEqual(questList.selectedItem.questData.state, GamePredef.ST_QUEST_CANTAKE))
                {
                    takeButton.visible = true;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get qc():QuestCanvas
        {
            return (this._3602qc);
        }

        [Bindable(event="propertyChange")]
        public function get takeButton():BasicGlowButton
        {
            return (this._1603303783takeButton);
        }

        private function takeQuest():void
        {
            if (questList.selectedItem)
            {
                if (_core.player.qn >= GamePredef.MAX_QUEST_NUM)
                {
                    _core.sysMsg(Language.CALLBOARDPANEL_S[3]);
                }
                else
                {
                    _core.remote.call("takeCBQuest", new Responder(onTakeCBQuest), questList.selectedItem.questData.sIndex);
                    takeButton.visible = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get questList():List
        {
            return (this._1783104352questList);
        }

        private function viewClear():void
        {
            takeButton.visible = false;
            qc.questData = null;
        }

        private function onInitCB(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            _local_2 = "";
            if (_arg_1)
            {
                if (((_arg_1.f) && (_arg_1.data)))
                {
                    refreshNum = _arg_1.n;
                    qList = {};
                    for (_local_3 in _arg_1.data)
                    {
                        if (_arg_1.data[_local_3])
                        {
                            qList[_local_3] = _core.data.getChaQuestFullData(_arg_1.data[_local_3]);
                        };
                    };
                    updateView();
                }
                else
                {
                    if (_arg_1.t == 1)
                    {
                        _local_2 = Language.CALLBOARDPANEL_S[0];
                        _local_2 = _local_2.replace("{num}", GamePredef.MAX_CALLBOARD_QUEST_NUM);
                        _core.sysMsg(_local_2);
                    }
                    else
                    {
                        if (_arg_1.t == 2)
                        {
                            _core.sysMsg(Language.CALLBOARDPANEL_S[2]);
                        };
                    };
                };
            };
        }

        public function set takeButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1603303783takeButton;
            if (_local_2 !== _arg_1)
            {
                this._1603303783takeButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "takeButton", _local_2, _arg_1));
            };
        }

        public function __questList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set qc(_arg_1:QuestCanvas):void
        {
            var _local_2:Object = this._3602qc;
            if (_local_2 !== _arg_1)
            {
                this._3602qc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qc", _local_2, _arg_1));
            };
        }

        private function _CallBoardPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CallBoardPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function set questList(_arg_1:List):void
        {
            var _local_2:Object = this._1783104352questList;
            if (_local_2 !== _arg_1)
            {
                this._1783104352questList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questList", _local_2, _arg_1));
            };
        }

        public function __takeButton_click(_arg_1:MouseEvent):void
        {
            takeQuest();
        }

        public function ___CallBoardPanel_DelayButton2_click(_arg_1:MouseEvent):void
        {
            refresh(1);
        }

        public function ___CallBoardPanel_DelayButton4_click(_arg_1:MouseEvent):void
        {
            refresh(3);
        }

        public function ___CallBoardPanel_DelayButton6_click(_arg_1:MouseEvent):void
        {
            refresh(5);
        }

        public function reset():void
        {
            firstTimeFlag = true;
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initCB", new Responder(onInitCB));
        }

        private function _CallBoardPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CALLBOARDPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CallBoardPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_CallBoardPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CALLBOARDPANEL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CallBoardPanel_DelayButton1.toolTip = _arg_1;
            }, "_CallBoardPanel_DelayButton1.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CALLBOARDPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CallBoardPanel_DelayButton2.toolTip = _arg_1;
            }, "_CallBoardPanel_DelayButton2.toolTip");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CALLBOARDPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CallBoardPanel_DelayButton3.toolTip = _arg_1;
            }, "_CallBoardPanel_DelayButton3.toolTip");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CALLBOARDPANEL_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CallBoardPanel_DelayButton4.toolTip = _arg_1;
            }, "_CallBoardPanel_DelayButton4.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CALLBOARDPANEL_S[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CallBoardPanel_DelayButton5.toolTip = _arg_1;
            }, "_CallBoardPanel_DelayButton5.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CALLBOARDPANEL_S[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CallBoardPanel_DelayButton6.toolTip = _arg_1;
            }, "_CallBoardPanel_DelayButton6.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                takeButton.label = _arg_1;
            }, "takeButton.label");
            result[7] = binding;
            return (result);
        }

        private function refresh(_arg_1:int):void
        {
            if (((_arg_1 >= 0) && (_arg_1 <= 5)))
            {
                if (_core.haveItem(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_CALLBOARD[_arg_1], 1))
                {
                    _core.remote.call("initCBByItem", new Responder(onInitCB), _arg_1);
                }
                else
                {
                    if (_arg_1 == 1)
                    {
                        _core.sysMsg(Language.CALLBOARDPANEL_S[4]);
                    }
                    else
                    {
                        if (_arg_1 == 0)
                        {
                            _core.sysMsg(Language.CALLBOARDPANEL_S[20]);
                        }
                        else
                        {
                            if (_arg_1 == 2)
                            {
                                _core.sysMsg(Language.CALLBOARDPANEL_S[18]);
                            }
                            else
                            {
                                if (_arg_1 == 3)
                                {
                                    _core.sysMsg(Language.CALLBOARDPANEL_S[19]);
                                }
                                else
                                {
                                    if (_arg_1 == 4)
                                    {
                                        _core.sysMsg(Language.CALLBOARDPANEL_S[22]);
                                    }
                                    else
                                    {
                                        if (_arg_1 == 5)
                                        {
                                            _core.sysMsg(Language.CALLBOARDPANEL_S[21]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function _CallBoardPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CALLBOARDPANEL_U[0];
            _local_1 = Language.CALLBOARDPANEL_S[11];
            _local_1 = Language.CALLBOARDPANEL_S[12];
            _local_1 = Language.CALLBOARDPANEL_S[13];
            _local_1 = Language.CALLBOARDPANEL_S[14];
            _local_1 = Language.CALLBOARDPANEL_S[15];
            _local_1 = Language.CALLBOARDPANEL_S[16];
            _local_1 = Language.QUESTMANAGER_U[2];
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((_arg_1) && (firstTimeFlag)))
            {
                initView();
                firstTimeFlag = false;
            };
            if (!_arg_1)
            {
                viewClear();
            };
        }

        public function __questList_itemClick(_arg_1:ListEvent):void
        {
            listClick();
        }


    }
}//package com.qeedoo.ui.view.compDragable

