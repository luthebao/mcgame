// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NpcFuncPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.containers.Canvas;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.RoundedButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.game.object.Npc;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.adobe.crypto.MD5;
    import flash.utils.Timer;
    import mx.events.FlexEvent;
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

    public class NpcFuncPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2141324026npcIcon:Image;
        private var _550778329canvas1:Canvas;
        private var _1050738715questViewList:List;
        private var _1908420852typeButton:RoundedButton;
        private var _1782850756questType:int = 0;
        private var questList:Object;
        private var _3237038info:IntroText;
        private var _241352511button1:BasicGlowButton;
        private var npcQuestList:Object;
        private var _2141470988npcName:RoundedLabel;
        private var questListAC:ArrayCollection;
        public var _NpcFuncPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _NpcFuncPanel_BasicTxtButton1:BasicTxtButton;
        public var npc:Npc;
        private var npcId:Number;
        private var npcLoopList:Object;
        private var listRow:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":278,
                    "height":398,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_NpcFuncPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvas1",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "25";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"info",
                                    "events":{"mouseDown":"__info_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":108,
                                            "width":248,
                                            "x":4,
                                            "y":73
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"button1",
                                    "events":{"click":"__button1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":332.55,
                                            "styleName":"BtnStdRed",
                                            "x":103.75,
                                            "width":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"npcIcon",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":16,
                                            "y":12,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"npcName",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":77,
                                            "y":10,
                                            "text":"Label",
                                            "width":171
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedButton,
                                    "id":"typeButton",
                                    "events":{"click":"__typeButton_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":77,
                                            "y":36,
                                            "width":62,
                                            "styleName":"BtnRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":List,
                                    "id":"questViewList",
                                    "events":{
                                        "itemClick":"__questViewList_itemClick",
                                        "mouseDown":"__questViewList_mouseDown"
                                    },
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalAlign = "middle";
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CSSBorder",
                                            "width":213,
                                            "labelField":"name",
                                            "horizontalScrollPolicy":"off",
                                            "height":120,
                                            "x":22,
                                            "y":208
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_NpcFuncPanel_BasicTxtButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.paddingTop = 2;
                                        this.paddingBottom = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":185,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                })]});
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var timerDic:Dictionary = new Dictionary();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function NpcFuncPanel()
        {
            mx_internal::_document = this;
            this.width = 278;
            this.height = 398;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NpcFuncPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get npcIcon():Image
        {
            return (this._2141324026npcIcon);
        }

        public function set info(_arg_1:IntroText):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        private function updateView():void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:Object;
            createTimer();
            questListAC = new ArrayCollection();
            var _local_1:int = -1;
            if (questList)
            {
                for each (_local_3 in questList)
                {
                    if (_local_3)
                    {
                        if (ToolKit.isEqual(_local_3.data.startNpc, npc.id))
                        {
                            if (((ToolKit.isEqual(_local_3.state, GamePredef.ST_QUEST_ENOUGHLEVEL)) || (ToolKit.isEqual(_local_3.state, GamePredef.ST_QUEST_CANTAKE))))
                            {
                                if (ToolKit.isBigThan(_local_3.state, _local_1))
                                {
                                    _local_1 = _local_3.state;
                                };
                                questListAC.addItem({
                                    "id":_local_3.data.id,
                                    "type":1,
                                    "sort1":_local_3.state,
                                    "sort2":_local_3.id,
                                    "name":_local_3.data.name,
                                    "icon":ResManager[("ICON_QUEST_STATE_" + _local_3.state)],
                                    "data":_local_3
                                });
                                listRow++;
                                questType = 1;
                            };
                        };
                        _local_4 = false;
                        if (_local_3.data.finishNpc == -1)
                        {
                            if (npc.classId == _core.player.classId)
                            {
                                _local_4 = true;
                            };
                        };
                        if (((ToolKit.isEqual(_local_3.data.finishNpc, npc.id)) || (_local_4)))
                        {
                            if (((ToolKit.isEqual(_local_3.state, GamePredef.ST_QUEST_ISTAKE)) || (ToolKit.isEqual(_local_3.state, GamePredef.ST_QUEST_CANFINISH))))
                            {
                                if (ToolKit.isBigThan(_local_3.state, _local_1))
                                {
                                    _local_1 = _local_3.state;
                                };
                                questListAC.addItem({
                                    "id":_local_3.data.id,
                                    "type":1,
                                    "sort1":_local_3.state,
                                    "sort2":_local_3.id,
                                    "name":_local_3.data.name,
                                    "icon":ResManager[("ICON_QUEST_STATE_" + _local_3.state)],
                                    "data":_local_3
                                });
                                listRow++;
                                questType = 2;
                            };
                        };
                    };
                };
            };
            if (npcLoopList)
            {
                for (_local_5 in npcLoopList)
                {
                    if (npcLoopList[_local_5])
                    {
                        if (npcLoopList[_local_5].canTake)
                        {
                            if (_local_1 < 0)
                            {
                                _local_1 = GamePredef.ST_QUEST_CANTAKE;
                            };
                            _local_6 = _core.data.getData(GamePredef.TBL_QUEST_LOOP, _local_5);
                            if (_local_6)
                            {
                                questListAC.addItem({
                                    "id":_local_5,
                                    "type":2,
                                    "sort1":GamePredef.ST_QUEST_CANTAKE,
                                    "sort2":_local_5,
                                    "name":(_local_6.name + Language.NPCFUNCPANEL_S[2]),
                                    "icon":ResManager[("ICON_QUEST_STATE_" + GamePredef.ST_QUEST_CANTAKE)],
                                    "data":_local_6
                                });
                                listRow++;
                            };
                        };
                    };
                };
            };
            var _local_2:Sort = new Sort();
            _local_2.fields = [new SortField("type", true, true), new SortField("sort1", true, true), new SortField("sort2", true, false)];
            questListAC.sort = _local_2;
            questListAC.refresh();
            npc.state = _local_1;
            questViewList.dataProvider = questListAC;
            questViewList.rowCount = listRow;
            info.text = npc.onServiceText;
        }

        override public function initialize():void
        {
            var target:NpcFuncPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NpcFuncPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_NpcFuncPanelWatcherSetupUtil");
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

        private function clearView():void
        {
            npcId = -1;
            npcQuestList = null;
            info.text = "";
            info.htmlText = "";
            listRow = 0;
        }

        [Bindable(event="propertyChange")]
        public function get npcName():RoundedLabel
        {
            return (this._2141470988npcName);
        }

        [Bindable(event="propertyChange")]
        public function get typeButton():RoundedButton
        {
            return (this._1908420852typeButton);
        }

        private function timerComplete(_arg_1:TimerEvent):void
        {
            _arg_1.currentTarget.removeEventListener(TimerEvent.TIMER, timerRepeat);
            _arg_1.currentTarget.removeEventListener(TimerEvent.TIMER_COMPLETE, timerComplete);
        }

        public function __typeButton_click(_arg_1:MouseEvent):void
        {
            funcClick();
        }

        public function __info_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function funcClick():void
        {
            var nid:uint;
            var getBank:Function;
            npc = _core.getNpc(npcId);
            if (((npc) && (((npc.npcType == GamePredef.NPC_TYPE_HEAL) || (npc.npcType == GamePredef.NPC_TYPE_TRANSPORT)) || (npc.npcType == GamePredef.NPC_TYPE_TUTOR))))
            {
                _core.view.getUI(ViewManager.PANEL_NPCFUNCOTHER).setNpc(npc);
                visible = false;
                return;
            };
            if (ToolKit.isBigThan(npcId, 0))
            {
                nid = npcId;
                if (((npc.npcType == GamePredef.NPC_TYPE_BANK) || (npc.npcType == GamePredef.NPC_TYPE_AUCTION)))
                {
                    if (_core.delPass)
                    {
                        _core.remote.npcFuncClick(npcId, _core.delPass);
                    }
                    else
                    {
                        getBank = function (_arg_1:String):void
                        {
                            var _local_2:String;
                            if (_arg_1)
                            {
                                _local_2 = MD5.hash(_arg_1);
                                _core.remote.npcFuncClick(nid, _local_2);
                            };
                        };
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.NPCFUNCPANEL_S[3], getBank);
                    };
                }
                else
                {
                    _core.remote.npcFuncClick(npcId);
                };
            };
            visible = false;
        }

        public function set npcName(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2141470988npcName;
            if (_local_2 !== _arg_1)
            {
                this._2141470988npcName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npcName", _local_2, _arg_1));
            };
        }

        public function __button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        private function createTimer():void
        {
            var _local_1:*;
            var _local_2:Timer;
            removeTimerAll();
            if (questList)
            {
                for each (_local_1 in questList)
                {
                    if (((_local_1) && (_local_1.lastTime)))
                    {
                        _local_2 = new Timer(1000, int(_local_1.lastTime));
                        timerDic[_local_2] = _local_1.data.id;
                        _local_2.addEventListener(TimerEvent.TIMER, timerRepeat);
                        _local_2.addEventListener(TimerEvent.TIMER_COMPLETE, timerComplete);
                        _local_2.start();
                    };
                };
            };
        }

        public function set button1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._241352511button1;
            if (_local_2 !== _arg_1)
            {
                this._241352511button1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button1", _local_2, _arg_1));
            };
        }

        public function __questViewList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get info():IntroText
        {
            return (this._3237038info);
        }

        public function set canvas1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._550778329canvas1;
            if (_local_2 !== _arg_1)
            {
                this._550778329canvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas1", _local_2, _arg_1));
            };
        }

        private function mouseWheelHandler(_arg_1:MouseEvent):void
        {
            var _local_2:MouseEvent = new MouseEvent(MouseEvent.MOUSE_WHEEL);
            _local_2.delta = _arg_1.delta;
        }

        [Bindable(event="propertyChange")]
        public function get questViewList():List
        {
            return (this._1050738715questViewList);
        }

        public function set npcIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._2141324026npcIcon;
            if (_local_2 !== _arg_1)
            {
                this._2141324026npcIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npcIcon", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get questType():int
        {
            return (this._1782850756questType);
        }

        private function takeLoop(_arg_1:Number):void
        {
            if (npc)
            {
                _core.remote.takeLoop(_arg_1, npc.id);
            }
            else
            {
                _core.remote.takeLoop(_arg_1, -1);
            };
        }

        private function questClick():void
        {
            var _local_1:Object;
            var _local_2:*;
            if (questViewList.selectedItem)
            {
                hide();
                if (questViewList.selectedItem.type == 1)
                {
                    _local_1 = questViewList.selectedItem.data;
                    _local_2 = _core.view.getUI(ViewManager.PANEL_QUEST);
                    _local_2.initQuest(_local_1, npc);
                    _local_2.show();
                }
                else
                {
                    if (questViewList.selectedItem.type == 2)
                    {
                        takeLoop(questViewList.selectedItem.id);
                    };
                };
            };
        }

        private function removeTimerAll():void
        {
            var _local_1:Object;
            for (_local_1 in timerDic)
            {
                if (_local_1)
                {
                    _local_1 = Timer(_local_1);
                    _local_1.removeEventListener(TimerEvent.TIMER, timerRepeat);
                    _local_1.removeEventListener(TimerEvent.TIMER_COMPLETE, timerComplete);
                    _local_1.stop();
                    delete timerDic[_local_1];
                };
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            clearView();
            removeTimerAll();
        }

        [Bindable(event="propertyChange")]
        public function get button1():BasicGlowButton
        {
            return (this._241352511button1);
        }

        private function timerRepeat(_arg_1:TimerEvent):void
        {
            var _local_2:Object;
            if (questList)
            {
                _local_2 = questList[timerDic[_arg_1.currentTarget]];
                if (((_local_2) && (_local_2.lastTime)))
                {
                    _local_2.lastTime = int(_local_2.lastTime);
                    _local_2.lastTime--;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get canvas1():Canvas
        {
            return (this._550778329canvas1);
        }

        private function _NpcFuncPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NPCFUNCPANEL_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NpcFuncPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_NpcFuncPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NPCFUNCOTHER_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button1.label = _arg_1;
            }, "button1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NPCFUNCPANEL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NpcFuncPanel_BasicTxtButton1.label = _arg_1;
            }, "_NpcFuncPanel_BasicTxtButton1.label");
            result[2] = binding;
            return (result);
        }

        public function set typeButton(_arg_1:RoundedButton):void
        {
            var _local_2:Object = this._1908420852typeButton;
            if (_local_2 !== _arg_1)
            {
                this._1908420852typeButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeButton", _local_2, _arg_1));
            };
        }

        public function set questViewList(_arg_1:List):void
        {
            var _local_2:Object = this._1050738715questViewList;
            if (_local_2 !== _arg_1)
            {
                this._1050738715questViewList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questViewList", _local_2, _arg_1));
            };
        }

        private function showQuest(_arg_1:Number):void
        {
            npc = _core.getNpc(_arg_1);
            if (npcQuestList)
            {
                npc.state = npcQuestList.state;
                questList = npcQuestList.list;
            }
            else
            {
                questList = null;
            };
            visible = true;
            updateView();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (visible == false)
            {
                initView();
            };
        }

        public function npcFuncInit(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:*;
            if (!_arg_1)
            {
                return;
            };
            if (_core.state != GamePredef.ST_NORMAL)
            {
                return;
            };
            if (_core.view.getUI(ViewManager.STAGE_BATTLE).visible)
            {
                return;
            };
            if (ToolKit.isEqual(_arg_1.npcType, GamePredef.NPC_TYPE_CALLBOARD))
            {
                _core.view.getUI(ViewManager.PANEL_CALLBOARD).visible = true;
                return;
            };
            npcId = _arg_1.npcId;
            visible = true;
            var _local_2:Npc = _core.getNpc(npcId);
            if (_local_2)
            {
                npcIcon.source = ResManager.getIconUrl(_local_2.iconCode);
            };
            npcName.text = _arg_1.npcName;
            if (((_arg_1.loopInfo) && (_arg_1.loopInfo.flag)))
            {
                npcLoopList = _arg_1.loopInfo.d;
            }
            else
            {
                npcLoopList = null;
            };
            if (ToolKit.isSmallOrEqual(_arg_1.npcQuest.state, 0))
            {
                if (npcLoopList)
                {
                    if (_arg_1.npcType == GamePredef.NPC_TYPE_SHOP)
                    {
                        typeButton.visible = true;
                        typeButton.label = GamePredef.NPC_TYPE_NAME[_arg_1.npcType];
                    }
                    else
                    {
                        typeButton.visible = false;
                    };
                    showQuest(npcId);
                    return;
                };
                if (ToolKit.isBigThan(_arg_1.npcType, 0))
                {
                    funcClick();
                    visible = false;
                    return;
                };
                if ((((_local_2) && (_local_2.onServiceText)) && (_local_2.onServiceText.length > 0)))
                {
                    _local_2.view.onSay(_local_2.onServiceText);
                };
                visible = false;
                return;
            };
            if (_arg_1.npcType < 0)
            {
                typeButton.visible = false;
            }
            else
            {
                typeButton.visible = true;
                typeButton.label = GamePredef.NPC_TYPE_NAME[_arg_1.npcType];
            };
            npcQuestList = {};
            npcQuestList.state = _arg_1.npcQuest.state;
            npcQuestList.npcId = _arg_1.npcQuest.npcId;
            npcQuestList.list = {};
            for each (_local_3 in _arg_1.npcQuest.list)
            {
                npcQuestList.list[_local_3.qid] = _core.data.getChaQuestFullData(_local_3);
                if (_core.player.questList[_local_3.qid])
                {
                    if (_core.player.questList[_local_3.qid].clsData)
                    {
                        npcQuestList.list[_local_3.qid].clsData = _core.player.questList[_local_3.qid].clsData;
                    };
                };
            };
            showQuest(npcId);
            for each (_local_4 in questList)
            {
                _core.nextGuide(ViewManager.PANEL_NPCFUNC, _local_4.data.name, npcId);
            };
        }

        public function set questType(_arg_1:int):void
        {
            var _local_2:Object = this._1782850756questType;
            if (_local_2 !== _arg_1)
            {
                this._1782850756questType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questType", _local_2, _arg_1));
            };
        }

        private function _NpcFuncPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.NPCFUNCPANEL_S[1];
            _local_1 = Language.NPCFUNCOTHER_U[0];
            _local_1 = Language.NPCFUNCPANEL_S[0];
        }

        public function __questViewList_itemClick(_arg_1:ListEvent):void
        {
            questClick();
        }

        public function setInfoText(_arg_1:String):void
        {
            if (visible)
            {
                info.htmlText = _arg_1;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

