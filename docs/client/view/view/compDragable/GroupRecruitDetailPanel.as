// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GroupRecruitDetailPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.DataGrid;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.LinkTextInput;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.utils.ArrayQueue;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.CustomColumn;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.PropertyChangeEvent;
    import mx.events.ListEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.utils.TextUtil;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import flash.events.Event;
    import com.qeedoo.game.utils.TimeUtil;
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

    public class GroupRecruitDetailPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2070514658ns_hour:NumericStepper;
        private var leaderId:int;
        private var _1786660989acceptButtonEnable:Boolean;
        public var dataFlag:Boolean = false;
        private var _3642rl:RoundedLabel;
        private var _648591011dg_members:DataGrid;
        private var tempCid:int;
        private var minLevel:int;
        private var _2075901652applyList:ArrayCollection;
        public var _GroupRecruitDetailPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _351125616dg_applyList:DataGrid;
        public var _GroupRecruitDetailPanel_BasicGlowButton1:BasicGlowButton;
        public var _GroupRecruitDetailPanel_BasicGlowButton2:BasicGlowButton;
        public var _GroupRecruitDetailPanel_BasicGlowButton3:BasicGlowButton;
        public var _GroupRecruitDetailPanel_Button1:Button;
        public var _GroupRecruitDetailPanel_Button3:Button;
        private var _1058056547textInput:LinkTextInput;
        public var _GroupRecruitDetailPanel_Button2:Button;
        private var tempName:String;
        public var _GroupRecruitDetailPanel_RoundedLabel1:RoundedLabel;
        public var _GroupRecruitDetailPanel_RoundedLabel3:RoundedLabel;
        public var _GroupRecruitDetailPanel_RoundedLabel4:RoundedLabel;
        public var _GroupRecruitDetailPanel_RoundedLabel5:RoundedLabel;
        public var _GroupRecruitDetailPanel_RoundedLabel6:RoundedLabel;
        public var _GroupRecruitDetailPanel_RoundedLabel7:RoundedLabel;
        public var _GroupRecruitDetailPanel_RoundedLabel8:RoundedLabel;
        private var _1057325618ns_minute:NumericStepper;
        private var maxLevel:int;
        private var willList:Array;
        public var _GroupRecruitDetailPanel_DataGridColumn1:DataGridColumn;
        public var _GroupRecruitDetailPanel_DataGridColumn2:DataGridColumn;
        public var _GroupRecruitDetailPanel_DataGridColumn3:DataGridColumn;
        public var _GroupRecruitDetailPanel_DataGridColumn4:DataGridColumn;
        public var _GroupRecruitDetailPanel_DataGridColumn5:DataGridColumn;
        public var _GroupRecruitDetailPanel_DataGridColumn6:DataGridColumn;
        private var _432720173isLeader:Boolean;
        private var _1102666777linkTA:LinkTextArea;
        private var willTypeList:Array;
        private var _948230163memList:ArrayCollection;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GroupRecruitDetailPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.top = "40";
                            this.bottom = "50";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":205,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitDetailPanel_RoundedLabel1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":43,
                                            "width":65
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1088804;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":69,
                                            "width":152
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_GroupRecruitDetailPanel_Button1",
                                    "events":{"click":"___GroupRecruitDetailPanel_Button1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":41,
                                            "width":50,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitDetailPanel_RoundedLabel3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":107,
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_GroupRecruitDetailPanel_Button2",
                                    "events":{"click":"___GroupRecruitDetailPanel_Button2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":105,
                                            "width":50,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_hour",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "183";
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "minimum":0,
                                            "maximum":23,
                                            "width":50,
                                            "enabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_minute",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "183";
                                        this.left = "87";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "minimum":0,
                                            "maximum":59,
                                            "width":50,
                                            "enabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitDetailPanel_RoundedLabel4",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.bottom = "185";
                                        this.left = "59";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":20,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitDetailPanel_RoundedLabel5",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.bottom = "184";
                                        this.left = "138";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":20,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"dg_members",
                                    "events":{"itemDoubleClick":"__dg_members_itemDoubleClick"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.right = "10";
                                        this.bottom = "10";
                                        this.top = "180";
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "doubleClickEnabled":true,
                                            "columns":[_GroupRecruitDetailPanel_DataGridColumn1_i(), _GroupRecruitDetailPanel_DataGridColumn2_i(), _GroupRecruitDetailPanel_DataGridColumn3_i()]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitDetailPanel_RoundedLabel6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 14;
                                        this.fontWeight = "bold";
                                        this.horizontalCenter = "0";
                                        this.top = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":70});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GroupRecruitDetailPanel_BasicGlowButton1",
                        "events":{"click":"___GroupRecruitDetailPanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "styleName":"BtnStdRed2",
                                "width":65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GroupRecruitDetailPanel_BasicGlowButton2",
                        "events":{"click":"___GroupRecruitDetailPanel_BasicGlowButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":150,
                                "styleName":"BtnStdRed2",
                                "width":65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.bottom = "50";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":250,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitDetailPanel_RoundedLabel7",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "10";
                                        this.color = 0xFFFFFF;
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"linkTA",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0.3;
                                        this.backgroundColor = 0;
                                        this.borderStyle = "none";
                                        this.color = 16774324;
                                        this.bottom = "25";
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "40";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "editable":false,
                                            "enabled":true,
                                            "selectable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkTextInput,
                                    "id":"textInput",
                                    "events":{
                                        "valueCommit":"__textInput_valueCommit",
                                        "enter":"__textInput_enter"
                                    },
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "0";
                                        this.right = "50";
                                        this.left = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "maxChars":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_GroupRecruitDetailPanel_Button3",
                                    "events":{"click":"___GroupRecruitDetailPanel_Button3_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "0";
                                        this.bottom = "1";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.bottom = "50";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":205,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitDetailPanel_RoundedLabel8",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 14;
                                        this.fontWeight = "bold";
                                        this.horizontalCenter = "0";
                                        this.top = "10";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"dg_applyList",
                                    "events":{"itemDoubleClick":"__dg_applyList_itemDoubleClick"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.top = "40";
                                        this.left = "10";
                                        this.right = "10";
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "doubleClickEnabled":true,
                                            "columns":[_GroupRecruitDetailPanel_DataGridColumn4_i(), _GroupRecruitDetailPanel_DataGridColumn5_i(), _GroupRecruitDetailPanel_DataGridColumn6_i(), _GroupRecruitDetailPanel_DataGridColumn7_c()]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GroupRecruitDetailPanel_BasicGlowButton3",
                        "events":{"click":"___GroupRecruitDetailPanel_BasicGlowButton3_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                            this.horizontalCenter = "92";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed2",
                                "width":65
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _chatLog:ArrayQueue = new ArrayQueue(30);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GroupRecruitDetailPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 430;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___GroupRecruitDetailPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GroupRecruitDetailPanel._watcherSetupUtil = _arg_1;
        }


        private function _GroupRecruitDetailPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[8];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[3];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[19];
            _local_1 = isLeader;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[4];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[19];
            _local_1 = isLeader;
            _local_1 = Language.WEDDING_BOOK_PANEL_U[16];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[17];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[20];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[21];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[22];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[17];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[26];
            _local_1 = isLeader;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[27];
            _local_1 = isLeader;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[23];
            _local_1 = Language.CHATPANEL_U[1];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[18];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[20];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[21];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[22];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[24];
        }

        private function checkBtnEnabel():void
        {
            if ((((memList) && (isLeader)) && (memList.length < 5)))
            {
                acceptButtonEnable = true;
            }
            else
            {
                acceptButtonEnable = false;
            };
        }

        private function init():void
        {
            linkTA.addEventListener(FlexEvent.VALUE_COMMIT, onValueCommit);
        }

        private function _GroupRecruitDetailPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitDetailPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "level";
            _local_1.width = 40;
            _local_1.itemRenderer = _GroupRecruitDetailPanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_GroupRecruitDetailPanel_DataGridColumn2", _GroupRecruitDetailPanel_DataGridColumn2);
            return (_local_1);
        }

        public function showChatLog():void
        {
            if (!initialized)
            {
                callLater(showChatLog);
            }
            else
            {
                linkTA.htmlText = _chatLog.join();
            };
        }

        private function _GroupRecruitDetailPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitDetailPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "className";
            _local_1.width = 60;
            BindingManager.executeBindings(this, "_GroupRecruitDetailPanel_DataGridColumn6", _GroupRecruitDetailPanel_DataGridColumn6);
            return (_local_1);
        }

        public function ___GroupRecruitDetailPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            leaveRoom();
        }

        public function onSomeoneApply(_arg_1:Object):void
        {
            if (applyList)
            {
                _arg_1.className = GameData.d[GamePredef.TBL_CLASS][_arg_1.classId].name;
                applyList.addItem(_arg_1);
                updateGroupData();
            };
        }

        public function ___GroupRecruitDetailPanel_Button1_click(_arg_1:MouseEvent):void
        {
            setGroupRoom("will");
        }

        private function _GroupRecruitDetailPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CustomColumn;
            return (_local_1);
        }

        private function updateGroupData():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_GROUP_RECRUIT);
            _local_1.updateGroupData(memList, applyList);
        }

        public function onDeleteApply(_arg_1:Object):void
        {
            var _local_2:*;
            if (applyList)
            {
                for (_local_2 in applyList)
                {
                    if (applyList.getItemAt(_local_2).cid == _arg_1.cid)
                    {
                        applyList.removeItemAt(_local_2);
                        break;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get ns_hour():NumericStepper
        {
            return (this._2070514658ns_hour);
        }

        private function set memList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._948230163memList;
            if (_local_2 !== _arg_1)
            {
                this._948230163memList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "memList", _local_2, _arg_1));
            };
        }

        public function __dg_members_itemDoubleClick(_arg_1:ListEvent):void
        {
            dgItemClick(_arg_1);
        }

        public function acceptRoomApply(_arg_1:int):void
        {
            _core.remote.acceptRoomApply(_arg_1);
        }

        private function checkBlank():void
        {
            if ((((textInput) && (textInput.text)) && (textInput.text.length <= 0)))
            {
                textInput.htmlText = "";
            };
        }

        public function onRoomSay(_arg_1:Object):void
        {
            var _local_2:int = _arg_1[0];
            var _local_3:String = _arg_1[1];
            var _local_4:String = _arg_1[2];
            var _local_5:* = ((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _local_2) + "|") + _local_3) + "|0|0|0]") + "<font color='#00ff00'>[") + ToolKit.getTimeStrNow()) + "]</font>") + TextUtil.encode(_local_4)) + "<br>");
            _chatLog.push(TextUtil.decode(_local_5));
            if (initialized)
            {
                linkTA.htmlText = _chatLog.join();
            };
        }

        private function leaveRoom():void
        {
            var func:Function = function (_arg_1:CloseEvent):*
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.leaveRoom();
                    clearChatLog();
                };
            };
            Alert.show(Language.GROUP_RECRUIT_PANEL_S[2], null, (Alert.YES | Alert.NO), null, func);
        }

        public function __dg_applyList_itemDoubleClick(_arg_1:ListEvent):void
        {
            dgItemClick(_arg_1);
        }

        public function set ns_hour(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._2070514658ns_hour;
            if (_local_2 !== _arg_1)
            {
                this._2070514658ns_hour = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns_hour", _local_2, _arg_1));
            };
        }

        public function ___GroupRecruitDetailPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        private function get memList():ArrayCollection
        {
            return (this._948230163memList);
        }

        [Bindable(event="propertyChange")]
        public function get rl():RoundedLabel
        {
            return (this._3642rl);
        }

        public function onSystemRoomSay(_arg_1:String):void
        {
            _arg_1 = (((("<font color='#ff0000'>" + Language.GROUP_RECRUIT_PANEL_S[25]) + _arg_1) + "\n") + "</font>");
            _chatLog.push(_arg_1);
            if (initialized)
            {
                linkTA.htmlText = _chatLog.join();
            };
        }

        private function _GroupRecruitDetailPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitDetailPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 50;
            _local_1.itemRenderer = _GroupRecruitDetailPanel_ClassFactory1_c();
            BindingManager.executeBindings(this, "_GroupRecruitDetailPanel_DataGridColumn1", _GroupRecruitDetailPanel_DataGridColumn1);
            return (_local_1);
        }

        public function onSetRoomHost(_arg_1:int):void
        {
            var _local_2:String;
            var _local_3:*;
            var _local_4:*;
            var _local_5:String;
            leaderId = _arg_1;
            for (_local_3 in memList)
            {
                memList[_local_3].leaderId = _arg_1;
                if (memList[_local_3].cid == leaderId)
                {
                    _local_2 = memList[_local_3].name;
                };
            };
            for (_local_4 in applyList)
            {
                applyList[_local_4].leaderId = _arg_1;
            };
            if (initialized)
            {
                dg_members.dataProvider = memList;
                dg_applyList.dataProvider = applyList;
            };
            if (_arg_1 == _core.player.id)
            {
                isLeader = true;
            }
            else
            {
                isLeader = false;
            };
            checkBtnEnabel();
            if (_local_2)
            {
                _local_5 = Language.GROUP_RECRUIT_PANEL_S[29].toString().replace("{name}", _local_2);
                onSystemRoomSay(_local_5);
                if (!visible)
                {
                    _core.addWarn({"warnType":GamePredef.WARN_TYPE_GROUP_CHAT});
                };
            };
            if (_arg_1 == _core.player.id)
            {
                _core.sysMidNote(Language.GROUP_RECRUIT_PANEL_S[32]);
            };
        }

        public function reset():void
        {
            clearChatLog();
        }

        public function onAcceptRoomApply(_arg_1:int):void
        {
            var _local_2:String;
            var _local_3:*;
            var _local_4:String;
            if (_arg_1 == _core.player.id)
            {
                _local_2 = _core.player.name;
            };
            for (_local_3 in applyList)
            {
                if (applyList.getItemAt(_local_3).cid == _arg_1)
                {
                    _local_2 = applyList.getItemAt(_local_3).name;
                    memList.addItem(applyList.getItemAt(_local_3));
                    applyList.removeItemAt(_local_3);
                    break;
                };
            };
            checkBtnEnabel();
            updateGroupData();
            if (_local_2)
            {
                _local_4 = Language.GROUP_RECRUIT_PANEL_S[30].toString().replace("{name}", _local_2);
                onSystemRoomSay(_local_4);
                ((!(visible)) && (_core.addWarn({"warnType":GamePredef.WARN_TYPE_GROUP_CHAT})));
            };
        }

        private function _GroupRecruitDetailPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitDetailPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "level";
            _local_1.width = 48;
            BindingManager.executeBindings(this, "_GroupRecruitDetailPanel_DataGridColumn5", _GroupRecruitDetailPanel_DataGridColumn5);
            return (_local_1);
        }

        private function _GroupRecruitDetailPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CustomColumn;
            return (_local_1);
        }

        public function set textInput(_arg_1:LinkTextInput):void
        {
            var _local_2:Object = this._1058056547textInput;
            if (_local_2 !== _arg_1)
            {
                this._1058056547textInput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textInput", _local_2, _arg_1));
            };
        }

        private function kickRoomMember():void
        {
            if (!dg_members.selectedItem)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[21]);
                return;
            };
            if (dg_members.selectedItem.cid == _core.player.id)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[22]);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.kickRoomMember(dg_members.selectedItem.cid);
                };
            };
            var msg:String = Language.GROUP_RECRUIT_PANEL_S[23].toString().replace("{name}", dg_members.selectedItem.name);
            Alert.show(msg, null, (Alert.YES | Alert.NO), null, func);
        }

        public function ___GroupRecruitDetailPanel_Button2_click(_arg_1:MouseEvent):void
        {
            setGroupRoom("time");
        }

        public function onSetRoomConfig(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_4:Date;
            if (_arg_1.fid)
            {
                if (initialized)
                {
                    rl.text = willList[_arg_1.fid].name;
                };
                _local_2 = Language.GROUP_RECRUIT_PANEL_S[26].toString().replace("{name}", willList[_arg_1.fid].name);
            };
            if (_arg_1.time)
            {
                _local_4 = new Date();
                _local_4.setTime(_arg_1.time);
                if (initialized)
                {
                    ns_hour.value = _local_4.getHours();
                    ns_minute.value = _local_4.getMinutes();
                };
                _local_2 = Language.GROUP_RECRUIT_PANEL_S[27].toString().replace("{hour}", _local_4.getHours()).replace("{minute}", _local_4.getMinutes());
            };
            ((_local_2) && (onSystemRoomSay(_local_2)));
            var _local_3:Object = _core.view.getUI(ViewManager.PANEL_GROUP_RECRUIT);
            _local_3.onSetRoomConfig(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get dg_members():DataGrid
        {
            return (this._648591011dg_members);
        }

        private function menuPop(_arg_1:Object):void
        {
            var _local_2:Menu = CustomMenu.createMenu(null, _arg_1);
            _local_2.show(stage.mouseX, stage.mouseY);
            _local_2.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        private function set applyList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._2075901652applyList;
            if (_local_2 !== _arg_1)
            {
                this._2075901652applyList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "applyList", _local_2, _arg_1));
            };
        }

        public function set rl(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3642rl;
            if (_local_2 !== _arg_1)
            {
                this._3642rl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl", _local_2, _arg_1));
            };
        }

        private function send():void
        {
            var _local_1:String = textInput.text;
            _core.remote.roomChat(_local_1);
            textInput.htmlText = "";
        }

        [Bindable(event="propertyChange")]
        public function get acceptButtonEnable():Boolean
        {
            return (this._1786660989acceptButtonEnable);
        }

        private function _GroupRecruitDetailPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitDetailPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 55;
            BindingManager.executeBindings(this, "_GroupRecruitDetailPanel_DataGridColumn4", _GroupRecruitDetailPanel_DataGridColumn4);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:GroupRecruitDetailPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GroupRecruitDetailPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GroupRecruitDetailPanelWatcherSetupUtil");
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

        public function __textInput_valueCommit(_arg_1:FlexEvent):void
        {
            checkBlank();
        }

        private function _GroupRecruitDetailPanel_ClassFactory4_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = GroupRecruitDetailPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get dg_applyList():DataGrid
        {
            return (this._351125616dg_applyList);
        }

        public function ___GroupRecruitDetailPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            setRoomHost();
        }

        public function ___GroupRecruitDetailPanel_Button3_click(_arg_1:MouseEvent):void
        {
            send();
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            if (_arg_1.index == 0)
            {
                _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(tempName);
            }
            else
            {
                if (_arg_1.index == 1)
                {
                    ChatPanelUtil.createChatPanel(tempCid);
                }
                else
                {
                    if (_arg_1.index == 2)
                    {
                        _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(tempCid);
                    };
                };
            };
        }

        private function onValueCommit(_arg_1:Event):void
        {
            var _local_2:LinkTextArea = (_arg_1.target as LinkTextArea);
            _local_2.verticalScrollPosition = _local_2.maxVerticalScrollPosition;
        }

        private function setRoomHost():void
        {
            if (!dg_members.selectedItem)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[17]);
                return;
            };
            if (dg_members.selectedItem.cid == _core.player.id)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[18]);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.setRoomHost(dg_members.selectedItem.cid);
                };
            };
            var msg:String = Language.GROUP_RECRUIT_PANEL_S[16].toString().replace("{name}", dg_members.selectedItem.name);
            Alert.show(msg, null, (Alert.YES | Alert.NO), null, func);
        }

        public function set isLeader(_arg_1:Boolean):void
        {
            var _local_2:Object = this._432720173isLeader;
            if (_local_2 !== _arg_1)
            {
                this._432720173isLeader = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isLeader", _local_2, _arg_1));
            };
        }

        public function set ns_minute(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1057325618ns_minute;
            if (_local_2 !== _arg_1)
            {
                this._1057325618ns_minute = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns_minute", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get textInput():LinkTextInput
        {
            return (this._1058056547textInput);
        }

        private function setGroupRoom(_arg_1:String):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_GROUP_RECRUIT_UPDATE);
            _local_2.setState(_arg_1);
            _local_2.show();
            _local_2.setWill(willTypeList, willList);
            _local_2.setLevel(minLevel, maxLevel);
        }

        private function _GroupRecruitDetailPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GroupRecruitDetailPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_RoundedLabel1.text = _arg_1;
            }, "_GroupRecruitDetailPanel_RoundedLabel1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_Button1.label = _arg_1;
            }, "_GroupRecruitDetailPanel_Button1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (isLeader);
            }, function (_arg_1:Boolean):void
            {
                _GroupRecruitDetailPanel_Button1.enabled = _arg_1;
            }, "_GroupRecruitDetailPanel_Button1.enabled");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_RoundedLabel3.text = _arg_1;
            }, "_GroupRecruitDetailPanel_RoundedLabel3.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_Button2.label = _arg_1;
            }, "_GroupRecruitDetailPanel_Button2.label");
            result[5] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (isLeader);
            }, function (_arg_1:Boolean):void
            {
                _GroupRecruitDetailPanel_Button2.enabled = _arg_1;
            }, "_GroupRecruitDetailPanel_Button2.enabled");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_RoundedLabel4.text = _arg_1;
            }, "_GroupRecruitDetailPanel_RoundedLabel4.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_RoundedLabel5.text = _arg_1;
            }, "_GroupRecruitDetailPanel_RoundedLabel5.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_DataGridColumn1.headerText = _arg_1;
            }, "_GroupRecruitDetailPanel_DataGridColumn1.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_DataGridColumn2.headerText = _arg_1;
            }, "_GroupRecruitDetailPanel_DataGridColumn2.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_DataGridColumn3.headerText = _arg_1;
            }, "_GroupRecruitDetailPanel_DataGridColumn3.headerText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_RoundedLabel6.text = _arg_1;
            }, "_GroupRecruitDetailPanel_RoundedLabel6.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_BasicGlowButton1.label = _arg_1;
            }, "_GroupRecruitDetailPanel_BasicGlowButton1.label");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (isLeader);
            }, function (_arg_1:Boolean):void
            {
                _GroupRecruitDetailPanel_BasicGlowButton1.enabled = _arg_1;
            }, "_GroupRecruitDetailPanel_BasicGlowButton1.enabled");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_BasicGlowButton2.label = _arg_1;
            }, "_GroupRecruitDetailPanel_BasicGlowButton2.label");
            result[15] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (isLeader);
            }, function (_arg_1:Boolean):void
            {
                _GroupRecruitDetailPanel_BasicGlowButton2.enabled = _arg_1;
            }, "_GroupRecruitDetailPanel_BasicGlowButton2.enabled");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_RoundedLabel7.text = _arg_1;
            }, "_GroupRecruitDetailPanel_RoundedLabel7.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_Button3.label = _arg_1;
            }, "_GroupRecruitDetailPanel_Button3.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_RoundedLabel8.text = _arg_1;
            }, "_GroupRecruitDetailPanel_RoundedLabel8.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_DataGridColumn4.headerText = _arg_1;
            }, "_GroupRecruitDetailPanel_DataGridColumn4.headerText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_DataGridColumn5.headerText = _arg_1;
            }, "_GroupRecruitDetailPanel_DataGridColumn5.headerText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_DataGridColumn6.headerText = _arg_1;
            }, "_GroupRecruitDetailPanel_DataGridColumn6.headerText");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitDetailPanel_BasicGlowButton3.label = _arg_1;
            }, "_GroupRecruitDetailPanel_BasicGlowButton3.label");
            result[23] = binding;
            return (result);
        }

        public function set dg_members(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._648591011dg_members;
            if (_local_2 !== _arg_1)
            {
                this._648591011dg_members = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dg_members", _local_2, _arg_1));
            };
        }

        public function clearChatLog():void
        {
            if (initialized)
            {
                linkTA.htmlText = "";
            };
            _chatLog.clear();
            dataFlag = false;
        }

        [Bindable(event="propertyChange")]
        private function get applyList():ArrayCollection
        {
            return (this._2075901652applyList);
        }

        private function _GroupRecruitDetailPanel_DataGridColumn7_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.width = 35;
            _local_1.itemRenderer = _GroupRecruitDetailPanel_ClassFactory4_c();
            return (_local_1);
        }

        private function _GroupRecruitDetailPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitDetailPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "className";
            _local_1.width = 60;
            _local_1.itemRenderer = _GroupRecruitDetailPanel_ClassFactory3_c();
            BindingManager.executeBindings(this, "_GroupRecruitDetailPanel_DataGridColumn3", _GroupRecruitDetailPanel_DataGridColumn3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get isLeader():Boolean
        {
            return (this._432720173isLeader);
        }

        public function __textInput_enter(_arg_1:FlexEvent):void
        {
            send();
        }

        public function initMyRoom(_arg_1:Object, _arg_2:Array, _arg_3:Array):void
        {
            var _local_6:Object;
            var _local_7:Object;
            var _local_4:Number = (_arg_1.d.time + TimeUtil.timeOSOffSet);
            minLevel = _arg_1.d.minLevel;
            maxLevel = _arg_1.d.maxLevel;
            willTypeList = _arg_2;
            willList = _arg_3;
            rl.text = willList[_arg_1.d.fid].name;
            leaderId = _arg_1.d.cid;
            var _local_5:Date = new Date();
            _local_5.setTime(_local_4);
            ns_hour.value = _local_5.getHours();
            ns_minute.value = _local_5.getMinutes();
            memList = new ArrayCollection();
            applyList = new ArrayCollection();
            for each (_local_6 in _arg_1.d.members)
            {
                _local_6.className = GameData.d[GamePredef.TBL_CLASS][_local_6.classId].name;
                _local_6.leaderId = leaderId;
                memList.addItem(_local_6);
            };
            for each (_local_7 in _arg_1.d.applyList)
            {
                _local_7.className = GameData.d[GamePredef.TBL_CLASS][_local_7.classId].name;
                _local_7.leaderId = leaderId;
                applyList.addItem(_local_7);
            };
            dg_members.dataProvider = memList;
            dg_applyList.dataProvider = applyList;
            if (_arg_1.d.cid == _core.player.id)
            {
                isLeader = true;
            }
            else
            {
                isLeader = false;
            };
            checkBtnEnabel();
            dataFlag = true;
        }

        public function ___GroupRecruitDetailPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            kickRoomMember();
        }

        private function _GroupRecruitDetailPanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CustomColumn;
            return (_local_1);
        }

        public function set linkTA(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1102666777linkTA;
            if (_local_2 !== _arg_1)
            {
                this._1102666777linkTA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "linkTA", _local_2, _arg_1));
            };
        }

        public function onMemberLeave(_arg_1:int):void
        {
            var _local_2:*;
            for (_local_2 in memList)
            {
                if (memList.getItemAt(_local_2).cid == _arg_1)
                {
                    memList.removeItemAt(_local_2);
                    break;
                };
            };
            checkBtnEnabel();
            updateGroupData();
        }

        [Bindable(event="propertyChange")]
        public function get ns_minute():NumericStepper
        {
            return (this._1057325618ns_minute);
        }

        public function set dg_applyList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._351125616dg_applyList;
            if (_local_2 !== _arg_1)
            {
                this._351125616dg_applyList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dg_applyList", _local_2, _arg_1));
            };
        }

        private function dgItemClick(_arg_1:ListEvent):void
        {
            tempCid = _arg_1.itemRenderer.data.cid;
            tempName = _arg_1.itemRenderer.data.name;
            menuPop([{"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}]);
        }

        public function set acceptButtonEnable(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1786660989acceptButtonEnable;
            if (_local_2 !== _arg_1)
            {
                this._1786660989acceptButtonEnable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "acceptButtonEnable", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get linkTA():LinkTextArea
        {
            return (this._1102666777linkTA);
        }


    }
}//package com.qeedoo.ui.view.compDragable

