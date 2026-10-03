// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GroupRecruitUpdatePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.NumericStepper;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.states.SetProperty;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.ComboBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import mx.events.PropertyChangeEvent;
    import mx.states.State;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ListEvent;
    import mx.events.FlexEvent;
    import mx.core.ClassFactory;
    import flash.events.Event;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
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

    public class GroupRecruitUpdatePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const MIN_BOOK_INTERVAL:Number = 300000;
        private const MAX_BOOK_INTERVAL:Number = 0x6DDD00;
        public var _GroupRecruitUpdatePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2070514658ns_hour:NumericStepper;
        private var _3322014list:List;
        private var _3503016rl_m:RoundedLabel;
        private var minLevel:int;
        private var _1057325618ns_minute:NumericStepper;
        private var maxLevel:int;
        private var willList:Array;
        private var _3503011rl_h:RoundedLabel;
        public var _GroupRecruitUpdatePanel_SetProperty1:SetProperty;
        public var _GroupRecruitUpdatePanel_SetProperty2:SetProperty;
        public var _GroupRecruitUpdatePanel_SetProperty3:SetProperty;
        public var _GroupRecruitUpdatePanel_SetProperty4:SetProperty;
        public var _GroupRecruitUpdatePanel_SetProperty5:SetProperty;
        public var _GroupRecruitUpdatePanel_SetProperty6:SetProperty;
        public var _GroupRecruitUpdatePanel_SetProperty7:SetProperty;
        public var _GroupRecruitUpdatePanel_SetProperty8:SetProperty;
        public var _GroupRecruitUpdatePanel_BasicGlowButton1:BasicGlowButton;
        public var _GroupRecruitUpdatePanel_BasicGlowButton2:BasicGlowButton;
        private var _94442652cb_fb:ComboBox;
        private var willTypeList:Array;
        private var _110371416title:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "height":250,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GroupRecruitUpdatePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"title",
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.horizontalCenter = "0";
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GroupRecruitUpdatePanel_BasicGlowButton1",
                        "events":{"click":"___GroupRecruitUpdatePanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                            this.horizontalCenter = "-40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed2",
                                "width":65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GroupRecruitUpdatePanel_BasicGlowButton2",
                        "events":{"click":"___GroupRecruitUpdatePanel_BasicGlowButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                            this.horizontalCenter = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed2",
                                "width":65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ComboBox,
                        "id":"cb_fb",
                        "events":{"change":"__cb_fb_change"},
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selectedIndex":1,
                                "y":71,
                                "labelField":"name"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":List,
                        "id":"list",
                        "stylesFactory":function ():void
                        {
                            this.backgroundAlpha = 0;
                            this.top = "101";
                            this.bottom = "47";
                            this.left = "10";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "horizontalScrollPolicy":"off",
                                "itemRenderer":_GroupRecruitUpdatePanel_ClassFactory1_c()
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"ns_hour",
                        "stylesFactory":function ():void
                        {
                            this.top = "118";
                            this.horizontalCenter = "-60";
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
                            this.top = "118";
                            this.horizontalCenter = "40";
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
                        "id":"rl_h",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.top = "118";
                            this.horizontalCenter = "-22";
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
                        "id":"rl_m",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.top = "118";
                            this.horizontalCenter = "79";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":20,
                                "height":20
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

        public function GroupRecruitUpdatePanel()
        {
            mx_internal::_document = this;
            this.width = 200;
            this.height = 250;
            this.styleName = "StandardContent";
            this.states = [_GroupRecruitUpdatePanel_State1_c(), _GroupRecruitUpdatePanel_State2_c()];
            this.addEventListener("creationComplete", ___GroupRecruitUpdatePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GroupRecruitUpdatePanel._watcherSetupUtil = _arg_1;
        }


        public function ___GroupRecruitUpdatePanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            setRoomConfig();
        }

        public function init():void
        {
        }

        private function _GroupRecruitUpdatePanel_SetProperty8_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _GroupRecruitUpdatePanel_SetProperty8 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_GroupRecruitUpdatePanel_SetProperty8", _GroupRecruitUpdatePanel_SetProperty8);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get ns_hour():NumericStepper
        {
            return (this._2070514658ns_hour);
        }

        private function _GroupRecruitUpdatePanel_SetProperty3_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _GroupRecruitUpdatePanel_SetProperty3 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_GroupRecruitUpdatePanel_SetProperty3", _GroupRecruitUpdatePanel_SetProperty3);
            return (_local_1);
        }

        private function _GroupRecruitUpdatePanel_SetProperty7_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _GroupRecruitUpdatePanel_SetProperty7 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_GroupRecruitUpdatePanel_SetProperty7", _GroupRecruitUpdatePanel_SetProperty7);
            return (_local_1);
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

        public function set list(_arg_1:List):void
        {
            var _local_2:Object = this._3322014list;
            if (_local_2 !== _arg_1)
            {
                this._3322014list = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "list", _local_2, _arg_1));
            };
        }

        public function setLevel(_arg_1:int, _arg_2:int):void
        {
            minLevel = _arg_1;
            maxLevel = _arg_2;
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

        public function set rl_h(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3503011rl_h;
            if (_local_2 !== _arg_1)
            {
                this._3503011rl_h = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_h", _local_2, _arg_1));
            };
        }

        public function setState(_arg_1:String):void
        {
            currentState = _arg_1;
        }

        public function ___GroupRecruitUpdatePanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            cancel();
        }

        public function setWill(_arg_1:*, _arg_2:*):void
        {
            if (!cb_fb)
            {
                callLater(setWill, [_arg_1, _arg_2]);
            }
            else
            {
                willTypeList = _arg_1;
                willList = _arg_2;
                cb_fb.dataProvider = willTypeList;
            };
        }

        public function set rl_m(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3503016rl_m;
            if (_local_2 !== _arg_1)
            {
                this._3503016rl_m = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_m", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get title():RoundedLabel
        {
            return (this._110371416title);
        }

        private function setDefultData():void
        {
            var _local_3:*;
            var _local_4:Date;
            if ((((((!(list)) || (!(ns_hour))) || (!(ns_minute))) || (!(cb_fb))) || (!(willList))))
            {
                callLater(setDefultData);
                return;
            };
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
            _local_4.setTime((((_local_4.getTime() + MAX_BOOK_INTERVAL) + _core.timeLag) - (60 * 1000)));
            ns_hour.value = _local_4.getHours();
            ns_minute.value = _local_4.getMinutes();
            cb_fb.selectedIndex = 0;
        }

        private function _GroupRecruitUpdatePanel_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _GroupRecruitUpdatePanel_SetProperty2 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_GroupRecruitUpdatePanel_SetProperty2", _GroupRecruitUpdatePanel_SetProperty2);
            return (_local_1);
        }

        private function _GroupRecruitUpdatePanel_SetProperty6_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _GroupRecruitUpdatePanel_SetProperty6 = _local_1;
            _local_1.name = "text";
            BindingManager.executeBindings(this, "_GroupRecruitUpdatePanel_SetProperty6", _GroupRecruitUpdatePanel_SetProperty6);
            return (_local_1);
        }

        private function _GroupRecruitUpdatePanel_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "time";
            _local_1.overrides = [_GroupRecruitUpdatePanel_SetProperty6_i(), _GroupRecruitUpdatePanel_SetProperty7_i(), _GroupRecruitUpdatePanel_SetProperty8_i()];
            return (_local_1);
        }

        private function cancel():void
        {
            hide();
        }

        private function _GroupRecruitUpdatePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[29];
            _local_1 = Language.INPUTPANEL_U[0];
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[32];
            _local_1 = title;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[30];
            _local_1 = ns_hour;
            _local_1 = ns_minute;
            _local_1 = rl_h;
            _local_1 = rl_m;
            _local_1 = title;
            _local_1 = Language.GROUP_RECRUIT_PANEL_U[31];
            _local_1 = cb_fb;
            _local_1 = list;
            _local_1 = Language.WEDDING_BOOK_PANEL_U[16];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[17];
        }

        override public function initialize():void
        {
            var target:GroupRecruitUpdatePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GroupRecruitUpdatePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GroupRecruitUpdatePanelWatcherSetupUtil");
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

        public function __cb_fb_change(_arg_1:ListEvent):void
        {
            changeWillType(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get cb_fb():ComboBox
        {
            return (this._94442652cb_fb);
        }

        [Bindable(event="propertyChange")]
        public function get list():List
        {
            return (this._3322014list);
        }

        [Bindable(event="propertyChange")]
        public function get rl_h():RoundedLabel
        {
            return (this._3503011rl_h);
        }

        private function _GroupRecruitUpdatePanel_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "will";
            _local_1.overrides = [_GroupRecruitUpdatePanel_SetProperty1_i(), _GroupRecruitUpdatePanel_SetProperty2_i(), _GroupRecruitUpdatePanel_SetProperty3_i(), _GroupRecruitUpdatePanel_SetProperty4_i(), _GroupRecruitUpdatePanel_SetProperty5_i()];
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get rl_m():RoundedLabel
        {
            return (this._3503016rl_m);
        }

        private function _GroupRecruitUpdatePanel_SetProperty5_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _GroupRecruitUpdatePanel_SetProperty5 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_GroupRecruitUpdatePanel_SetProperty5", _GroupRecruitUpdatePanel_SetProperty5);
            return (_local_1);
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

        private function _GroupRecruitUpdatePanel_SetProperty1_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _GroupRecruitUpdatePanel_SetProperty1 = _local_1;
            _local_1.name = "text";
            BindingManager.executeBindings(this, "_GroupRecruitUpdatePanel_SetProperty1", _GroupRecruitUpdatePanel_SetProperty1);
            return (_local_1);
        }

        public function ___GroupRecruitUpdatePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set title(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ns_minute():NumericStepper
        {
            return (this._1057325618ns_minute);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                setDefultData();
            };
        }

        private function _GroupRecruitUpdatePanel_SetProperty4_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _GroupRecruitUpdatePanel_SetProperty4 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_GroupRecruitUpdatePanel_SetProperty4", _GroupRecruitUpdatePanel_SetProperty4);
            return (_local_1);
        }

        private function _GroupRecruitUpdatePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitUpdatePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GroupRecruitUpdatePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitUpdatePanel_BasicGlowButton1.label = _arg_1;
            }, "_GroupRecruitUpdatePanel_BasicGlowButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUP_RECRUIT_PANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupRecruitUpdatePanel_BasicGlowButton2.label = _arg_1;
            }, "_GroupRecruitUpdatePanel_BasicGlowButton2.label");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (title);
            }, function (_arg_1:Object):void
            {
                _GroupRecruitUpdatePanel_SetProperty1.target = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty1.target");
            result[3] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.GROUP_RECRUIT_PANEL_U[30]);
            }, function (_arg_1:*):void
            {
                _GroupRecruitUpdatePanel_SetProperty1.value = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty1.value");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ns_hour);
            }, function (_arg_1:Object):void
            {
                _GroupRecruitUpdatePanel_SetProperty2.target = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty2.target");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ns_minute);
            }, function (_arg_1:Object):void
            {
                _GroupRecruitUpdatePanel_SetProperty3.target = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty3.target");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (rl_h);
            }, function (_arg_1:Object):void
            {
                _GroupRecruitUpdatePanel_SetProperty4.target = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty4.target");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (rl_m);
            }, function (_arg_1:Object):void
            {
                _GroupRecruitUpdatePanel_SetProperty5.target = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty5.target");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (title);
            }, function (_arg_1:Object):void
            {
                _GroupRecruitUpdatePanel_SetProperty6.target = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty6.target");
            result[9] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.GROUP_RECRUIT_PANEL_U[31]);
            }, function (_arg_1:*):void
            {
                _GroupRecruitUpdatePanel_SetProperty6.value = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty6.value");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (cb_fb);
            }, function (_arg_1:Object):void
            {
                _GroupRecruitUpdatePanel_SetProperty7.target = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty7.target");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (list);
            }, function (_arg_1:Object):void
            {
                _GroupRecruitUpdatePanel_SetProperty8.target = _arg_1;
            }, "_GroupRecruitUpdatePanel_SetProperty8.target");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rl_h.text = _arg_1;
            }, "rl_h.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rl_m.text = _arg_1;
            }, "rl_m.text");
            result[14] = binding;
            return (result);
        }

        private function _GroupRecruitUpdatePanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = GroupRecruitUpdatePanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
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

        private function setRoomConfig():void
        {
            var msg:String;
            var obj:Object;
            var time:Object;
            var fid:int;
            var warnMsg:String;
            var date:Date;
            var timeNow:Number;
            var timeTarget:Number;
            var interval:Number;
            var tempDate1:Date;
            var tempDate2:Date;
            obj = new Object();
            if (currentState == "will")
            {
                if (!list.selectedItem)
                {
                    Alert.show(Language.GROUP_RECRUIT_PANEL_S[3]);
                    return;
                };
                msg = Language.GROUP_RECRUIT_PANEL_S[13].toString().replace("{name}", list.selectedItem.name);
                fid = list.selectedItem.id;
                if (list.selectedItem.level > minLevel)
                {
                    minLevel = list.selectedItem.level;
                };
                if (maxLevel < minLevel)
                {
                    maxLevel = minLevel;
                };
                obj.fid = fid;
                obj.type = list.selectedItem.type;
            }
            else
            {
                if (currentState == "time")
                {
                    msg = Language.GROUP_RECRUIT_PANEL_S[14].toString().replace("{h}", ns_hour.value).replace("{m}", ns_minute.value);
                    time = new Object();
                    time.hour = ns_hour.value;
                    time.minute = ns_minute.value;
                    warnMsg = Language.GROUP_RECRUIT_PANEL_S[7];
                    date = new Date();
                    timeNow = (date.getTime() + _core.timeLag);
                    date.setTime(timeNow);
                    warnMsg = warnMsg.replace("{h}", date.getHours()).replace("{m}", date.getMinutes());
                    date.setHours(ns_hour.value, ns_minute.value, 0);
                    timeTarget = date.getTime();
                    interval = (timeTarget - timeNow);
                    if (interval < 0)
                    {
                        interval = (interval + (((24 * 60) * 60) * 1000));
                    };
                    tempDate1 = new Date();
                    tempDate1.setTime(((((tempDate1.getTime() + MIN_BOOK_INTERVAL) + _core.timeLag) + (60 * 1000)) - 1));
                    warnMsg = warnMsg.replace("{h1}", tempDate1.getHours()).replace("{m1}", tempDate1.getMinutes());
                    tempDate2 = new Date();
                    tempDate2.setTime(((tempDate2.getTime() + MAX_BOOK_INTERVAL) + _core.timeLag));
                    warnMsg = warnMsg.replace("{h2}", tempDate2.getHours()).replace("{m2}", tempDate2.getMinutes());
                    if (interval > MAX_BOOK_INTERVAL)
                    {
                        Alert.show(warnMsg);
                        return;
                    };
                    if (interval < MIN_BOOK_INTERVAL)
                    {
                        Alert.show(warnMsg);
                        return;
                    };
                    obj.time = time;
                };
            };
            obj.minLevel = minLevel;
            obj.maxLevel = maxLevel;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.setRoomConfig(obj);
                    hide();
                };
            };
            Alert.show(msg, null, (Alert.YES | Alert.NO), null, func);
        }


    }
}//package com.qeedoo.ui.view.compDragable

