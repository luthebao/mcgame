// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.QuestPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.QuestCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.containers.HBox;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.game.object.Npc;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.controls.Button;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import flash.events.MouseEvent;
    import flash.utils.setTimeout;
    import mx.core.UIComponent;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import mx.core.IUITextField;
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

    public class QuestPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2141324026npcIcon:Image;
        private var _3602qc:QuestCanvas;
        private var _1603303783takeButton:BasicGlowButton;
        private var _selectId:Number;
        private var _821490697slotIdList:Array;
        private var _3237038info:LinkTextArea;
        private var _11548545buttonBar:HBox;
        private var _1783350356questData:Object;
        private var _2141470988npcName:RoundedLabel;
        private var _1990131276cancelButton:BasicGlowButton;
        public var _QuestPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1993628251finishButton:BasicGlowButton;
        private var _confirmPetEquipt:Boolean = false;
        private var _confirmPet:Boolean = false;
        private var npc:Npc;
        public var quest:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":480,
                    "height":356,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_QuestPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":327,
                                "y":29,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"buttonBar",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalAlign = "center";
                                        this.horizontalGap = 3;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":149,
                                            "height":31,
                                            "x":10,
                                            "y":292,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"finishButton",
                                                "events":{"click":"__finishButton_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":1,
                                                        "styleName":"BtnStdGreen",
                                                        "width":52.2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"takeButton",
                                                "events":{"click":"__takeButton_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":1,
                                                        "styleName":"BtnStdRed",
                                                        "width":52.2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"cancelButton",
                                                "events":{"click":"__cancelButton_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":80,
                                                        "y":1,
                                                        "styleName":"BtnStdBlue",
                                                        "width":52.2
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"npcName",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":75,
                                            "y":12,
                                            "text":"NPC名字几个字",
                                            "width":87
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"info",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingTop = 3;
                                        this.paddingLeft = 3;
                                        this.paddingRight = 1;
                                        this.backgroundAlpha = 1;
                                        this.backgroundColor = 3172697;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "editable":false,
                                            "width":149,
                                            "x":10,
                                            "y":73,
                                            "styleName":"CanvasBorder",
                                            "height":212
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":QuestCanvas,
                                    "id":"qc",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":305,
                                            "y":12,
                                            "width":303,
                                            "x":167
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"npcIcon",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":48,
                                            "height":48,
                                            "x":17,
                                            "y":15
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
        private var _vm:ViewManager = ViewManager.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function QuestPanel()
        {
            mx_internal::_document = this;
            this.width = 480;
            this.height = 356;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            QuestPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get buttonBar():HBox
        {
            return (this._11548545buttonBar);
        }

        public function set buttonBar(_arg_1:HBox):void
        {
            var _local_2:Object = this._11548545buttonBar;
            if (_local_2 !== _arg_1)
            {
                this._11548545buttonBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonBar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get slotIdList():Array
        {
            return (this._821490697slotIdList);
        }

        public function onAddChaQuest(_arg_1:Object):void
        {
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:String;
            var _local_6:String;
            var _local_7:int;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            _arg_1 = _core.data.getChaQuestFullData(_arg_1);
            if (_arg_1.pos)
            {
                _local_3 = uint(Math.round((_arg_1.pos.x / 10)));
                _local_4 = uint(Math.round((_arg_1.pos.y / 10)));
                _local_5 = (((((((((("<a href='event:L_POS|" + _arg_1.pos.map) + "|") + _local_3) + ",") + _local_4) + "'>[") + _local_3) + ",") + _local_4) + "]</a>");
                _local_6 = Language.QUESTCANVAS_S[20].toString().replace("{map}", TextUtil.getMapHtml(_arg_1.pos.map)).replace("{pos}", _local_5).replace("{name}", _arg_1.pos.name);
                _arg_1.data.posInfo = _local_6;
            };
            if (_arg_1.clsData)
            {
                _local_7 = ((_arg_1.clsData.num + 1) % 10);
                if (_local_7 == 0)
                {
                    _local_7 = 10;
                };
                _local_8 = Language.QUESTCANVAS_S[21].toString().replace("{num}", _local_7);
                _arg_1.data.clsInfo = _local_8;
            };
            var _local_2:int = _arg_1.data.color;
            if (ToolKit.isEqual(_arg_1.data.type, GamePredef.QUEST_TYPE_CALLBOARD))
            {
                _local_2 = _arg_1.c;
            };
            _core.sysBlueMsg(((((((((Language.QUESTPANEL_S[5] + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_QUEST]) + "|") + _arg_1.qid) + "|") + _arg_1.data.name) + "|") + _local_2) + "|0|0]"));
            _core.view.getUI(ViewManager.PANEL_QUESTMANAGER).onAddChaQuest(_arg_1);
            if ((((ToolKit.isEqual(_arg_1.data.type, GamePredef.QUEST_TYPE_NEWHAND)) || (ToolKit.isEqual(_arg_1.data.type, GamePredef.QUEST_TYPE_MAIN))) || (ToolKit.isEqual(_arg_1.data.type, GamePredef.QUEST_TYPE_WORLD))))
            {
                _core.view.getUI(ViewManager.PANEL_QUESTMANAGER).initCanTakeQuest();
            };
            if (visible)
            {
                if ((((quest) && (!(npc))) && (ToolKit.isEqual(quest.id, _arg_1.data.id))))
                {
                    initQuest(_arg_1, null);
                    return;
                };
                if ((((quest) && (npc)) && (ToolKit.isEqual(quest.id, _arg_1.data.id))))
                {
                    _local_9 = false;
                    _local_10 = false;
                    if (_arg_1.data.finishNpc == -1)
                    {
                        if (npc.classId == _core.player.classId)
                        {
                            _local_9 = true;
                        };
                    }
                    else
                    {
                        if (ToolKit.isEqual(_arg_1.data.finishNpc, npc.id))
                        {
                            _local_9 = true;
                        };
                    };
                    if (_arg_1.data.startNpc == -1)
                    {
                        if (npc.classId == _core.player.classId)
                        {
                            _local_10 = true;
                        };
                    }
                    else
                    {
                        if (ToolKit.isEqual(_arg_1.data.startNpc, npc.id))
                        {
                            _local_10 = true;
                        };
                    };
                    if (((_local_9) && (_arg_1.state == GamePredef.ST_QUEST_CANFINISH)))
                    {
                        takeButton.visible = true;
                        initQuest(_arg_1, npc);
                    }
                    else
                    {
                        if (_local_10)
                        {
                            visible = false;
                            takeButton.visible = true;
                        };
                    };
                };
            };
            if (ToolKit.isEqual(_arg_1.data.startNpc, _arg_1.data.finishNpc))
            {
                if (((ToolKit.isBigThan(_arg_1.data.startNpc, 0)) && (_core.getNpc(_arg_1.data.startNpc))))
                {
                    if (((_arg_1.data.startNpc == -1) && (npc.classId == _core.player.classId)))
                    {
                        _core.setNpcState(npc.id);
                    }
                    else
                    {
                        _core.setNpcState(_arg_1.data.startNpc);
                    };
                };
            }
            else
            {
                if (((ToolKit.isBigThan(_arg_1.data.startNpc, 0)) && (_core.getNpc(_arg_1.data.startNpc))))
                {
                    _core.setNpcState(_arg_1.data.startNpc);
                };
                if (((ToolKit.isBigThan(_arg_1.data.finishNpc, 0)) && (_core.getNpc(_arg_1.data.finishNpc))))
                {
                    _core.setNpcState(_arg_1.data.finishNpc);
                };
            };
        }

        public function onClassQuest(_arg_1:Object, _arg_2:Number):void
        {
            if (_arg_1.flag == 1)
            {
                _arg_1.data = _core.data.getChaQuestFullData(_arg_1.data);
                initQuest(_arg_1.data, _core.getNpc(_arg_2));
                show();
            }
            else
            {
                if (_arg_1.flag == 2)
                {
                    _core.sysMidNote(Language.QUESTPANEL_S[11]);
                }
                else
                {
                    if (_arg_1.flag == 3)
                    {
                        _core.sysMidNote(Language.QUESTPANEL_S[12]);
                    };
                };
            };
        }

        private function showButtonBar(_arg_1:Button, _arg_2:Button):void
        {
            buttonBar.visible = true;
            _arg_1.visible = true;
            _arg_1.includeInLayout = true;
            if (_arg_2)
            {
                _arg_2.visible = true;
                _arg_2.includeInLayout = true;
            };
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

        private function finishQuest(_arg_1:Number):Boolean
        {
            _selectId = _arg_1;
            if (quest)
            {
                if (ToolKit.isEqual(quest.at, 2))
                {
                    if (_arg_1 > 0)
                    {
                        if ((((checkBag()) && (checkPet())) && (checkEquipt())))
                        {
                            _confirmPet = false;
                            _confirmPetEquipt = false;
                            if (finishButton)
                            {
                                finishButton.visible = false;
                            };
                            _core.remote.call("finishQuest", new Responder(onFinishQuest), {
                                "i":quest.id,
                                "s":_arg_1
                            });
                            return (true);
                        };
                    }
                    else
                    {
                        _core.sysMsg(Language.QUESTPANEL_S[6]);
                    };
                }
                else
                {
                    if ((((checkBag()) && (checkPet())) && (checkEquipt())))
                    {
                        _confirmPet = false;
                        _confirmPetEquipt = false;
                        if (finishButton)
                        {
                            finishButton.visible = false;
                        };
                        if (npc)
                        {
                            _core.remote.call("finishQuest", new Responder(onFinishQuest), {
                                "i":quest.id,
                                "s":_arg_1,
                                "n":npc.id
                            });
                        }
                        else
                        {
                            _core.remote.call("finishQuest", new Responder(onFinishQuest), {
                                "i":quest.id,
                                "s":_arg_1,
                                "n":-1
                            });
                        };
                        return (true);
                    };
                };
            };
            _confirmPet = false;
            _confirmPetEquipt = false;
            return (false);
        }

        private function clearView():void
        {
            npcName.text = "";
            info.text = "";
            info.htmlText = "";
            buttonBar.visible = false;
            takeButton.visible = false;
            takeButton.includeInLayout = false;
            finishButton.visible = false;
            finishButton.includeInLayout = false;
            cancelButton.visible = false;
            cancelButton.includeInLayout = false;
        }

        [Bindable(event="propertyChange")]
        public function get npcName():RoundedLabel
        {
            return (this._2141470988npcName);
        }

        override public function initialize():void
        {
            var target:QuestPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _QuestPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_QuestPanelWatcherSetupUtil");
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
        public function get qc():QuestCanvas
        {
            return (this._3602qc);
        }

        private function takeQuest():void
        {
            if (quest)
            {
                if (_core.player.qn >= GamePredef.MAX_QUEST_NUM)
                {
                    _core.sysMsg(Language.QUESTPANEL_S[1]);
                }
                else
                {
                    takeButton.visible = false;
                    if (ToolKit.isEqual(quest.type, 11))
                    {
                        _core.remote.call("takeBuildQuest", new Responder(onTakeQuest), {
                            "id":quest.id,
                            "nid":questData.nid
                        });
                    }
                    else
                    {
                        if (npc)
                        {
                            _core.remote.call("takeQuest", new Responder(onTakeQuest), quest.id, npc.id);
                        }
                        else
                        {
                            _core.remote.call("takeQuest", new Responder(onTakeQuest), quest.id, -1);
                        };
                    };
                    _core.nextGuide(ViewManager.MAIN_QUEST_GUIDE, quest.name, -1);
                };
            };
        }

        private function _QuestPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.QUESTPANEL_U[0];
            _local_1 = Language.QUESTMANAGER_U[0];
            _local_1 = Language.QUESTMANAGER_U[2];
            _local_1 = Language.QUESTMANAGER_U[1];
            _local_1 = questData;
        }

        private function cancelQuest():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.cancelQuest(quest.id);
                };
            };
            var msgString:String = Language.QUESTMANAGER_S[1].toString().replace("{name}", (getQuestNamePrefix(quest) + quest.name));
            Alert.show(msgString, "", (Alert.YES | Alert.NO), this, func);
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

        [Bindable(event="propertyChange")]
        public function get takeButton():BasicGlowButton
        {
            return (this._1603303783takeButton);
        }

        public function onCancelQuest(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1.flag)
            {
                visible = false;
                if (_core.player)
                {
                    _core.player.qn = _arg_1.qn;
                };
                _local_2 = _core.data.getData(GamePredef.TBL_QUEST, _arg_1.qid);
                if (ToolKit.isEqual(_local_2.startNpc, _local_2.finishNpc))
                {
                    if (((ToolKit.isBigThan(_local_2.startNpc, 0)) && (_core.getNpc(_local_2.startNpc))))
                    {
                        _core.setNpcState(_local_2.startNpc);
                    };
                }
                else
                {
                    if (((ToolKit.isBigThan(_local_2.startNpc, 0)) && (_core.getNpc(_local_2.startNpc))))
                    {
                        _core.setNpcState(_local_2.startNpc);
                    };
                    if (((ToolKit.isBigThan(_local_2.finishNpc, 0)) && (_core.getNpc(_local_2.finishNpc))))
                    {
                        _core.setNpcState(_local_2.finishNpc);
                    };
                };
                _core.view.getUI(ViewManager.PANEL_QUESTMANAGER).onCancelQuest(_arg_1);
            }
            else
            {
                if (_arg_1.info)
                {
                    _core.sysMidNote(_arg_1.info);
                };
            };
        }

        public function initQuest(_arg_1:Object, _arg_2:Npc):void
        {
            if (!_arg_1)
            {
                return;
            };
            this.questData = _arg_1;
            quest = _arg_1.data;
            this.npc = _arg_2;
            initView();
        }

        private function _QuestPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_QuestPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                finishButton.label = _arg_1;
            }, "finishButton.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                takeButton.label = _arg_1;
            }, "takeButton.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cancelButton.label = _arg_1;
            }, "cancelButton.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (questData);
            }, function (_arg_1:Object):void
            {
                qc.questData = _arg_1;
            }, "qc.questData");
            result[4] = binding;
            return (result);
        }

        public function __cancelButton_click(_arg_1:MouseEvent):void
        {
            cancelQuest();
        }

        public function reelQuestInfo(_arg_1:Object):void
        {
            if (_arg_1)
            {
                initQuest(_core.data.getChaQuestFullData(_arg_1), null);
                show();
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

        [Bindable(event="propertyChange")]
        public function get finishButton():BasicGlowButton
        {
            return (this._1993628251finishButton);
        }

        private function callGuide():void
        {
            if ((((quest.id == 2) || (quest.id == 3)) || (quest.id == 6)))
            {
                setTimeout(CallEquActive, 500);
            };
            if (quest.id == 4)
            {
                setTimeout(setFirstPetActive, 500);
            };
        }

        public function onFinishQuest(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:Object;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                if (npc)
                {
                    _local_4 = _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE);
                    (_local_4 as UIComponent).dispatchEvent(new Event(DragableCanvas.EVENT_CLOSE));
                    _core.nextGuide(ViewManager.PANEL_QUEST, questData.data.name, npc.id, GamePredef.GUIDE_TYPE_FINISH_QUEST);
                };
                if (_core.player.questLog == "")
                {
                    _core.player.questLog = "|";
                };
                _core.player.questLog = ((_core.player.questLog + _arg_1.qid) + "|");
                _local_2 = _core.data.getGameData(GamePredef.TBL_QUEST, _arg_1.qid);
                if (ToolKit.isEqual(_local_2.data.next, 1))
                {
                    _core.view.getUI(ViewManager.PANEL_QUESTMANAGER).initCanTakeQuest(npc.id);
                };
                _core.player.qn = _arg_1.qn;
                _core.view.getUI(ViewManager.PANEL_QUESTMANAGER).onFinishQuest(_arg_1);
                _local_3 = _local_2.data.color;
                if (ToolKit.isEqual(_local_2.data.type, GamePredef.QUEST_TYPE_CALLBOARD))
                {
                    _local_3 = _arg_1.c;
                };
                if (_local_2)
                {
                    _core.sysBlueMsg(((((((((Language.QUESTPANEL_S[10] + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_QUEST]) + "|") + _arg_1.qid) + "|") + _local_2.data.name) + "|") + _local_3) + "|0|0]"));
                };
                if (((ToolKit.isBigThan(_local_2.data.finishNpc, 0)) && (_core.getNpc(_local_2.data.finishNpc))))
                {
                    _core.setNpcState(_local_2.data.finishNpc);
                };
                if (((((questData) && (questData.data.finishNpc == -1)) && (npc)) && (npc.classId == _core.player.classId)))
                {
                    _core.setNpcState(npc.id);
                };
                if (((quest) && (ToolKit.isEqual(quest.id, _arg_1.qid))))
                {
                    visible = false;
                    if (((npc) && (npc.view)))
                    {
                        npc.view.onSay(questData.data.completeText);
                    };
                };
            }
            else
            {
                _core.sysMidNote(_arg_1.info);
            };
        }

        [Bindable(event="propertyChange")]
        public function get npcIcon():Image
        {
            return (this._2141324026npcIcon);
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

        private function setFirstPetActive():void
        {
            _vm.changeVisible(ViewManager.PANEL_PETMANAGER);
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_PETMANAGER);
            (_local_1 as PetManagerPanel).changePetState(1);
            _vm.changeVisible(ViewManager.PANEL_PETMANAGER);
        }

        public function __finishButton_click(_arg_1:MouseEvent):void
        {
            finishQuest(qc.selectId);
            callGuide();
        }

        private function getQuestNamePrefix(_arg_1:Object):String
        {
            var _local_3:uint;
            var _local_4:Array;
            var _local_5:uint;
            var _local_2:String = ((GamePredef.QUEST_TYPE_APPR[_arg_1.type]) || (""));
            if (ToolKit.isEqual(_arg_1.type, GamePredef.QUEST_TYPE_ACTIVITY))
            {
                if (((ToolKit.isBigThan(_arg_1.lm, 0)) && (!(ToolKit.isEqual(_arg_1.id, 2766)))))
                {
                    _local_2 = Language.QUESTGUIDE_S[19];
                };
                _local_3 = parseInt(_arg_1.id);
                if (GamePredef.DUPLICATE_TASK_IDS[_local_3])
                {
                    _local_2 = Language.QUESTGUIDE_S[20];
                };
            }
            else
            {
                if (ToolKit.isEqual(_arg_1.type, GamePredef.QUEST_TYPE_LOOP))
                {
                    _local_4 = _arg_1.subType.split("-");
                    _local_5 = parseInt(_local_4[1]);
                    if (GamePredef.QUEST_SUB_TYPE_APPR[_local_5])
                    {
                        _local_2 = GamePredef.QUEST_SUB_TYPE_APPR[_local_5];
                    };
                };
            };
            return (_local_2);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            clearView();
            if (ToolKit.isEqual(questData.state, GamePredef.ST_QUEST_ENOUGHLEVEL))
            {
                return;
            };
            if (ToolKit.isEqual(questData.state, GamePredef.ST_QUEST_CANTAKE))
            {
                showButtonBar(takeButton, null);
            }
            else
            {
                showButtonBar(finishButton, cancelButton);
                if (ToolKit.isEqual(questData.state, GamePredef.ST_QUEST_ISTAKE))
                {
                    finishButton.enabled = false;
                }
                else
                {
                    if (ToolKit.isEqual(questData.state, GamePredef.ST_QUEST_CANFINISH))
                    {
                        finishButton.enabled = true;
                    };
                };
                if (ToolKit.isEqual(questData.data.type, 1))
                {
                    cancelButton.enabled = false;
                }
                else
                {
                    cancelButton.enabled = true;
                };
            };
            if (npc)
            {
                npcName.text = npc.name;
                npcIcon.source = ResManager.getIconUrl(npc.iconCode);
                _core.nextGuide(ViewManager.PANEL_QUEST, questData.data.name, npc.id);
            }
            else
            {
                npcName.text = Language.QUESTPANEL_S[0];
                npcIcon.source = ResManager.getIconUrl(3060090000015);
            };
            info.text = questData.data.startText;
        }

        public function set info(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        public function set questData(_arg_1:Object):void
        {
            var _local_2:Object = this._1783350356questData;
            if (_local_2 !== _arg_1)
            {
                this._1783350356questData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questData", _local_2, _arg_1));
            };
        }

        private function checkBag():Boolean
        {
            var _local_1:int;
            var _local_2:*;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Boolean;
            if (((questData) && (questData.award)))
            {
                _local_1 = 0;
                switch (Number(questData.data.at))
                {
                    case 1:
                        for each (_local_3 in questData.award)
                        {
                            if (((_local_3) && (ToolKit.isEqual(_local_3.kind, GamePredef.QUEST_AWARD_ITEM))))
                            {
                                _local_1++;
                            };
                        };
                        break;
                    case 2:
                        _local_1 = 1;
                        break;
                    case 3:
                        for each (_local_3 in questData.award)
                        {
                            _local_4 = _core.getTemplateData(_local_3.type, _local_3.itemId).reqClass;
                            _local_5 = (_local_4.indexOf((("|" + _core.player.classId) + "|")) >= 0);
                            if ((((_local_3) && (ToolKit.isEqual(_local_3.kind, GamePredef.QUEST_AWARD_ITEM))) && (_local_5)))
                            {
                                _local_1++;
                            };
                        };
                        break;
                };
                if (!_core.player.enoughBag(_local_1))
                {
                    _core.sysMsg(Language.QUESTPANEL_S[13]);
                    return (false);
                };
                _local_2 = 0;
                for each (_local_3 in questData.award)
                {
                    if (((_local_3) && (ToolKit.isEqual(_local_3.kind, GamePredef.QUEST_AWARD_PET))))
                    {
                        _local_2++;
                    };
                };
                if (!_core.player.enoughPetSlot(_local_2))
                {
                    _core.sysMsg(Language.MAILPANEL_S[101]);
                    return (false);
                };
                return (true);
            };
            return (true);
        }

        public function __takeButton_click(_arg_1:MouseEvent):void
        {
            takeQuest();
        }

        [Bindable(event="propertyChange")]
        public function get questData():Object
        {
            return (this._1783350356questData);
        }

        [Bindable(event="propertyChange")]
        public function get info():LinkTextArea
        {
            return (this._3237038info);
        }

        private function CallEquActive():void
        {
            var _local_1:Object;
            var _local_2:Timer;
            slotIdList = new Array();
            for each (_local_1 in _core.data.sList)
            {
                if (((!(_local_1 == null)) && (_local_1.type == 18)))
                {
                    slotIdList.push(_local_1.id);
                };
            };
            _local_2 = new Timer(800, 10);
            if (_local_2.running)
            {
                _local_2.reset();
            }
            else
            {
                _local_2.start();
            };
            _local_2.addEventListener(TimerEvent.TIMER, setEquActive);
        }

        private function checkEquipt():Boolean
        {
            var i:String;
            var tmp:Object;
            var count:int;
            var pSlotArr:Array;
            var subSlotInfo:Object;
            var j:Object;
            var slotData:Object;
            var iData:Object;
            var slotTemp:Object;
            var func:Function;
            var msg:String;
            var requireList:Object = _core.data.gameDataIndex[GamePredef.TBL_QUEST_REQUIRE][quest.id];
            if (requireList)
            {
                for (i in requireList)
                {
                    if ((((requireList[i]) && (requireList[i].kind == GamePredef.QUEST_REQUIRE_ITEM)) && (requireList[i].type == GamePredef.TBL_EQUIPT_TEMPLATE)))
                    {
                        tmp = _core.getTemplateData(GamePredef.TBL_EQUIPT_TEMPLATE, requireList[i].itemId);
                        if (((tmp) && (tmp.kind == GamePredef.ITEM_KIND_PETEQU)))
                        {
                            count = 0;
                            pSlotArr = new Array();
                            for (j in _core.data.sList)
                            {
                                slotData = _core.data.sList[j];
                                iData = _core.data.getGameData(slotData.type, slotData.itemId);
                                if ((((((slotData) && (iData)) && (Number(slotData.type) == GamePredef.TBL_EQUIPT_INSTANCE)) && (slotData.stackNum > 0)) && (ToolKit.isEqual(_core.basic.getColorByQuality(requireList[i].q), iData.color))))
                                {
                                    slotTemp = _core.getTemplateData(slotData.type, slotData.itemId, false);
                                    if (slotTemp)
                                    {
                                        if (slotTemp.id == tmp.id)
                                        {
                                            count = (count + Number(slotData.stackNum));
                                            if (Number(iData.upgradeNum) == 0)
                                            {
                                                return (true);
                                            };
                                            if (subSlotInfo)
                                            {
                                                if (ToolKit.isSmallThan(iData.upgradeNum, subSlotInfo.upgradeNum))
                                                {
                                                    subSlotInfo = iData;
                                                };
                                            }
                                            else
                                            {
                                                subSlotInfo = iData;
                                            };
                                        };
                                    };
                                };
                            };
                            if (subSlotInfo)
                            {
                                if (ToolKit.isBigThan(subSlotInfo.upgradeNum, 0))
                                {
                                    if (!_confirmPetEquipt)
                                    {
                                        func = function (_arg_1:CloseEvent):void
                                        {
                                            if (_arg_1.detail == Alert.YES)
                                            {
                                                _confirmPetEquipt = true;
                                                finishQuest(_selectId);
                                            };
                                        };
                                        msg = Language.QUESTPANEL_S[23].replace("{euipt}", tmp.name).replace("{starNum}", subSlotInfo.upgradeNum);
                                        Alert.show(msg, "", 3, this, func);
                                        return (false);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            return (true);
        }

        private function setEquActive(_arg_1:TimerEvent):void
        {
            var _local_2:* = slotIdList.pop();
            _core.remote.useItem(1, -1, _local_2);
        }

        public function finishQuestPub(_arg_1:Object, _arg_2:Number):Boolean
        {
            if (_arg_1)
            {
                questData = _arg_1;
                quest = _arg_1.data;
                return (finishQuest(_arg_2));
            };
            return (false);
        }

        private function set slotIdList(_arg_1:Array):void
        {
            var _local_2:Object = this._821490697slotIdList;
            if (_local_2 !== _arg_1)
            {
                this._821490697slotIdList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotIdList", _local_2, _arg_1));
            };
        }

        private function checkPet():Boolean
        {
            var i:String;
            var tmp:Object;
            var count:int;
            var subPet:Object;
            var petObj:Object;
            var func:Function;
            var msg:String;
            var htmlmsg:String;
            var _alert:Alert;
            var tf:IUITextField;
            var requireList:Object = _core.data.gameDataIndex[GamePredef.TBL_QUEST_REQUIRE][quest.id];
            if (requireList)
            {
                for (i in requireList)
                {
                    if (((requireList[i]) && (requireList[i].kind == GamePredef.QUEST_REQUIRE_PET)))
                    {
                        tmp = _core.getTemplateData(GamePredef.TBL_CREATURE, requireList[i].itemId);
                        if (((((tmp) && (_core)) && (_core.player)) && (_core.player.petList)))
                        {
                            count = 0;
                            for each (petObj in _core.player.petList)
                            {
                                if (((((ToolKit.isEqual(petObj.tid, requireList[i].itemId)) && (ToolKit.isBigThan(petObj.state, 0))) && (petObj.petName == tmp.name)) && (ToolKit.isBigOrEqual(_core.basic.colorByGrowRate(petObj.growRate), _core.basic.colorByGrowRate((requireList[i].q / 10))))))
                                {
                                    subPet = petObj;
                                    count = (count + 1);
                                    if (ToolKit.isSmallThan(_core.basic.colorByGrowRate(petObj.growRate), 2))
                                    {
                                        return (true);
                                    };
                                };
                            };
                            if (subPet)
                            {
                                if (ToolKit.isBigOrEqual(_core.basic.colorByGrowRate(subPet.growRate), 2))
                                {
                                    if (!_confirmPet)
                                    {
                                        func = function (_arg_1:CloseEvent):void
                                        {
                                            if (_arg_1.detail == Alert.YES)
                                            {
                                                _confirmPet = true;
                                                finishQuest(_selectId);
                                            };
                                        };
                                        msg = Language.QUESTPANEL_S[22].replace("{petName}", (("(" + subPet.petName) + ")"));
                                        htmlmsg = Language.QUESTPANEL_S[22].replace("{petName}", (((("(<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(subPet.growRate)]) + "'>") + subPet.petName) + "</font>)"));
                                        _alert = Alert.show(msg, "", 3, this, func);
                                        tf = _alert.mx_internal::alertForm.mx_internal::textField;
                                        tf.htmlText = htmlmsg;
                                        return (false);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            return (true);
        }

        [Bindable(event="propertyChange")]
        public function get cancelButton():BasicGlowButton
        {
            return (this._1990131276cancelButton);
        }

        public function set finishButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1993628251finishButton;
            if (_local_2 !== _arg_1)
            {
                this._1993628251finishButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finishButton", _local_2, _arg_1));
            };
        }

        public function set cancelButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1990131276cancelButton;
            if (_local_2 !== _arg_1)
            {
                this._1990131276cancelButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelButton", _local_2, _arg_1));
            };
        }

        public function onTakeQuest(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (!_arg_1.flag)
                {
                    _core.sysMidNote(_arg_1.info);
                };
            }
            else
            {
                visible = false;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

