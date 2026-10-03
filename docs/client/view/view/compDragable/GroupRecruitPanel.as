// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GroupRecruitPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.effects.Glow;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.controls.DataGrid;
    import mx.controls.ComboBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import flash.events.Event;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.binding.BindingManager;
    import com.qeedoo.game.utils.TimeUtil;
    import mx.events.ListEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import mx.controls.Alert;
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

    public class GroupRecruitPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const PAGE_MAX_ROOM_NUM:int = 10;
        private const MAX_BOOK_INTERVAL:Number = 0x6DDD00;
        private const MIN_INTERVAL_TO_SERVER:int = 60000;
        public var _GroupRecruitPanel_DataGridColumn2:DataGridColumn;
        public var _GroupRecruitPanel_DataGridColumn5:DataGridColumn;
        private var _2070514658ns_hour:NumericStepper;
        private var _739732038ns_maxLevel:NumericStepper;
        public var _GroupRecruitPanel_RoundedLabel1:RoundedLabel;
        public var _GroupRecruitPanel_RoundedLabel2:RoundedLabel;
        public var _GroupRecruitPanel_RoundedLabel3:RoundedLabel;
        public var _GroupRecruitPanel_RoundedLabel4:RoundedLabel;
        public var _GroupRecruitPanel_RoundedLabel5:RoundedLabel;
        public var _GroupRecruitPanel_RoundedLabel6:RoundedLabel;
        public var _GroupRecruitPanel_RoundedLabel7:RoundedLabel;
        public var _GroupRecruitPanel_RoundedLabel8:RoundedLabel;
        private var _3322014list:List;
        public var _GroupRecruitPanel_DelayButton1:DelayButton;
        private var roomList:ArrayCollection;
        public var _GroupRecruitPanel_BasicGlowButton1:BasicGlowButton;
        private var _1945694071xmlWill:XML;
        private var _1057325618ns_minute:NumericStepper;
        public var _GroupRecruitPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _207684226glowEffect:Glow;
        private var myGroupData:Object;
        private var _3494058rbtn:CheckBox;
        private var _1265282384btn_myGroup:BasicGlowButton;
        private var willList:Array;
        private var _607339634pageSelector:PageSelector;
        private var _createdFlag:* = false;
        private var _firstFlag:* = true;
        private var _3203dg:DataGrid;
        private var lastSelectItemName:String;
        private var timeFlag:Number = 0;
        private var _1779038604ns_minLevel:NumericStepper;
        private var _94442652cb_fb:ComboBox;
        private var willTypeList:Array;
        public var _GroupRecruitPanel_DataGridColumn1:DataGridColumn;
        public var _GroupRecruitPanel_DataGridColumn3:DataGridColumn;
        public var _GroupRecruitPanel_DataGridColumn4:DataGridColumn;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GroupRecruitPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.left = "10";
                            this.bottom = "45";
                            this.right = "490";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitPanel_RoundedLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.horizontalCenter = "0";
                                        this.top = "5";
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitPanel_RoundedLabel2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":40,
                                            "width":65
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"cb_fb",
                                    "events":{"change":"__cb_fb_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":60,
                                            "width":128,
                                            "labelField":"name"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"rbtn",
                                    "events":{"click":"__rbtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":65,
                                            "y":38
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":List,
                                    "id":"list",
                                    "events":{"click":"__list_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.top = "90";
                                        this.bottom = "115";
                                        this.left = "10";
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CSSBorder",
                                            "horizontalScrollPolicy":"off",
                                            "itemRenderer":_GroupRecruitPanel_ClassFactory1_c()
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitPanel_RoundedLabel3",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.bottom = "40";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":153});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_hour",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "15";
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "minimum":0,
                                            "maximum":23
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_minute",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "15";
                                        this.left = "105";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "minimum":0,
                                            "maximum":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitPanel_RoundedLabel4",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.bottom = "15";
                                        this.left = "70";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":20});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitPanel_RoundedLabel5",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.bottom = "15";
                                        this.left = "161";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":20});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitPanel_RoundedLabel6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":236
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitPanel_RoundedLabel7",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":77,
                                            "y":258,
                                            "width":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_maxLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":105,
                                            "y":0x0100,
                                            "maximum":150,
                                            "stepSize":1,
                                            "value":150,
                                            "width":58
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_minLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":0x0100,
                                            "maximum":150,
                                            "stepSize":1,
                                            "value":30,
                                            "width":59
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
                            this.bottom = "45";
                            this.right = "10";
                            this.left = "218";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_GroupRecruitPanel_RoundedLabel8",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.horizontalCenter = "0";
                                        this.top = "5";
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"dg",
                                    "events":{"itemDoubleClick":"__dg_itemDoubleClick"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                        this.left = "10";
                                        this.top = "41";
                                        this.bottom = "30";
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "doubleClickEnabled":true,
                                            "columns":[_GroupRecruitPanel_DataGridColumn1_i(), _GroupRecruitPanel_DataGridColumn2_i(), _GroupRecruitPanel_DataGridColumn3_i(), _GroupRecruitPanel_DataGridColumn4_i(), _GroupRecruitPanel_DataGridColumn5_i(), _GroupRecruitPanel_DataGridColumn6_c()]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"pageSelector",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "5";
                                        this.horizontalCenter = "0";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"_GroupRecruitPanel_DelayButton1",
                                    "events":{"click":"___GroupRecruitPanel_DelayButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "5";
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":60000,
                                            "styleName":"BtnStdRed2",
                                            "width":50
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GroupRecruitPanel_BasicGlowButton1",
                        "events":{"click":"___GroupRecruitPanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed2",
                                "width":50,
                                "x":76
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn_myGroup",
                        "events":{"click":"__btn_myGroup_click"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                            this.bottom = "15";
                            this.right = "18";
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
        private var _90794110_core:Core = Core.getInstance();
        private var _1972467768pageRoomList:ArrayCollection = new ArrayCollection();
        private var _77872101searchResult:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GroupRecruitPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 430;
            this.styleName = "StandardContent";
            _GroupRecruitPanel_Glow1_i();
            _GroupRecruitPanel_XML1_i();
            this.addEventListener("creationComplete", ___GroupRecruitPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GroupRecruitPanel._watcherSetupUtil = _arg_1;
        }


        public function updateGroupData(_arg_1:Object, _arg_2:Object):void
        {
            if (((myGroupData) && (myGroupData.f)))
            {
                myGroupData.d.applyList = _arg_2;
                myGroupData.d.members = _arg_1;
            };
        }

        public function setFirstFlag(_arg_1:Boolean):void
        {
            _firstFlag = _arg_1;
        }

        public function set glowEffect(_arg_1:Glow):void
        {
            var _local_2:Object = this._207684226glowEffect;
            if (_local_2 !== _arg_1)
            {
                this._207684226glowEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local_2, _arg_1));
            };
        }

        public function set dg(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._3203dg;
            if (_local_2 !== _arg_1)
            {
                this._3203dg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dg", _local_2, _arg_1));
            };
        }

        public function __btn_myGroup_click(_arg_1:MouseEvent):void
        {
            getMyGroup();
        }

        private function set _core(_arg_1:Core):void
        {
            var _local_2:Object = this._90794110_core;
            if (_local_2 !== _arg_1)
            {
                this._90794110_core = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_core", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            var _local_2:XML;
            var _local_3:Object;
            willList = [];
            willTypeList = [];
            var _local_1:XML = new XML(xmlWill);
            for each (_local_2 in _local_1.WILL)
            {
                _local_3 = new Object();
                _local_3.name = _local_2.@Name.toString();
                _local_3.id = parseInt(_local_2.@id.toString());
                _local_3.type = parseInt(_local_2.@type.toString());
                _local_3.typeName = _local_2.@typeName.toString();
                _local_3.level = parseInt(_local_2.@Level.toString());
                willList[_local_3.id] = _local_3;
                willTypeList[_local_3.type] = {
                    "data":_local_3.type,
                    "name":_local_3.typeName
                };
            };
            cb_fb.dataProvider = willTypeList;
            setDefultData();
            cb_fb.selectedIndex = 0;
            _core.remote.getRoomList();
        }

        public function ___GroupRecruitPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get ns_hour():NumericStepper
        {
            return (this._2070514658ns_hour);
        }

        private function _GroupRecruitPanel_XML1_i():XML
        {
            var _local_1:XML = <WillList><WILL type="1" typeName="副本" id="1" Name="迷幻树洞(简单)" Level="50"></WILL><WILL type="1" typeName="副本" id="2" Name="大漠宝库(简单)" Level="60"></WILL><WILL type="1" typeName="副本" id="3" Name="绿野秘境(简单)" Level="80"></WILL><WILL type="1" typeName="副本" id="4" Name="烈焰深渊(简单)" Level="90"></WILL><WILL type="1" typeName="副本" id="5" Name="烈焰深渊(普通)" Level="90"></WILL><WILL type="1" typeName="副本" id="6" Name="烈焰深渊(困难)" Level="90"></WILL><WILL type="1" typeName="副本" id="7" Name="重返狼穴(简单)" Level="100"></WILL><WILL type="1" typeName="副本" id="8" Name="重返狼穴(普通)" Level="100"></WILL><WILL type="1" typeName="副本" id="9" Name="重返狼穴(困难)" Level="100"></WILL><WILL type="1" typeName="副本" id="10" Name="吸血鬼乐园(简单)" Level="120"></WILL><WILL type="1" typeName="副本" id="11" Name="吸血鬼乐园(普通)" Level="120"></WILL><WILL type="1" typeName="副本" id="12" Name="吸血鬼乐园(困难)" Level="120"></WILL><WILL type="2" typeName="活动" id="13" Name="无忧保卫战" Level="30"></WILL><WILL type="2" typeName="活动" id="14" Name="恶灵现世" Level="50"></WILL><WILL type="3" typeName="日常" id="15" Name="悬赏任务" Level="10"></WILL><WILL type="3" typeName="日常" id="16" Name="除魔任务" Level="50"></WILL><WILL type="3" typeName="日常" id="17" Name="神修任务" Level="50"></WILL></WillList>
            ;
            xmlWill = _local_1;
            return (_local_1);
        }

        private function clickRadioBtn(_arg_1:Event):void
        {
            if (rbtn.selected)
            {
                cb_fb.enabled = false;
                list.enabled = false;
                ns_minLevel.value = 30;
            }
            else
            {
                cb_fb.enabled = true;
                list.enabled = true;
            };
        }

        public function refreshGroupList():void
        {
            _core.remote.getRoomList();
        }

        public function setAcceptBtnEnable(_arg_1:Boolean):void
        {
            var _local_2:*;
            for (_local_2 in roomList)
            {
                roomList.getItemAt(_local_2).st = (!(_arg_1));
            };
            initPageSelector();
        }

        private function _GroupRecruitPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GroupRecruitPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_RoundedLabel1.text = _arg_1;
            }, "_GroupRecruitPanel_RoundedLabel1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_RoundedLabel2.text = _arg_1;
            }, "_GroupRecruitPanel_RoundedLabel2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rbtn.label = _arg_1;
            }, "rbtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_RoundedLabel3.text = _arg_1;
            }, "_GroupRecruitPanel_RoundedLabel3.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_RoundedLabel4.text = _arg_1;
            }, "_GroupRecruitPanel_RoundedLabel4.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_RoundedLabel5.text = _arg_1;
            }, "_GroupRecruitPanel_RoundedLabel5.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_RoundedLabel6.text = _arg_1;
            }, "_GroupRecruitPanel_RoundedLabel6.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_RoundedLabel7.text = _arg_1;
            }, "_GroupRecruitPanel_RoundedLabel7.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_RoundedLabel8.text = _arg_1;
            }, "_GroupRecruitPanel_RoundedLabel8.text");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pageRoomList);
            }, function (_arg_1:Object):void
            {
                dg.dataProvider = _arg_1;
            }, "dg.dataProvider");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_DataGridColumn1.headerText = _arg_1;
            }, "_GroupRecruitPanel_DataGridColumn1.headerText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_DataGridColumn2.headerText = _arg_1;
            }, "_GroupRecruitPanel_DataGridColumn2.headerText");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_DataGridColumn3.headerText = _arg_1;
            }, "_GroupRecruitPanel_DataGridColumn3.headerText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_DataGridColumn4.headerText = _arg_1;
            }, "_GroupRecruitPanel_DataGridColumn4.headerText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_DataGridColumn5.headerText = _arg_1;
            }, "_GroupRecruitPanel_DataGridColumn5.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_DelayButton1.label = _arg_1;
            }, "_GroupRecruitPanel_DelayButton1.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitPanel_BasicGlowButton1.label = _arg_1;
            }, "_GroupRecruitPanel_BasicGlowButton1.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_myGroup.label = _arg_1;
            }, "btn_myGroup.label");
            result[18] = binding;
            return (result);
        }

        private function initPageSelector2():void
        {
            var _local_1:int;
            if (searchResult.length >= PAGE_MAX_ROOM_NUM)
            {
                _local_1 = PAGE_MAX_ROOM_NUM;
            }
            else
            {
                _local_1 = searchResult.length;
            };
            var _local_2:int;
            while (_local_2 < _local_1)
            {
                pageRoomList.addItem(searchResult.getItemAt(_local_2));
                _local_2++;
            };
            pageSelector.onPageChanged = onPageChanged2;
            pageSelector.onPageCleared = clearPage2;
            pageSelector.initPageSeletor(searchResult.length, PAGE_MAX_ROOM_NUM);
        }

        private function _GroupRecruitPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "range";
            _local_1.width = 80;
            BindingManager.executeBindings(this, "_GroupRecruitPanel_DataGridColumn2", _GroupRecruitPanel_DataGridColumn2);
            return (_local_1);
        }

        private function clearPage2():void
        {
            pageRoomList.removeAll();
        }

        public function onGetRoomList(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Number;
            var _local_4:Date;
            if (!willList)
            {
                callLater(onGetRoomList, [_arg_1]);
            }
            else
            {
                roomList = new ArrayCollection();
                for each (_local_2 in _arg_1.d)
                {
                    _local_2.st = _arg_1.st;
                    _local_2.range = ((_local_2.minLevel + "--") + _local_2.maxLevel);
                    _local_2.fb = ((willList[_local_2.fid]) && (willList[_local_2.fid].name));
                    _local_3 = (_local_2.time + TimeUtil.timeOSOffSet);
                    _local_4 = new Date();
                    _local_4.setTime(_local_3);
                    _local_2.date = TimeUtil.dateFormatter.format(_local_4);
                    roomList.addItem(_local_2);
                };
                initPageSelector();
            };
        }

        public function set cb_fb(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._94442652cb_fb;
            if (_local_2 !== _arg_1)
            {
                this._94442652cb_fb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb_fb", _local_2, _arg_1));
            };
        }

        public function set ns_minLevel(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1779038604ns_minLevel;
            if (_local_2 !== _arg_1)
            {
                this._1779038604ns_minLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns_minLevel", _local_2, _arg_1));
            };
        }

        public function set list(_arg_1:List):void
        {
            var _local_2:Object = this._3322014list;
            if (_local_2 !== _arg_1)
            {
                this._3322014list = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "list", _local_2, _arg_1));
            };
        }

        public function getCreatedFlag():Boolean
        {
            return (_createdFlag);
        }

        public function set xmlWill(_arg_1:XML):void
        {
            var _local_2:Object = this._1945694071xmlWill;
            if (_local_2 !== _arg_1)
            {
                this._1945694071xmlWill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xmlWill", _local_2, _arg_1));
            };
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

        private function onPageChanged2(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                pageRoomList.addItem(searchResult.getItemAt(_local_3));
                _local_4++;
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

        public function reset():void
        {
            _firstFlag = true;
            _createdFlag = false;
            timeFlag = 0;
        }

        [Bindable(event="propertyChange")]
        public function get btn_myGroup():BasicGlowButton
        {
            return (this._1265282384btn_myGroup);
        }

        private function _GroupRecruitPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[0];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[1];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[3];
            _local_1 = Language.GROUP_RECRUIT_PANEL_S[24];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[33];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[16];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[17];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[2];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[14];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[0];
            _local_1 = pageRoomList;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[5];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[2];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[3];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[4];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[6];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[28];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[12];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[8];
        }

        public function ___GroupRecruitPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            searchGroup();
        }

        private function clickList(_arg_1:MouseEvent):void
        {
            if (_arg_1.target.hasOwnProperty("text"))
            {
                if (_arg_1.target.text == lastSelectItemName)
                {
                    list.selectedIndex = -1;
                    lastSelectItemName = "";
                }
                else
                {
                    lastSelectItemName = _arg_1.target.text;
                };
            };
        }

        public function __dg_itemDoubleClick(_arg_1:ListEvent):void
        {
            dgItemClick(_arg_1);
        }

        public function set rbtn(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3494058rbtn;
            if (_local_2 !== _arg_1)
            {
                this._3494058rbtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rbtn", _local_2, _arg_1));
            };
        }

        private function _GroupRecruitPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "leaderName";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_GroupRecruitPanel_DataGridColumn1", _GroupRecruitPanel_DataGridColumn1);
            return (_local_1);
        }

        public function onSetRoomConfig(_arg_1:Object):void
        {
            if (_arg_1.time)
            {
                myGroupData.d.time = _arg_1.time;
            };
            if (_arg_1.fid)
            {
                myGroupData.d.fid = _arg_1.fid;
            };
        }

        private function _GroupRecruitPanel_DataGridColumn6_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "";
            _local_1.itemRenderer = _GroupRecruitPanel_ClassFactory2_c();
            return (_local_1);
        }

        private function setDefultData():void
        {
            var _local_3:*;
            var _local_1:int;
            var _local_2:Array = [];
            for (_local_3 in willList)
            {
                if (willList[_local_3].type == _local_1)
                {
                    _local_2.push(willList[_local_3]);
                };
            };
            list.dataProvider = _local_2;
            rbtn.selected = true;
            cb_fb.enabled = false;
            list.enabled = false;
        }

        private function _GroupRecruitPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = GroupRecruitPanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function _GroupRecruitPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "memberNum";
            _local_1.width = 65;
            BindingManager.executeBindings(this, "_GroupRecruitPanel_DataGridColumn5", _GroupRecruitPanel_DataGridColumn5);
            return (_local_1);
        }

        private function menuPop(_arg_1:Object):void
        {
            var _local_2:Menu = CustomMenu.createMenu(null, _arg_1);
            _local_2.show(stage.mouseX, stage.mouseY);
            _local_2.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        public function set ns_maxLevel(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._739732038ns_maxLevel;
            if (_local_2 !== _arg_1)
            {
                this._739732038ns_maxLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns_maxLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get glowEffect():Glow
        {
            return (this._207684226glowEffect);
        }

        private function clearPage():void
        {
            pageRoomList.removeAll();
        }

        [Bindable(event="propertyChange")]
        private function get _core():Core
        {
            return (this._90794110_core);
        }

        public function getFirstFlag():Boolean
        {
            return (_firstFlag);
        }

        public function __list_click(_arg_1:MouseEvent):void
        {
            clickList(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get xmlWill():XML
        {
            return (this._1945694071xmlWill);
        }

        [Bindable(event="propertyChange")]
        public function get ns_minLevel():NumericStepper
        {
            return (this._1779038604ns_minLevel);
        }

        [Bindable(event="propertyChange")]
        public function get dg():DataGrid
        {
            return (this._3203dg);
        }

        public function __cb_fb_change(_arg_1:ListEvent):void
        {
            changeWillType(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:GroupRecruitPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GroupRecruitPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GroupRecruitPanelWatcherSetupUtil");
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
        public function get list():List
        {
            return (this._3322014list);
        }

        private function changeListItem(_arg_1:Event):void
        {
            ns_minLevel.value = list.selectedItem.level;
        }

        public function __rbtn_click(_arg_1:MouseEvent):void
        {
            clickRadioBtn(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get cb_fb():ComboBox
        {
            return (this._94442652cb_fb);
        }

        private function _GroupRecruitPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "date";
            _local_1.width = 85;
            BindingManager.executeBindings(this, "_GroupRecruitPanel_DataGridColumn4", _GroupRecruitPanel_DataGridColumn4);
            return (_local_1);
        }

        public function set btn_myGroup(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1265282384btn_myGroup;
            if (_local_2 !== _arg_1)
            {
                this._1265282384btn_myGroup = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_myGroup", _local_2, _arg_1));
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

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            if (_arg_1.index == 0)
            {
                _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(dg.selectedItem.leaderName);
            }
            else
            {
                if (_arg_1.index == 1)
                {
                    ChatPanelUtil.createChatPanel(dg.selectedItem.cid);
                }
                else
                {
                    if (_arg_1.index == 2)
                    {
                        _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(dg.selectedItem.cid);
                    };
                };
            };
        }

        private function _GroupRecruitPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = GroupRecruitPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function searchGroup():void
        {
            var _local_3:*;
            var _local_4:Object;
            if (ns_maxLevel.value < ns_minLevel.value)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[6]);
                return;
            };
            var _local_1:Object = new Object();
            _local_1.minLevel = ns_minLevel.value;
            _local_1.maxLevel = ns_maxLevel.value;
            if (rbtn.selected)
            {
                _local_1.allWill = true;
            }
            else
            {
                _local_1.allWill = false;
                ((cb_fb.selectedItem) && (_local_1.type = cb_fb.selectedItem.data));
                ((list.selectedItem) && (_local_1.fid = list.selectedItem.id));
            };
            var _local_2:Date = new Date();
            _local_2.setHours(ns_hour.value, ns_minute.value);
            _local_1.time = (_local_2.getTime() + (60 * 1000));
            if (_local_1.time < new Date().getTime())
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[28]);
                return;
            };
            searchResult.removeAll();
            for (_local_3 in roomList)
            {
                _local_4 = roomList[_local_3];
                if (!((_local_1.minLevel > _local_4.maxLevel) || (_local_1.maxLevel < _local_4.minLevel)))
                {
                    if (_local_4.time <= _local_1.time)
                    {
                        if (_local_1.allWill)
                        {
                            searchResult.addItem(_local_4);
                        }
                        else
                        {
                            if (_local_1.fid)
                            {
                                if (_local_4.fid == _local_1.fid)
                                {
                                    searchResult.addItem(_local_4);
                                };
                            }
                            else
                            {
                                if (_local_4.type == _local_1.type)
                                {
                                    searchResult.addItem(_local_4);
                                };
                            };
                        };
                    };
                };
            };
            initPageSelector2();
        }

        public function setCreatedFlag(_arg_1:Boolean):void
        {
            _createdFlag = _arg_1;
        }

        public function setMyGroupData(_arg_1:Object):void
        {
            myGroupData = _arg_1;
        }

        private function _GroupRecruitPanel_Glow1_i():Glow
        {
            var _local_1:Glow = new Glow();
            glowEffect = _local_1;
            _local_1.repeatCount = 10000;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 1;
            _local_1.blurXFrom = 0;
            _local_1.blurXTo = 10;
            _local_1.blurYFrom = 0;
            _local_1.blurYTo = 10;
            _local_1.color = 16135947;
            return (_local_1);
        }

        private function initPageSelector():void
        {
            var _local_1:int;
            if (roomList.length >= PAGE_MAX_ROOM_NUM)
            {
                _local_1 = PAGE_MAX_ROOM_NUM;
            }
            else
            {
                _local_1 = roomList.length;
            };
            var _local_2:int;
            while (_local_2 < _local_1)
            {
                pageRoomList.addItem(roomList.getItemAt(_local_2));
                _local_2++;
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(roomList.length, PAGE_MAX_ROOM_NUM);
        }

        [Bindable(event="propertyChange")]
        public function get ns_maxLevel():NumericStepper
        {
            return (this._739732038ns_maxLevel);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                pageRoomList.addItem(roomList.getItemAt(_local_3));
                _local_4++;
            };
        }

        [Bindable(event="propertyChange")]
        private function get pageRoomList():ArrayCollection
        {
            return (this._1972467768pageRoomList);
        }

        private function set searchResult(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._77872101searchResult;
            if (_local_2 !== _arg_1)
            {
                this._77872101searchResult = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchResult", _local_2, _arg_1));
            };
        }

        public function playGlowEffect():void
        {
            if (!glowEffect.isPlaying)
            {
                glowEffect.play([btn_myGroup]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get ns_minute():NumericStepper
        {
            return (this._1057325618ns_minute);
        }

        private function set pageRoomList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1972467768pageRoomList;
            if (_local_2 !== _arg_1)
            {
                this._1972467768pageRoomList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageRoomList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rbtn():CheckBox
        {
            return (this._3494058rbtn);
        }

        private function _GroupRecruitPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupRecruitPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "fb";
            _local_1.width = 85;
            BindingManager.executeBindings(this, "_GroupRecruitPanel_DataGridColumn3", _GroupRecruitPanel_DataGridColumn3);
            return (_local_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:Date;
            super.visible = _arg_1;
            if (_arg_1)
            {
                _local_2 = new Date();
                _local_2.setTime((_local_2.getTime() + MAX_BOOK_INTERVAL));
                ns_hour.value = _local_2.getHours();
                ns_minute.value = _local_2.getMinutes();
            };
        }

        [Bindable(event="propertyChange")]
        private function get searchResult():ArrayCollection
        {
            return (this._77872101searchResult);
        }

        public function checkInterval():Boolean
        {
            var _local_1:Date;
            var _local_2:Number;
            if (!_firstFlag)
            {
                _local_1 = new Date();
                _local_2 = (_local_1.getTime() - timeFlag);
                if (_local_2 > MIN_INTERVAL_TO_SERVER)
                {
                    trace("间隔大于60秒,向服务端请求数据");
                    timeFlag = _local_1.getTime();
                    _firstFlag = true;
                };
            };
            return (_firstFlag);
        }

        private function dgItemClick(_arg_1:ListEvent):void
        {
            menuPop([{"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}]);
        }

        public function changeWillType(_arg_1:Event):void
        {
            var _local_4:*;
            var _local_2:int = _arg_1.target.selectedItem.data;
            var _local_3:Array = [];
            for (_local_4 in willList)
            {
                if (willList[_local_4].type == _local_2)
                {
                    _local_3.push(willList[_local_4]);
                };
            };
            list.dataProvider = _local_3;
        }

        public function getMyGroup():void
        {
            var _local_1:Object;
            if (checkInterval())
            {
                _core.remote.getMyRoom();
                _firstFlag = false;
            }
            else
            {
                if (!_createdFlag)
                {
                    _core.view.changeVisible(ViewManager.PANEL_GROUP_RECRUIT_NEW);
                    _local_1 = _core.view.getUI(ViewManager.PANEL_GROUP_RECRUIT_NEW);
                    _local_1.setDataProvider(willTypeList, willList);
                }
                else
                {
                    _local_1 = _core.view.getUI(ViewManager.PANEL_GROUP_RECRUIT_DETAIL);
                    _local_1.show();
                    _local_1.initMyRoom(myGroupData, willTypeList, willList);
                    if (glowEffect.isPlaying)
                    {
                        _local_1.showChatLog();
                    };
                };
                if (glowEffect.isPlaying)
                {
                    glowEffect.end();
                    btn_myGroup.filters = [];
                };
            };
        }

        public function ___GroupRecruitPanel_DelayButton1_click(_arg_1:MouseEvent):void
        {
            refreshGroupList();
        }


    }
}//package com.qeedoo.ui.view.compDragable

