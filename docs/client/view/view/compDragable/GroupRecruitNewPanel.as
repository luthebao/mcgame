// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GroupRecruitNewPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.NumericStepper;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.ComboBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import mx.events.ListEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.utils.TimeUtil;
    import mx.core.ClassFactory;
    import mx.controls.Alert;
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

    public class GroupRecruitNewPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const MIN_CREATE_ROOM_INTERVAL:Number = 300000;
        private const MIN_BOOK_INTERVAL:Number = 300000;
        private const MAX_BOOK_INTERVAL:Number = 0x6DDD00;
        public var _GroupRecruitNewPanel_BasicGlowButton1:BasicGlowButton;
        private var _2070514658ns_hour:NumericStepper;
        private var _3322014list:List;
        private var willList:Array;
        public var _GroupRecruitNewPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _GroupRecruitNewPanel_RoundedLabel1:RoundedLabel;
        public var _GroupRecruitNewPanel_RoundedLabel2:RoundedLabel;
        public var _GroupRecruitNewPanel_RoundedLabel3:RoundedLabel;
        public var _GroupRecruitNewPanel_RoundedLabel4:RoundedLabel;
        public var _GroupRecruitNewPanel_RoundedLabel5:RoundedLabel;
        public var _GroupRecruitNewPanel_RoundedLabel6:RoundedLabel;
        public var _GroupRecruitNewPanel_RoundedLabel7:RoundedLabel;
        private var timeFlag:Number;
        private var _3167cb:ComboBox;
        private var _1779038604ns_minLevel:NumericStepper;
        private var _1057325618ns_minute:NumericStepper;
        private var _739732038ns_maxLevel:NumericStepper;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":330,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GroupRecruitNewPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_GroupRecruitNewPanel_RoundedLabel1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.left = "10";
                            this.top = "184";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":65});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_GroupRecruitNewPanel_RoundedLabel2",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.top = "184";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":173.5,
                                "width":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"ns_minLevel",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":101.5,
                                "y":182,
                                "maximum":150,
                                "stepSize":1,
                                "width":60,
                                "value":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"ns_maxLevel",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":201.5,
                                "y":182,
                                "maximum":150,
                                "stepSize":1,
                                "width":60,
                                "value":140
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_GroupRecruitNewPanel_RoundedLabel3",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.left = "10";
                            this.top = "231";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":65});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_GroupRecruitNewPanel_RoundedLabel4",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.top = "266";
                            this.horizontalCenter = "0";
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"ns_hour",
                        "stylesFactory":function ():void
                        {
                            this.left = "101.5";
                            this.top = "221";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "minimum":0,
                                "maximum":23,
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"ns_minute",
                        "stylesFactory":function ():void
                        {
                            this.left = "201.5";
                            this.top = "221";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "minimum":0,
                                "maximum":59,
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_GroupRecruitNewPanel_RoundedLabel5",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.left = "159.5";
                            this.top = "221";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":20});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_GroupRecruitNewPanel_RoundedLabel6",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.left = "260.5";
                            this.top = "221";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":20});
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GroupRecruitNewPanel_BasicGlowButton1",
                        "events":{"click":"___GroupRecruitNewPanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                            this.horizontalCenter = "0";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "width":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_GroupRecruitNewPanel_RoundedLabel7",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.left = "10";
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":65});
                        }
                    }), new UIComponentDescriptor({
                        "type":ComboBox,
                        "id":"cb",
                        "events":{"change":"__cb_change"},
                        "stylesFactory":function ():void
                        {
                            this.top = "39";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selectedIndex":0,
                                "x":90,
                                "width":171.5,
                                "labelField":"name"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":List,
                        "id":"list",
                        "events":{
                            "mouseDown":"__list_mouseDown",
                            "change":"__list_change"
                        },
                        "stylesFactory":function ():void
                        {
                            this.backgroundAlpha = 0;
                            this.top = "67";
                            this.bottom = "138";
                            this.left = "92";
                            this.right = "38.5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "horizontalScrollPolicy":"off",
                                "itemRenderer":_GroupRecruitNewPanel_ClassFactory1_c()
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

        public function GroupRecruitNewPanel()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 330;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___GroupRecruitNewPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GroupRecruitNewPanel._watcherSetupUtil = _arg_1;
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

        public function ___GroupRecruitNewPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get ns_minLevel():NumericStepper
        {
            return (this._1779038604ns_minLevel);
        }

        private function init():void
        {
        }

        public function __list_change(_arg_1:ListEvent):void
        {
            changeListItem(_arg_1);
        }

        private function _GroupRecruitNewPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[8];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[2];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[14];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[4];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[34];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[16];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[17];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[13];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[3];
        }

        override public function initialize():void
        {
            var target:GroupRecruitNewPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GroupRecruitNewPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GroupRecruitNewPanelWatcherSetupUtil");
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

        private function changeListItem(_arg_1:Event):void
        {
            ns_minLevel.value = list.selectedItem.level;
        }

        [Bindable(event="propertyChange")]
        public function get list():List
        {
            return (this._3322014list);
        }

        public function ___GroupRecruitNewPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            createRoom();
        }

        public function __cb_change(_arg_1:ListEvent):void
        {
            changeWillType(_arg_1);
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
        public function get ns_hour():NumericStepper
        {
            return (this._2070514658ns_hour);
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

        public function setDataProvider(_arg_1:Array, _arg_2:Array):void
        {
            cb.dataProvider = _arg_1;
            willList = _arg_2;
            setDefultData();
        }

        public function set cb(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._3167cb;
            if (_local_2 !== _arg_1)
            {
                this._3167cb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb", _local_2, _arg_1));
            };
        }

        private function _GroupRecruitNewPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitNewPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GroupRecruitNewPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitNewPanel_RoundedLabel1.text = _arg_1;
            }, "_GroupRecruitNewPanel_RoundedLabel1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitNewPanel_RoundedLabel2.text = _arg_1;
            }, "_GroupRecruitNewPanel_RoundedLabel2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitNewPanel_RoundedLabel3.text = _arg_1;
            }, "_GroupRecruitNewPanel_RoundedLabel3.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitNewPanel_RoundedLabel4.text = _arg_1;
            }, "_GroupRecruitNewPanel_RoundedLabel4.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitNewPanel_RoundedLabel5.text = _arg_1;
            }, "_GroupRecruitNewPanel_RoundedLabel5.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitNewPanel_RoundedLabel6.text = _arg_1;
            }, "_GroupRecruitNewPanel_RoundedLabel6.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitNewPanel_BasicGlowButton1.label = _arg_1;
            }, "_GroupRecruitNewPanel_BasicGlowButton1.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitNewPanel_RoundedLabel7.text = _arg_1;
            }, "_GroupRecruitNewPanel_RoundedLabel7.text");
            result[8] = binding;
            return (result);
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

        public function set ns_minLevel(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1779038604ns_minLevel;
            if (_local_2 !== _arg_1)
            {
                this._1779038604ns_minLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns_minLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ns_maxLevel():NumericStepper
        {
            return (this._739732038ns_maxLevel);
        }

        [Bindable(event="propertyChange")]
        public function get cb():ComboBox
        {
            return (this._3167cb);
        }

        private function setDefultData():void
        {
            var _local_3:*;
            var _local_4:Date;
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
            _local_4 = new Date();
            _local_4.setTime(((((_local_4.getTime() + MAX_BOOK_INTERVAL) + _core.timeLag) + TimeUtil.timeOSOffSet) - (60 * 1000)));
            ns_hour.value = _local_4.getHours();
            ns_minute.value = _local_4.getMinutes();
        }

        private function _GroupRecruitNewPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = GroupRecruitNewPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function __list_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get ns_minute():NumericStepper
        {
            return (this._1057325618ns_minute);
        }

        private function createRoom():void
        {
            var _local_6:String;
            var _local_9:Date;
            if (!list.selectedItem)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[3]);
                return;
            };
            if (!cb.selectedItem)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[4]);
                return;
            };
            if (ns_minLevel.value < list.selectedItem.level)
            {
                _local_6 = Language.GROUP_RECRUIT_PANEL_S[5].toString().replace("{num}", list.selectedItem.level);
                Alert.show(_local_6);
                return;
            };
            if (ns_maxLevel.value < ns_minLevel.value)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[6]);
                return;
            };
            var _local_1:Object = new Object();
            _local_1.minLevel = ns_minLevel.value;
            _local_1.maxLevel = ns_maxLevel.value;
            _local_1.fid = list.selectedItem.id;
            _local_1.type = list.selectedItem.type;
            _local_1.hour = ns_hour.value;
            _local_1.minute = ns_minute.value;
            var _local_2:Date = new Date();
            var _local_3:Number = ((_local_2.getTime() + _core.timeLag) + TimeUtil.timeOSOffSet);
            _local_2.setHours(ns_hour.value, ns_minute.value, 0);
            var _local_4:Number = _local_2.getTime();
            var _local_5:Number = (_local_4 - _local_3);
            if (_local_5 < 0)
            {
                _local_4 = (_local_4 + (((24 * 60) * 60) * 1000));
                _local_5 = (_local_4 - _local_3);
            };
            _local_6 = Language.GROUP_RECRUIT_PANEL_S[7];
            var _local_7:Date = new Date();
            _local_7.setTime(((_local_7.getTime() + _core.timeLag) + TimeUtil.timeOSOffSet));
            _local_6 = _local_6.replace("{h}", _local_7.getHours()).replace("{m}", _local_7.getMinutes());
            var _local_8:Date = new Date();
            _local_8.setTime((((((_local_8.getTime() + MIN_BOOK_INTERVAL) + _core.timeLag) + TimeUtil.timeOSOffSet) + (60 * 1000)) - 1));
            _local_6 = _local_6.replace("{h1}", _local_8.getHours()).replace("{m1}", _local_8.getMinutes());
            _local_9 = new Date();
            _local_9.setTime((((_local_9.getTime() + MAX_BOOK_INTERVAL) + TimeUtil.timeOSOffSet) + _core.timeLag));
            _local_6 = _local_6.replace("{h2}", _local_9.getHours()).replace("{m2}", _local_9.getMinutes());
            if (_local_5 > MAX_BOOK_INTERVAL)
            {
                Alert.show(_local_6);
                return;
            };
            if (_local_5 < MIN_BOOK_INTERVAL)
            {
                Alert.show(_local_6);
                return;
            };
            if (_core.player.level < ns_minLevel.value)
            {
                _local_6 = Language.GROUP_RECRUIT_PANEL_S[36].toString().replace("{num}", ns_minLevel.value);
                Alert.show(_local_6);
                return;
            };
            _local_9 = new Date();
            var _local_10:Number = (_local_9.getTime() - timeFlag);
            if (_local_10 < MIN_CREATE_ROOM_INTERVAL)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[37]);
                return;
            };
            _core.remote.createRoom(_local_1);
            timeFlag = _local_9.getTime();
            hide();
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


    }
}//package com.qeedoo.ui.view.compDragable

