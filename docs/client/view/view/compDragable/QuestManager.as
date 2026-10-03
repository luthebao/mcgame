// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.QuestManager

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.HBox;
    import mx.controls.Tree;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.QuestCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.controls.CheckBox;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.ColorTree;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import flash.utils.Dictionary;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.ByteArray;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.object.Npc;
    import mx.collections.Sort;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
    import mx.collections.SortField;
    import flash.events.MouseEvent;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.TimerEvent;
    import com.qeedoo.game.utils.TextUtil;
    import flash.events.Event;
    import mx.events.ListEvent;
    import flash.net.Responder;
    import flash.utils.setTimeout;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import flash.utils.Timer;
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

    public class QuestManager extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var firstFlagLoop:Boolean = true;
        private var _11548545buttonBar:HBox;
        private var _1223060299canTakeTree:Tree;
        private var _365584322questTreeAC:ArrayCollection;
        private var _43419881canTakeQc:QuestCanvas;
        private var _1993628251finishButton:BasicGlowButton;
        private var treeSelectedIndex2:int = -1;
        private var _516749040cancelLoopButton:BasicDelayButton;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var currentTreeIndex:int = 0;
        private var treeSelectedIndex1:int = -1;
        private var _678985606loopRepaireButton:BasicDelayButton;
        private var _114581tab:ViewStack;
        private var _1554141558tabBtn1:BasicGlowButton;
        public var _QuestManager_BasicTxtButton1:BasicTxtButton;
        private var _2037712542loopList:List;
        private var _3602qc:QuestCanvas;
        private var firstFlagCanTake:Boolean = true;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _3237038info:LinkTextArea;
        private var _1165895868questNum:int;
        private var lastInitTime:Number = 0;
        private var _1669396974questGuideCheck:CheckBox;
        private var _1990131276cancelButton:BasicGlowButton;
        public var _QuestManager_BasicDelayButton1:BasicDelayButton;
        private var _2037660849loopName:Label;
        private var _1782857824questTree:ColorTree;
        public var _QuestManager_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1097091114loopQc:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":396,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_QuestManager_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tab",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "60";
                            this.bottom = "15";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ColorTree,
                                                "id":"questTree",
                                                "events":{
                                                    "itemClick":"__questTree_itemClick",
                                                    "mouseDown":"__questTree_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "8";
                                                    this.bottom = "40";
                                                    this.verticalAlign = "middle";
                                                    this.backgroundAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CSSBorder",
                                                        "x":8,
                                                        "width":152
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HBox,
                                                "id":"buttonBar",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "8";
                                                    this.horizontalAlign = "center";
                                                    this.horizontalGap = 3;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":149,
                                                        "height":29,
                                                        "x":10,
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
                                                "type":QuestCanvas,
                                                "id":"qc",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "8";
                                                    this.right = "8";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"guideVisible":true});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_QuestManager_BasicTxtButton1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":160,
                                                        "y":200,
                                                        "height":18,
                                                        "width":40
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Tree,
                                                "id":"canTakeTree",
                                                "events":{
                                                    "itemClick":"__canTakeTree_itemClick",
                                                    "mouseDown":"__canTakeTree_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "8";
                                                    this.bottom = "40";
                                                    this.verticalAlign = "middle";
                                                    this.backgroundAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CSSBorder",
                                                        "x":8,
                                                        "width":152
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":QuestCanvas,
                                                "id":"canTakeQc",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "8";
                                                    this.right = "8";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"guideVisible":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_QuestManager_BasicDelayButton1",
                                                "events":{"click":"___QuestManager_BasicDelayButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-154";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":289,
                                                        "styleName":"BtnNormalRed"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"loopList",
                                                "events":{
                                                    "itemClick":"__loopList_itemClick",
                                                    "mouseDown":"__loopList_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "8";
                                                    this.bottom = "40";
                                                    this.verticalAlign = "middle";
                                                    this.backgroundAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CSSBorder",
                                                        "x":8,
                                                        "width":152
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"loopQc",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "163";
                                                    this.right = "8";
                                                    this.top = "8";
                                                    this.bottom = "8";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"loopName",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":8,
                                                                    "height":18,
                                                                    "percentWidth":100,
                                                                    "alpha":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"info",
                                                            "events":{"mouseMove":"__info_mouseMove"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "8";
                                                                this.right = "8";
                                                                this.top = "27";
                                                                this.bottom = "8";
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "editable":false
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "8";
                                                    this.horizontalAlign = "center";
                                                    this.horizontalGap = 3;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":149,
                                                        "height":29,
                                                        "x":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"cancelLoopButton",
                                                            "events":{"click":"__cancelLoopButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":1,
                                                                    "styleName":"BtnStdBlue",
                                                                    "clickDelay":5000,
                                                                    "visible":false,
                                                                    "includeInLayout":false,
                                                                    "width":52.2
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"loopRepaireButton",
                                                            "events":{"click":"__loopRepaireButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":15000,
                                                                    "x":80,
                                                                    "y":1,
                                                                    "styleName":"BtnStdBlue",
                                                                    "visible":false,
                                                                    "includeInLayout":false,
                                                                    "width":52.2
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
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":40,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "selected":true,
                                            "styleName":"HorizontalTab",
                                            "width":65
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":80
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":65
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"questGuideCheck",
                        "events":{"click":"__questGuideCheck_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":40});
                        }
                    })]
                });
            }
        });
        private var timerDic:Dictionary = new Dictionary();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function QuestManager()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 396;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            QuestManager._watcherSetupUtil = _arg_1;
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

        public function onAddChaQuest(_arg_1:Object):void
        {
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeObject(_arg_1);
            _local_2.position = 0;
            var _local_3:Object = _local_2.readObject();
            if (!_core.player.questList)
            {
                _core.player.questList = {};
            };
            _core.player.questList[_local_3.data.id] = _local_3;
            var _local_4:Boolean;
            for each (_local_5 in _local_3.questKill)
            {
                if (_local_5)
                {
                    _local_4 = true;
                };
            };
            if (((!(_local_3.questKill)) || (!(_local_4))))
            {
                if (((_local_3.require) || (isNull(_local_3.questKill))))
                {
                    _local_3.questKill = new Array();
                    for each (_local_6 in _local_3.require)
                    {
                        if (((_local_6) && (ToolKit.isEqual(_local_6.kind, GamePredef.QUEST_REQUIRE_CREATUR))))
                        {
                            _local_7 = {};
                            _local_7.cid = _core.player.id;
                            _local_7.creatureId = _local_6.itemId;
                            _local_7.num = _local_6.num;
                            _local_3.questKill.push(_local_7);
                        };
                    };
                };
            };
            updateView();
        }

        public function set loopRepaireButton(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._678985606loopRepaireButton;
            if (_local_2 !== _arg_1)
            {
                this._678985606loopRepaireButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loopRepaireButton", _local_2, _arg_1));
            };
        }

        private function updateView():void
        {
            var _local_1:*;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:*;
            var _local_6:String;
            var _local_7:Npc;
            var _local_8:int;
            var _local_9:String;
            var _local_10:Sort;
            questNum = 0;
            for each (_local_1 in _core.player.questList)
            {
                questNum++;
                if (!_core.questGuideList[_local_1.qid])
                {
                    _local_3 = new Object();
                    _local_3.guideAble = true;
                    _local_3.taketime = _local_1.takeDate;
                    _local_3.qid = _local_1.qid;
                    _core.questGuideList[_local_1.qid] = _local_3;
                };
            };
            _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE).updateQuestGuide();
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            createTimer();
            if (qc)
            {
                qc.initQuest(null);
                qc.cb_guide.visible = false;
            };
            var _local_2:ArrayCollection = new ArrayCollection();
            if (_core.player.questList)
            {
                _local_4 = {};
                for each (_local_5 in _core.player.questList)
                {
                    if (_local_5)
                    {
                        _local_7 = _core.getNpc(_local_5.data.finishNpc);
                        if (_local_7)
                        {
                            _local_7.state = ((ToolKit.isBigThan(_local_5.state, _local_7.state)) ? _local_5.state : _local_7.state);
                        };
                        if (!_local_4[_local_5.data.type])
                        {
                            _local_4[_local_5.data.type] = new ArrayCollection();
                        };
                        _local_8 = _local_5.data.color;
                        if (ToolKit.isEqual(_local_5.data.type, GamePredef.QUEST_TYPE_CALLBOARD))
                        {
                            _local_8 = _local_5.c;
                        };
                        _local_9 = _local_5.data.name;
                        if (ToolKit.isEqual(_local_5.data.type, GamePredef.QUEST_TYPE_LOOP))
                        {
                            _local_9 = (getQuestNamePrefix(_local_5.data) + _local_9);
                        };
                        _local_4[_local_5.data.type].addItem({
                            "label":_local_9,
                            "sort1":_local_5.data.color,
                            "sort2":_local_5.state,
                            "icon":ResManager[("ICON_QUEST_STATE_" + _local_5.state)],
                            "color":GamePredef.CODE_ITEM_COLOR[_local_8],
                            "data":_local_5
                        });
                        _local_10 = new Sort();
                        _local_10.fields = [new SortField("sort1", true, true), new SortField("sort2", true, true)];
                        _local_4[_local_5.data.type].sort = _local_10;
                        _local_4[_local_5.data.type].refresh();
                    };
                };
                for (_local_6 in _local_4)
                {
                    if (_local_4[_local_6])
                    {
                        _local_2.addItem({
                            "label":GamePredef.QUEST_TYPE_NAME[_local_6],
                            "children":_local_4[_local_6]
                        });
                    };
                };
                if (_local_2.length > 0)
                {
                    questTree.dataProvider = _local_2;
                    callLater(initTreeSelect);
                }
                else
                {
                    questTree.dataProvider = null;
                };
            };
            finishButton.visible = false;
            finishButton.includeInLayout = false;
        }

        private function finishQuest():void
        {
            if (((questTree.selectedItem) && (questTree.selectedItem.data)))
            {
                if (_core.view.getUI(ViewManager.PANEL_QUEST).finishQuestPub(questTree.selectedItem.data, qc.selectId))
                {
                    finishButton.visible = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get qc():QuestCanvas
        {
            return (this._3602qc);
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function __questGuideCheck_click(_arg_1:MouseEvent):void
        {
            questGuideOpen();
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get loopQc():Canvas
        {
            return (this._1097091114loopQc);
        }

        [Bindable(event="propertyChange")]
        public function get cancelLoopButton():BasicDelayButton
        {
            return (this._516749040cancelLoopButton);
        }

        public function set cancelLoopButton(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._516749040cancelLoopButton;
            if (_local_2 !== _arg_1)
            {
                this._516749040cancelLoopButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelLoopButton", _local_2, _arg_1));
            };
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

        public function __questTree_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function onCancelQuest(_arg_1:Object):void
        {
            if (((_core.player) && (_core.player.questList)))
            {
                delete _core.player.questList[_arg_1.qid];
                updateView();
            };
        }

        public function __loopList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set tab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._114581tab;
            if (_local_2 !== _arg_1)
            {
                this._114581tab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab", _local_2, _arg_1));
            };
        }

        private function loopRepaire():void
        {
            if (loopList.selectedItem)
            {
                _core.remote.loopRepaire(loopList.selectedItem.lid);
                loopRepaireButton.visible = false;
                loopRepaireButton.includeInLayout = false;
            };
        }

        private function cancelLoop():void
        {
            var func:Function;
            if (loopList.selectedItem)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.cancelLoop(loopList.selectedItem.lid);
                        cancelLoopButton.visible = false;
                        cancelLoopButton.includeInLayout = false;
                    };
                };
                Alert.show(Language.QUESTPANEL_S[20], "", (Alert.YES | Alert.NO), this, func);
            };
        }

        private function timerRepeat(_arg_1:TimerEvent):void
        {
            var _local_2:Object;
            if ((((_core) && (_core.player)) && (_core.player.questList)))
            {
                _local_2 = _core.player.questList[timerDic[_arg_1.currentTarget]];
                if (((_local_2) && (_local_2.lastTime)))
                {
                    _local_2.lastTime = int(_local_2.lastTime);
                    _local_2.lastTime--;
                };
            };
        }

        private function tabBtnClick(_arg_1:int):void
        {
            tab.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= (tab.numChildren - 1))
            {
                if (_local_2 == _arg_1)
                {
                    this[("tabBtn" + _local_2)].selected = true;
                }
                else
                {
                    this[("tabBtn" + _local_2)].selected = false;
                };
                _local_2++;
            };
            if (((_arg_1 == 1) && (firstFlagCanTake)))
            {
                initCanTakeQuest();
                firstFlagCanTake = false;
            };
            if (((_arg_1 == 2) && (firstFlagLoop)))
            {
                initLoopeQuest();
                firstFlagLoop = false;
            };
        }

        private function loopListClick(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:String;
            var _local_4:Object;
            var _local_5:Number;
            var _local_6:Boolean;
            var _local_7:Object;
            var _local_8:String;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:String;
            if (loopList.selectedItem)
            {
                clearLoopView();
                _local_2 = _core.data.getData(GamePredef.TBL_QUEST_LOOP, loopList.selectedItem.lid);
                if (_local_2)
                {
                    info.htmlText = _local_2.info;
                    _local_3 = Language.QUESTMANAGER_S[7].replace("{minute}", 0);
                    if (((loopList.selectedItem.type == 1) && (_core.player.loopList)))
                    {
                        _local_4 = _core.player.loopList[loopList.selectedItem.lIndex];
                        _local_5 = ((((new Date().getTime() + _core.timeLag) - _local_4.takeDate) / 1000) - _local_2.refresh);
                        if (_local_5 < 0)
                        {
                            _local_3 = Language.QUESTMANAGER_S[7].replace("{minute}", Math.ceil((Math.abs(_local_5) / 60)).toString());
                        };
                        if (_local_4)
                        {
                            info.htmlText = (info.htmlText + (((((("<br>" + Language.QUESTCANVAS_S[16]) + "<font color='#ff0000'>") + ToolKit.add(_local_4.ft, 1)) + "/") + _local_2.num) + "</font>"));
                            _local_6 = true;
                            if (_core.player.questList)
                            {
                                for each (_local_7 in _core.player.questList)
                                {
                                    if (((_local_7) && (_local_7.data)))
                                    {
                                        if (_local_7.data.subType == ((GamePredef.QUEST_TYPE_LOOP + "-") + _local_2.id))
                                        {
                                            info.htmlText = (info.htmlText + (("<br>" + Language.QUESTCANVAS_S[17]) + TextUtil.decode(TextUtil.getCodeByTypeId(GamePredef.TBL_QUEST, _local_7.data.id))));
                                            _local_6 = false;
                                        };
                                    };
                                };
                            };
                            if (_local_6)
                            {
                                loopRepaireButton.visible = true;
                                loopRepaireButton.includeInLayout = true;
                            }
                            else
                            {
                                loopRepaireButton.visible = false;
                                loopRepaireButton.includeInLayout = false;
                            };
                            cancelLoopButton.visible = true;
                            cancelLoopButton.includeInLayout = true;
                        };
                    }
                    else
                    {
                        if (loopList.selectedItem.type == 2)
                        {
                            for (_local_8 in _core.player.loopTakeTime)
                            {
                                if (_local_8 == loopList.selectedItem.lid)
                                {
                                    _local_5 = ((((new Date().getTime() + _core.timeLag) - _core.player.loopTakeTime[_local_8]) / 1000) - _local_2.refresh);
                                    if (_local_5 < 0)
                                    {
                                        _local_3 = Language.QUESTMANAGER_S[7].replace("{minute}", Math.ceil((Math.abs(_local_5) / 60)).toString());
                                    };
                                    break;
                                };
                            };
                            if (((Number(loopList.selectedItem.lid) == Number(6)) && (_core.loopQuestStartTime[51])))
                            {
                                _local_10 = _core.data.getData(GamePredef.TBL_QUEST_LOOP, 6);
                                _local_5 = ((((new Date().getTime() + _core.timeLag) - _core.loopQuestStartTime[51]) / 1000) - _local_10.refresh);
                                if (_local_5 < 0)
                                {
                                    _local_3 = Language.QUESTMANAGER_S[7].replace("{minute}", Math.ceil((Math.abs(_local_5) / 60)).toString());
                                };
                            };
                            _local_9 = _core.data.getData(GamePredef.TBL_NPC, _local_2.nid);
                            if (_local_9)
                            {
                                _local_11 = ((TextUtil.decode(TextUtil.getCodeByTypeId(GamePredef.TBL_NPC, _local_9.id)) + TextUtil.getMapHtml(_local_9.posMapId)) + "<br>");
                                info.htmlText = (info.htmlText + (("<br>" + Language.QUESTMANAGER_S[3]) + _local_11));
                            };
                            cancelLoopButton.visible = false;
                            cancelLoopButton.includeInLayout = false;
                        };
                    };
                    loopName.text = (_local_2.name + _local_3);
                };
            };
            info.htmlText = (("<font color='#FFFFFF'>" + info.htmlText) + "</font>");
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

        public function __canTakeTree_itemClick(_arg_1:ListEvent):void
        {
            canTakeTreeClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get cancelButton():BasicGlowButton
        {
            return (this._1990131276cancelButton);
        }

        public function __finishButton_click(_arg_1:MouseEvent):void
        {
            finishQuest();
        }

        public function reset():void
        {
            firstFlagCanTake = true;
            firstFlagLoop = true;
            lastInitTime = 0;
        }

        private function initLoopeQuest():void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            clearLoopView();
            var _local_1:ArrayCollection = new ArrayCollection();
            if (_core.player.loopList)
            {
                for each (_local_4 in _core.player.loopList)
                {
                    if (_local_4)
                    {
                        _local_5 = _core.data.getData(GamePredef.TBL_QUEST_LOOP, _local_4.qid);
                        if (((_local_5) && (_core.player.isTakeLoop(_local_5.id))))
                        {
                            _local_1.addItem({
                                "label":_local_5.name,
                                "type":1,
                                "lIndex":_local_4.id,
                                "icon":ResManager[("ICON_QUEST_STATE_" + GamePredef.ST_QUEST_ISTAKE)],
                                "lid":_local_5.id
                            });
                        };
                    };
                };
            };
            var _local_2:Object = _core.data.gameData[GamePredef.TBL_QUEST_LOOP];
            if (_local_2)
            {
                for each (_local_6 in _local_2)
                {
                    if (_local_6)
                    {
                        if (((_local_6.isRebirth) && (ToolKit.isBigThan(_local_6.isRebirth, 0))))
                        {
                            if (((ToolKit.isBigThan(_core.player.levelRe, _local_6.maxLevel)) || (ToolKit.isSmallThan(_core.player.levelRe, _local_6.minLevel)))) continue;
                        }
                        else
                        {
                            if (((!(_local_6.isRebirth)) || (ToolKit.isSmallOrEqual(_local_6.isRebirth, 0))))
                            {
                                if (((ToolKit.isBigThan(_core.player.level, _local_6.maxLevel)) || (ToolKit.isSmallThan(_core.player.level, _local_6.minLevel)))) continue;
                            };
                        };
                        if (!_core.player.isTakeLoop(_local_6.id))
                        {
                            _local_1.addItem({
                                "label":_local_6.name,
                                "type":2,
                                "icon":ResManager[("ICON_QUEST_STATE_" + GamePredef.ST_QUEST_CANTAKE)],
                                "lid":_local_6.id
                            });
                        };
                    };
                };
            };
            var _local_3:Sort = new Sort();
            _local_3.fields = [new SortField("type", true, false), new SortField("lid", true, false)];
            _local_1.sort = _local_3;
            _local_1.refresh();
            if (loopList)
            {
                loopList.dataProvider = _local_1;
            };
        }

        [Bindable(event="propertyChange")]
        private function get questNum():int
        {
            return (this._1165895868questNum);
        }

        private function _QuestManager_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.QUESTMANAGER_U[8];
            _local_1 = Language.QUESTMANAGER_U[0];
            _local_1 = Language.QUESTMANAGER_U[1];
            _local_1 = ((questNum + "/") + GamePredef.MAX_QUEST_NUM);
            _local_1 = Language.QUESTMANAGER_U[5];
            _local_1 = Language.QUESTMANAGER_U[1];
            _local_1 = Language.QUESTMANAGER_U[7];
            _local_1 = Language.QUESTMANAGER_U[3];
            _local_1 = Language.QUESTMANAGER_U[4];
            _local_1 = Language.QUESTMANAGER_U[6];
            _local_1 = Language.QUESTMANAGER_S[3];
        }

        public function enableUI():void
        {
        }

        private function setTimeoutInit():void
        {
            _core.remote.call("initQuestManager", new Responder(showQuest));
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

        public function onCancelLoopQuest(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Number;
            if (_arg_1)
            {
                if (((_arg_1.flag) && (_core.player)))
                {
                    if (_core.player.loopList[_arg_1.id])
                    {
                        _local_2 = _core.data.getData(GamePredef.TBL_QUEST_LOOP, _core.player.loopList[_arg_1.id].qid);
                        if (_local_2)
                        {
                            _core.sysBlueMsg((((Language.QUESTPANEL_S[17] + "[") + _local_2.name) + "]"));
                        };
                        _local_3 = _core.player.loopList[_arg_1.id].takeDate;
                        _core.player.loopTakeTime[_arg_1.id] = _local_3;
                        delete _core.player.loopList[_arg_1.id];
                        initLoopeQuest();
                        if (_core.getNpc(_local_2.nid))
                        {
                            _core.setNpcState(_local_2.nid);
                        };
                    };
                }
                else
                {
                    _core.sysMsg(Language.QUESTPANEL_S[19]);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get loopList():List
        {
            return (this._2037712542loopList);
        }

        public function initQuestGuide():void
        {
            setTimeout(setTimeoutInit, 1000);
        }

        public function onFinishLoopQuest(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                if (_core.player.loopList[_arg_1.id])
                {
                    _core.player.loopList[_arg_1.id].ft = _arg_1.ft;
                    _local_2 = _core.data.getData(GamePredef.TBL_QUEST_LOOP, _core.player.loopList[_arg_1.id].qid);
                    if (_local_2)
                    {
                        if (Number(_arg_1.ft) == Number(_local_2.num))
                        {
                            _core.player.loopTakeTime[_core.player.loopList[_arg_1.id].qid] = _core.player.loopList[_arg_1.id].takeDate;
                            _core.sysBlueMsg((((Language.QUESTPANEL_S[18] + " [") + _local_2.name) + "]"));
                        }
                        else
                        {
                            _core.sysBlueMsg(((((((((Language.QUESTPANEL_S[15] + _arg_1.ft) + Language.QUESTPANEL_S[16]) + " [") + _local_2.name) + "] ") + _arg_1.ft) + "/") + _local_2.num));
                        };
                    };
                    initLoopeQuest();
                };
            };
        }

        public function set questTree(_arg_1:ColorTree):void
        {
            var _local_2:Object = this._1782857824questTree;
            if (_local_2 !== _arg_1)
            {
                this._1782857824questTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questTree", _local_2, _arg_1));
            };
        }

        public function getTimerByDic(_arg_1:int):*
        {
            var _local_2:*;
            for (_local_2 in timerDic)
            {
                if (timerDic[_local_2] == _arg_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        private function initTreeSelect():void
        {
            if (questTree.dataProvider == null)
            {
                return;
            };
            if (treeSelectedIndex1 >= 0)
            {
                questTree.selectedIndex = treeSelectedIndex1;
                if (questTree.selectedItem)
                {
                    questTree.expandItem(questTree.selectedItem, true);
                    currentTreeIndex = questTree.selectedIndex;
                    questClick();
                }
                else
                {
                    treeSelectedIndex1 = -1;
                };
            };
            if (treeSelectedIndex2 >= 0)
            {
                questTree.selectedIndex = treeSelectedIndex2;
                if (questTree.selectedItem)
                {
                    currentTreeIndex = questTree.selectedIndex;
                    questClick();
                }
                else
                {
                    treeSelectedIndex2 = -1;
                };
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        public function __questTree_itemClick(_arg_1:ListEvent):void
        {
            treeClick(_arg_1);
        }

        public function __loopList_itemClick(_arg_1:ListEvent):void
        {
            loopListClick(_arg_1);
        }

        public function __cancelLoopButton_click(_arg_1:MouseEvent):void
        {
            cancelLoop();
        }

        private function _QuestManager_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestManager_BasicTitleCanvas1.text = _arg_1;
            }, "_QuestManager_BasicTitleCanvas1.text");
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
                var _local_1:* = Language.QUESTMANAGER_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cancelButton.label = _arg_1;
            }, "cancelButton.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((questNum + "/") + GamePredef.MAX_QUEST_NUM);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestManager_BasicTxtButton1.text = _arg_1;
            }, "_QuestManager_BasicTxtButton1.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestManager_BasicDelayButton1.label = _arg_1;
            }, "_QuestManager_BasicDelayButton1.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cancelLoopButton.label = _arg_1;
            }, "cancelLoopButton.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                loopRepaireButton.label = _arg_1;
            }, "loopRepaireButton.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTMANAGER_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                questGuideCheck.label = _arg_1;
            }, "questGuideCheck.label");
            result[10] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get buttonBar():HBox
        {
            return (this._11548545buttonBar);
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

        private function set questTreeAC(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._365584322questTreeAC;
            if (_local_2 !== _arg_1)
            {
                this._365584322questTreeAC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questTreeAC", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get loopRepaireButton():BasicDelayButton
        {
            return (this._678985606loopRepaireButton);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        private function treeClick(_arg_1:Event):void
        {
            var _local_2:*;
            if (questTree.selectedItem)
            {
                if (questTree.selectedItem.children)
                {
                    treeSelectedIndex1 = questTree.selectedIndex;
                    if (questTree.selectedIndex == currentTreeIndex)
                    {
                        questTree.expandItem(questTree.selectedItem, (!(questTree.isItemOpen(questTree.selectedItem))));
                    }
                    else
                    {
                        for each (_local_2 in questTree.openItems)
                        {
                            questTree.expandItem(_local_2, false);
                        };
                        questTree.expandItem(questTree.selectedItem, (!(questTree.isItemOpen(questTree.selectedItem))));
                    };
                    currentTreeIndex = questTree.selectedIndex;
                    questClick();
                }
                else
                {
                    treeSelectedIndex2 = questTree.selectedIndex;
                    questClick();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        public function set canTakeTree(_arg_1:Tree):void
        {
            var _local_2:Object = this._1223060299canTakeTree;
            if (_local_2 !== _arg_1)
            {
                this._1223060299canTakeTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canTakeTree", _local_2, _arg_1));
            };
        }

        private function cancelQuest():void
        {
            var func:Function;
            var msgString:String;
            if (((questTree.selectedItem) && (!(questTree.selectedItem.children))))
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        cancelButton.visible = false;
                        _core.remote.cancelQuest(questTree.selectedItem.data.data.id);
                    };
                };
                msgString = Language.QUESTMANAGER_S[1].toString().replace("{name}", (getQuestNamePrefix(questTree.selectedItem.data.data) + questTree.selectedItem.data.data.name));
                Alert.show(msgString, "", (Alert.YES | Alert.NO), this, func);
            };
        }

        public function isTakeQuest(_arg_1:Number):Boolean
        {
            if (((_core.player.questList) && (_core.player.questList[_arg_1])))
            {
                return (true);
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get loopName():Label
        {
            return (this._2037660849loopName);
        }

        override public function initialize():void
        {
            var target:QuestManager;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _QuestManager_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_QuestManagerWatcherSetupUtil");
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
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        private function canTakeQuestClick():void
        {
            if (canTakeTree.selectedItem)
            {
                if (canTakeTree.selectedItem.data)
                {
                    canTakeQc.initQuest(canTakeTree.selectedItem.data);
                    return;
                };
            };
            canTakeQc.initQuest(null);
        }

        private function timerComplete(_arg_1:TimerEvent):void
        {
            var _local_2:Object = _core.player.questList[timerDic[_arg_1.currentTarget]];
            var _local_3:String = Language.QUESTMANAGER_S[0].toString().replace("{qname}", _local_2.data.name);
            Alert.show(_local_3, "", Alert.OK);
            _core.remote.cancelQuest(timerDic[_arg_1.currentTarget]);
            _arg_1.currentTarget.removeEventListener(TimerEvent.TIMER, timerRepeat);
            _arg_1.currentTarget.removeEventListener(TimerEvent.TIMER_COMPLETE, timerComplete);
        }

        private function questGuideOpen():void
        {
            if (questGuideCheck.selected)
            {
                _core.player.questGuideAble = true;
                _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE).show();
            }
            else
            {
                _core.player.questGuideAble = false;
                _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE).hide();
            };
        }

        public function __info_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
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

        private function createTimer():void
        {
            var _local_1:*;
            var _local_2:Timer;
            removeTimerAll();
            if (_core.player.questList)
            {
                for each (_local_1 in _core.player.questList)
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

        public function set loopName(_arg_1:Label):void
        {
            var _local_2:Object = this._2037660849loopName;
            if (_local_2 !== _arg_1)
            {
                this._2037660849loopName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loopName", _local_2, _arg_1));
            };
        }

        public function __loopRepaireButton_click(_arg_1:MouseEvent):void
        {
            loopRepaire();
        }

        [Bindable(event="propertyChange")]
        public function get finishButton():BasicGlowButton
        {
            return (this._1993628251finishButton);
        }

        public function __cancelButton_click(_arg_1:MouseEvent):void
        {
            cancelQuest();
        }

        public function set loopQc(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1097091114loopQc;
            if (_local_2 !== _arg_1)
            {
                this._1097091114loopQc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loopQc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canTakeTree():Tree
        {
            return (this._1223060299canTakeTree);
        }

        public function ___QuestManager_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            initCanTakeQuest();
        }

        public function onFinishQuest(_arg_1:Object):void
        {
            if (_core.player.questList)
            {
                delete _core.player.questList[_arg_1.qid];
                updateView();
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

        public function set loopList(_arg_1:List):void
        {
            var _local_2:Object = this._2037712542loopList;
            if (_local_2 !== _arg_1)
            {
                this._2037712542loopList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loopList", _local_2, _arg_1));
            };
        }

        private function questClick():void
        {
            if (questTree.selectedItem)
            {
                if (questTree.selectedItem.data)
                {
                    if (((ToolKit.isEqual(questTree.selectedItem.data.state, GamePredef.ST_QUEST_CANFINISH)) && (ToolKit.isSmallOrEqual(questTree.selectedItem.data.data.finishNpc, 0))))
                    {
                        finishButton.visible = true;
                        finishButton.includeInLayout = true;
                    }
                    else
                    {
                        finishButton.visible = false;
                        finishButton.includeInLayout = false;
                    };
                    cancelButton.visible = true;
                    cancelButton.includeInLayout = true;
                    if (ToolKit.isEqual(1, questTree.selectedItem.data.data.type))
                    {
                        cancelButton.enabled = false;
                    }
                    else
                    {
                        cancelButton.enabled = true;
                    };
                    qc.initQuest(questTree.selectedItem.data);
                    qc.cb_guide.visible = true;
                    return;
                };
            };
            qc.initQuest(null);
            qc.cb_guide.visible = false;
        }

        public function disablueUI():void
        {
        }

        [Bindable(event="propertyChange")]
        private function get questTreeAC():ArrayCollection
        {
            return (this._365584322questTreeAC);
        }

        public function onTakeLoop(_arg_1:Object):void
        {
            var _local_2:Object;
            if ((((_arg_1) && (_arg_1.flag)) && (_arg_1.d)))
            {
                _local_2 = _core.data.getData(GamePredef.TBL_QUEST_LOOP, _arg_1.d.qid);
                if (_local_2)
                {
                    _core.sysBlueMsg((((Language.QUESTPANEL_S[14] + "[") + _local_2.name) + "]"));
                    _core.player.loopList[_arg_1.d.id] = _arg_1.d;
                    initLoopeQuest();
                    if (_core.getNpc(_local_2.nid))
                    {
                        _core.setNpcState(_local_2.nid);
                    };
                };
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get questTree():ColorTree
        {
            return (this._1782857824questTree);
        }

        private function set questNum(_arg_1:int):void
        {
            var _local_2:Object = this._1165895868questNum;
            if (_local_2 !== _arg_1)
            {
                this._1165895868questNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questNum", _local_2, _arg_1));
            };
        }

        private function isNull(_arg_1:Object):Boolean
        {
            var _local_3:*;
            var _local_2:* = true;
            for (_local_3 in _arg_1)
            {
                if (_arg_1[_local_3])
                {
                    _local_2 = false;
                };
            };
            return (_local_2);
        }

        public function set canTakeQc(_arg_1:QuestCanvas):void
        {
            var _local_2:Object = this._43419881canTakeQc;
            if (_local_2 !== _arg_1)
            {
                this._43419881canTakeQc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canTakeQc", _local_2, _arg_1));
            };
        }

        private function canTakeTreeClick(_arg_1:Event):void
        {
            var _local_2:*;
            if (canTakeTree.selectedItem)
            {
                if (canTakeTree.selectedItem.children)
                {
                    treeSelectedIndex1 = canTakeTree.selectedIndex;
                    if (canTakeTree.selectedIndex == currentTreeIndex)
                    {
                        canTakeTree.expandItem(canTakeTree.selectedItem, (!(canTakeTree.isItemOpen(canTakeTree.selectedItem))));
                    }
                    else
                    {
                        for each (_local_2 in canTakeTree.openItems)
                        {
                            canTakeTree.expandItem(_local_2, false);
                        };
                        canTakeTree.expandItem(canTakeTree.selectedItem, (!(canTakeTree.isItemOpen(canTakeTree.selectedItem))));
                    };
                    currentTreeIndex = canTakeTree.selectedIndex;
                    canTakeQuestClick();
                }
                else
                {
                    treeSelectedIndex2 = canTakeTree.selectedIndex;
                    canTakeQuestClick();
                };
            };
        }

        private function clearLoopView():void
        {
            loopName.text = "";
            info.text = "";
        }

        public function initCanTakeQuest(_arg_1:Boolean=false):void
        {
            var _local_6:String;
            var _local_7:String;
            var _local_8:Object;
            var _local_9:Sort;
            var _local_2:Object = {};
            var _local_3:ArrayCollection = new ArrayCollection();
            var _local_4:Object = {};
            var _local_5:Object = {};
            _local_5[GamePredef.QUEST_TYPE_NEWHAND] = _core.data.gameDataIndex3[GamePredef.TBL_QUEST][GamePredef.QUEST_TYPE_NEWHAND];
            _local_5[GamePredef.QUEST_TYPE_MAIN] = _core.data.gameDataIndex3[GamePredef.TBL_QUEST][GamePredef.QUEST_TYPE_MAIN];
            _local_5[GamePredef.QUEST_TYPE_WORLD] = _core.data.gameDataIndex3[GamePredef.TBL_QUEST][GamePredef.QUEST_TYPE_WORLD];
            _local_5[GamePredef.QUEST_TYPE_GROWUP] = _core.data.gameDataIndex3[GamePredef.TBL_QUEST][GamePredef.QUEST_TYPE_GROWUP];
            for (_local_6 in _local_5)
            {
                if (_local_5[_local_6])
                {
                    if (!_local_4[_local_6])
                    {
                        _local_4[_local_6] = new ArrayCollection();
                    };
                    for each (_local_8 in _local_5[_local_6])
                    {
                        if (((_local_8) && (_core.player.canTakeQuest(_local_8.id))))
                        {
                            _local_4[_local_6].addItem({
                                "label":_local_8.name,
                                "sort1":_local_8.color,
                                "sort2":_local_8.minLevel,
                                "color":GamePredef.CODE_ITEM_COLOR[_local_8.color],
                                "data":_core.data.getQuestFullData(_local_8.id)
                            });
                        };
                    };
                    _local_9 = new Sort();
                    _local_9.fields = [new SortField("sort1", true, true), new SortField("sort2", true, true)];
                    _local_4[_local_6].sort = _local_9;
                    _local_4[_local_6].refresh();
                };
            };
            if (_arg_1)
            {
                return;
            };
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            for (_local_7 in _local_4)
            {
                if (((_local_4[_local_7]) && (_local_4[_local_7].length > 0)))
                {
                    _local_3.addItem({
                        "label":GamePredef.QUEST_TYPE_NAME[_local_7],
                        "children":_local_4[_local_7]
                    });
                };
            };
            if (((_local_5[GamePredef.QUEST_TYPE_GROWUP]) && (!(this.visible))))
            {
                _core.view.getUI(ViewManager.MAIN_SYS).setTaskButtonBig();
            }
            else
            {
                _core.view.getUI(ViewManager.MAIN_SYS).setStyleNormal();
            };
            if (canTakeTree)
            {
                canTakeTree.dataProvider = _local_3;
            };
            if (canTakeQc)
            {
                canTakeQc.initQuest(null);
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            questGuideCheck.selected = _core.player.questGuideAble;
            _core.remote.call("initQuestManager", new Responder(showQuest));
            if (tab.selectedIndex == 1)
            {
                initCanTakeQuest();
            };
            if (tab.selectedIndex == 2)
            {
                initLoopeQuest();
            };
        }

        public function questGuideClose():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            questGuideCheck.selected = false;
        }

        public function set questGuideCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1669396974questGuideCheck;
            if (_local_2 !== _arg_1)
            {
                this._1669396974questGuideCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questGuideCheck", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if ((((_core) && (_core.player)) && (initialized)))
            {
                questGuideCheck.selected = _core.player.questGuideAble;
            };
            if (((_arg_1 == true) && (new Date().getTime() >= (lastInitTime + (GamePredef.REFRESH_TIME * 1000)))))
            {
                initView();
            };
        }

        public function showQuest(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:uint;
            var _local_5:uint;
            var _local_6:String;
            var _local_7:String;
            var _local_8:int;
            var _local_9:*;
            var _local_10:Object;
            lastInitTime = new Date().getTime();
            if (_arg_1)
            {
                if (_arg_1.q)
                {
                    _core.player.questList = {};
                    for each (_local_2 in _arg_1.q)
                    {
                        if (_local_2)
                        {
                            _local_3 = _core.data.getChaQuestFullData(_local_2);
                            if (_local_2.pos)
                            {
                                _local_4 = uint(Math.round((_local_2.pos.x / 10)));
                                _local_5 = uint(Math.round((_local_2.pos.y / 10)));
                                _local_6 = (((((((((("<a href='event:L_POS|" + _local_2.pos.map) + "|") + _local_4) + ",") + _local_5) + "'>[") + _local_4) + ",") + _local_5) + "]</a>");
                                _local_7 = Language.QUESTCANVAS_S[20].toString().replace("{map}", TextUtil.getMapHtml(_local_2.pos.map)).replace("{pos}", _local_6).replace("{name}", _local_2.pos.name);
                                _local_3.data.posInfo = _local_7;
                            };
                            if (_local_2.clsData)
                            {
                                _local_8 = ((_local_2.clsData.num + 1) % 10);
                                if (_local_8 == 0)
                                {
                                    _local_8 = 10;
                                };
                                _local_9 = Language.QUESTCANVAS_S[21].toString().replace("{num}", _local_8);
                                _local_3.data.clsInfo = _local_9;
                            };
                            _core.player.questList[_local_2.qid] = _local_3;
                        };
                    };
                };
                if (_arg_1.l)
                {
                    _core.player.loopList = _arg_1.l;
                    _core.player.loopTakeTime = [];
                    for each (_local_10 in _core.player.loopList)
                    {
                        _core.player.loopTakeTime[_local_10.qid] = Number(_local_10.takeDate);
                    };
                };
            };
            updateView();
            _core.remote.call("getLoopQuestStartTime", null, null);
        }

        [Bindable(event="propertyChange")]
        public function get info():LinkTextArea
        {
            return (this._3237038info);
        }

        [Bindable(event="propertyChange")]
        public function get canTakeQc():QuestCanvas
        {
            return (this._43419881canTakeQc);
        }

        [Bindable(event="propertyChange")]
        public function get questGuideCheck():CheckBox
        {
            return (this._1669396974questGuideCheck);
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        public function __canTakeTree_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }


    }
}//package com.qeedoo.ui.view.compDragable

