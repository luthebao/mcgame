// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.QuestCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.CheckBox;
    import flash.utils.Timer;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.Binding;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.utils.TextUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.resource.ResManager;
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

    public class QuestCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var qd:Object;
        public var _QuestCanvas_BasicTxtButton1:BasicTxtButton;
        public var _QuestCanvas_BasicTxtButton2:BasicTxtButton;
        public var _QuestCanvas_BasicTxtButton3:BasicTxtButton;
        public var _QuestCanvas_BasicTxtButton4:BasicTxtButton;
        public var selectId:Number = -1;
        private var _358313763awardItem3:ItemSlot;
        private var _1783052659questName:LinkTextArea;
        private var _358313762awardItem2:ItemSlot;
        private var _358313766awardItem6:ItemSlot;
        private var _1621975424awardExp:Currency;
        private var lastTime:Number;
        private var _339060508cb_guide:CheckBox;
        private var questTimer:Timer;
        private var _3237038info:LinkTextArea;
        private var _361867363awardMoney:Currency;
        private var _358313761awardItem1:ItemSlot;
        private var _1775826383lastTimeLabel:Label;
        private var _358313765awardItem5:ItemSlot;
        public var quest:Object;
        private var _embeded:Boolean = false;
        private var _358313764awardItem4:ItemSlot;
        private var _1062904757_guideVisible:Boolean;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":303,
                    "height":305,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "70";
                            this.right = "0";
                            this.top = "0";
                            this.bottom = "90";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "styleName":"CSSBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":VBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.right = "8";
                                        this.top = "8";
                                        this.bottom = "8";
                                        this.verticalGap = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":LinkTextArea,
                                                "id":"questName",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "bold";
                                                    this.backgroundAlpha = 0;
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":3,
                                                        "percentWidth":100,
                                                        "height":25,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "editable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lastTimeLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFF0000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"percentWidth":100});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkTextArea,
                                                "id":"info",
                                                "events":{"mouseMove":"__info_mouseMove"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.color = 0xFFFFFF;
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "horizontalScrollPolicy":"off",
                                                        "editable":false,
                                                        "height":175,
                                                        "percentWidth":100
                                                    });
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"cb_guide",
                                    "events":{"change":"__cb_guide_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "3";
                                        this.top = "7";
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"awardExp",
                        "stylesFactory":function ():void
                        {
                            this.left = "75";
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":248,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"awardMoney",
                        "stylesFactory":function ():void
                        {
                            this.left = "75";
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":226,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"awardItem1",
                        "events":{"click":"__awardItem1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "x":71,
                                "y":270
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"awardItem2",
                        "events":{"click":"__awardItem2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "x":111,
                                "y":270
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"awardItem3",
                        "events":{"click":"__awardItem3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "x":150,
                                "y":270
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"awardItem4",
                        "events":{"click":"__awardItem4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "x":190,
                                "y":270
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"awardItem5",
                        "events":{"click":"__awardItem5_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "x":229,
                                "y":270
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"awardItem6",
                        "events":{"click":"__awardItem6_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "x":269,
                                "y":270
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_QuestCanvas_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":2,
                                "width":65,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_QuestCanvas_BasicTxtButton2",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":223,
                                "width":65,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_QuestCanvas_BasicTxtButton3",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":246,
                                "width":65,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_QuestCanvas_BasicTxtButton4",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":277,
                                "width":65,
                                "height":18
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

        public function QuestCanvas()
        {
            mx_internal::_document = this;
            this.width = 303;
            this.height = 305;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            QuestCanvas._watcherSetupUtil = _arg_1;
        }


        public function set awardExp(_arg_1:Currency):void
        {
            var _local_2:Object = this._1621975424awardExp;
            if (_local_2 !== _arg_1)
            {
                this._1621975424awardExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardExp", _local_2, _arg_1));
            };
        }

        public function __awardItem2_click(_arg_1:MouseEvent):void
        {
            awardItemClick(_arg_1);
        }

        public function __awardItem6_click(_arg_1:MouseEvent):void
        {
            awardItemClick(_arg_1);
        }

        private function removeTimer():void
        {
            if (questTimer)
            {
                questTimer.removeEventListener(TimerEvent.TIMER, timerRepeat);
                questTimer.stop();
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardItem2():ItemSlot
        {
            return (this._358313762awardItem2);
        }

        [Bindable(event="propertyChange")]
        public function get cb_guide():CheckBox
        {
            return (this._339060508cb_guide);
        }

        [Bindable(event="propertyChange")]
        public function get awardItem4():ItemSlot
        {
            return (this._358313764awardItem4);
        }

        [Bindable(event="propertyChange")]
        public function get awardItem5():ItemSlot
        {
            return (this._358313765awardItem5);
        }

        [Bindable(event="propertyChange")]
        public function get awardItem1():ItemSlot
        {
            return (this._358313761awardItem1);
        }

        public function set questName(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1783052659questName;
            if (_local_2 !== _arg_1)
            {
                this._1783052659questName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardItem3():ItemSlot
        {
            return (this._358313763awardItem3);
        }

        [Bindable(event="propertyChange")]
        public function get awardItem6():ItemSlot
        {
            return (this._358313766awardItem6);
        }

        [Bindable(event="propertyChange")]
        public function get lastTimeLabel():Label
        {
            return (this._1775826383lastTimeLabel);
        }

        public function set cb_guide(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._339060508cb_guide;
            if (_local_2 !== _arg_1)
            {
                this._339060508cb_guide = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb_guide", _local_2, _arg_1));
            };
        }

        public function set awardItem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._358313762awardItem2;
            if (_local_2 !== _arg_1)
            {
                this._358313762awardItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardItem2", _local_2, _arg_1));
            };
        }

        public function set awardItem3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._358313763awardItem3;
            if (_local_2 !== _arg_1)
            {
                this._358313763awardItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardItem3", _local_2, _arg_1));
            };
        }

        private function timerRepeat(_arg_1:TimerEvent):void
        {
            var _local_3:Date;
            var _local_2:* = "";
            if (ToolKit.isBigThan(lastTime, 0))
            {
                lastTime = int(lastTime);
                lastTime--;
                if (lastTime >= 86400)
                {
                    _local_2 = Language.QUESTCANVAS_S[9].toString();
                    lastTimeLabel.text = _local_2.replace("{day}", int((lastTime / 86400)));
                }
                else
                {
                    _local_3 = new Date(2000, 1, 1, 0, 0, 0, 0);
                    _local_3.setTime((_local_3.getTime() + Number((lastTime * 1000))));
                    _local_2 = Language.QUESTCANVAS_S[11].toString();
                    _local_2 = _local_2.replace("{hour}", _local_3.getHours());
                    _local_2 = _local_2.replace("{minute}", _local_3.getMinutes());
                    lastTimeLabel.text = _local_2.replace("{second}", _local_3.getSeconds());
                };
            };
        }

        public function set awardItem4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._358313764awardItem4;
            if (_local_2 !== _arg_1)
            {
                this._358313764awardItem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardItem4", _local_2, _arg_1));
            };
        }

        private function getQuestNamePrefix(_arg_1:Object):String
        {
            var _local_5:uint;
            var _local_6:Array;
            var _local_7:uint;
            var _local_2:String = ((GamePredef.QUEST_TYPE_APPR[_arg_1.type]) || (""));
            if (ToolKit.isEqual(_arg_1.type, GamePredef.QUEST_TYPE_ACTIVITY))
            {
                if (((ToolKit.isBigThan(_arg_1.lm, 0)) && (!(ToolKit.isEqual(_arg_1.id, 2766)))))
                {
                    _local_2 = Language.QUESTGUIDE_S[19];
                };
                _local_5 = parseInt(_arg_1.id);
                if (GamePredef.DUPLICATE_TASK_IDS[_local_5])
                {
                    _local_2 = Language.QUESTGUIDE_S[20];
                };
            }
            else
            {
                if (ToolKit.isEqual(_arg_1.type, GamePredef.QUEST_TYPE_LOOP))
                {
                    _local_6 = _arg_1.subType.split("-");
                    _local_7 = parseInt(_local_6[1]);
                    if (GamePredef.QUEST_SUB_TYPE_APPR[_local_7])
                    {
                        _local_2 = GamePredef.QUEST_SUB_TYPE_APPR[_local_7];
                    };
                };
            };
            var _local_3:uint = 13;
            var _local_4:* = (((("<font color='#1E90FF' size='" + _local_3) + "'>") + _local_2) + "</font>");
            return (_local_4);
        }

        public function set awardItem5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._358313765awardItem5;
            if (_local_2 !== _arg_1)
            {
                this._358313765awardItem5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardItem5", _local_2, _arg_1));
            };
        }

        private function _QuestCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTCANVAS_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cb_guide.label = _arg_1;
            }, "cb_guide.label");
            result[0] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_guideVisible);
            }, function (_arg_1:Boolean):void
            {
                cb_guide.visible = _arg_1;
            }, "cb_guide.visible");
            result[1] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_EXP);
            }, function (_arg_1:uint):void
            {
                awardExp.type = _arg_1;
            }, "awardExp.type");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                awardItem1.slotType = _arg_1;
            }, "awardItem1.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                awardItem2.slotType = _arg_1;
            }, "awardItem2.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                awardItem3.slotType = _arg_1;
            }, "awardItem3.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                awardItem4.slotType = _arg_1;
            }, "awardItem4.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                awardItem5.slotType = _arg_1;
            }, "awardItem5.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                awardItem6.slotType = _arg_1;
            }, "awardItem6.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestCanvas_BasicTxtButton1.label = _arg_1;
            }, "_QuestCanvas_BasicTxtButton1.label");
            result[9] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_embeded));
            }, function (_arg_1:Boolean):void
            {
                _QuestCanvas_BasicTxtButton1.visible = _arg_1;
            }, "_QuestCanvas_BasicTxtButton1.visible");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTCANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestCanvas_BasicTxtButton2.label = _arg_1;
            }, "_QuestCanvas_BasicTxtButton2.label");
            result[11] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_embeded));
            }, function (_arg_1:Boolean):void
            {
                _QuestCanvas_BasicTxtButton2.visible = _arg_1;
            }, "_QuestCanvas_BasicTxtButton2.visible");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTCANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestCanvas_BasicTxtButton3.label = _arg_1;
            }, "_QuestCanvas_BasicTxtButton3.label");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_embeded));
            }, function (_arg_1:Boolean):void
            {
                _QuestCanvas_BasicTxtButton3.visible = _arg_1;
            }, "_QuestCanvas_BasicTxtButton3.visible");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTCANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestCanvas_BasicTxtButton4.label = _arg_1;
            }, "_QuestCanvas_BasicTxtButton4.label");
            result[15] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_embeded));
            }, function (_arg_1:Boolean):void
            {
                _QuestCanvas_BasicTxtButton4.visible = _arg_1;
            }, "_QuestCanvas_BasicTxtButton4.visible");
            result[16] = binding;
            return (result);
        }

        public function set awardItem6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._358313766awardItem6;
            if (_local_2 !== _arg_1)
            {
                this._358313766awardItem6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardItem6", _local_2, _arg_1));
            };
        }

        public function __awardItem3_click(_arg_1:MouseEvent):void
        {
            awardItemClick(_arg_1);
        }

        public function set questData(_arg_1:Object):void
        {
            initQuest(_arg_1);
        }

        public function __cb_guide_change(_arg_1:Event):void
        {
            changeGuideAble();
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

        private function _QuestCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.QUESTCANVAS_U[4];
            _local_1 = _guideVisible;
            _local_1 = Currency.TYPE_EXP;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Language.QUESTCANVAS_U[0];
            _local_1 = (!(_embeded));
            _local_1 = Language.QUESTCANVAS_U[1];
            _local_1 = (!(_embeded));
            _local_1 = Language.QUESTCANVAS_U[2];
            _local_1 = (!(_embeded));
            _local_1 = Language.QUESTCANVAS_U[3];
            _local_1 = (!(_embeded));
        }

        private function awardItemClick(_arg_1:Event):void
        {
            var _local_2:int;
            if (((((quest) && (ToolKit.isEqual(quest.at, 2))) && (_arg_1.currentTarget.slotData)) && (ToolKit.isEqual(qd.state, GamePredef.ST_QUEST_CANFINISH))))
            {
                _local_2 = 1;
                while (_local_2 <= 6)
                {
                    this[("awardItem" + _local_2)].setStyleName(0);
                    _local_2++;
                };
                _arg_1.currentTarget.setStyleName(1);
                selectId = _arg_1.currentTarget.slotData.id;
            };
        }

        public function set lastTimeLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1775826383lastTimeLabel;
            if (_local_2 !== _arg_1)
            {
                this._1775826383lastTimeLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastTimeLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardMoney():Currency
        {
            return (this._361867363awardMoney);
        }

        public function set awardItem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._358313761awardItem1;
            if (_local_2 !== _arg_1)
            {
                this._358313761awardItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardItem1", _local_2, _arg_1));
            };
        }

        public function set embeded(_arg_1:Boolean):void
        {
            _embeded = _arg_1;
        }

        private function set _guideVisible(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1062904757_guideVisible;
            if (_local_2 !== _arg_1)
            {
                this._1062904757_guideVisible = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_guideVisible", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardExp():Currency
        {
            return (this._1621975424awardExp);
        }

        public function __awardItem4_click(_arg_1:MouseEvent):void
        {
            awardItemClick(_arg_1);
        }

        override public function initialize():void
        {
            var target:QuestCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _QuestCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_QuestCanvasWatcherSetupUtil");
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
            removeTimer();
            questName.htmlText = "";
            lastTime = 0;
            lastTimeLabel.text = "";
            lastTimeLabel.visible = false;
            lastTimeLabel.includeInLayout = false;
            info.text = "";
            info.htmlText = "";
            var _local_1:int = 1;
            while (_local_1 <= 6)
            {
                this[("awardItem" + _local_1)].reset();
                this[("awardItem" + _local_1)].setStyle("borderColor", 0);
                _local_1++;
            };
            awardExp.value = 0;
            awardMoney.value = 0;
        }

        [Bindable(event="propertyChange")]
        public function get questName():LinkTextArea
        {
            return (this._1783052659questName);
        }

        public function __info_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        private function changeGuideAble():void
        {
            var _local_1:Object;
            if (_core.questGuideList[qd.qid])
            {
                _core.questGuideList[qd.qid].guideAble = cb_guide.selected;
                _core.questGuideList[qd.qid].taketime = (_core.lastQuestTime + 1);
            }
            else
            {
                _local_1 = new Object();
                _local_1.guideAble = cb_guide.selected;
                _local_1.taketime = (_core.lastQuestTime + 1);
                _local_1.qid = qd.qid;
                _core.questGuideList[qd.qid] = _local_1;
            };
            _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE).updateQuestGuide();
        }

        public function set guideVisible(_arg_1:Boolean):void
        {
            _guideVisible = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get info():LinkTextArea
        {
            return (this._3237038info);
        }

        public function initQuest(_arg_1:Object):void
        {
            var _local_10:*;
            var _local_11:String;
            var _local_12:Object;
            var _local_13:Number;
            var _local_14:int;
            var _local_15:String;
            var _local_16:int;
            var _local_17:Number;
            var _local_18:String;
            var _local_19:Number;
            var _local_20:String;
            var _local_21:String;
            var _local_22:Object;
            var _local_23:String;
            var _local_24:Array;
            var _local_25:Object;
            var _local_26:Object;
            var _local_27:Object;
            var _local_28:*;
            var _local_29:int;
            var _local_30:*;
            var _local_31:int;
            var _local_32:String;
            var _local_33:Boolean;
            selectId = -1;
            clearView();
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.lastTime)
            {
                lastTime = _arg_1.lastTime;
            };
            qd = _arg_1;
            quest = _arg_1.data;
            visible = true;
            if (!_core.questGuideList[qd.qid])
            {
                cb_guide.selected = false;
            }
            else
            {
                if (_core.questGuideList[qd.qid].guideAble == false)
                {
                    cb_guide.selected = false;
                }
                else
                {
                    cb_guide.selected = true;
                };
            };
            removeTimer();
            if (_arg_1.lastTime)
            {
                questTimer = new Timer(1000, int(_arg_1.lastTime));
                questTimer.addEventListener(TimerEvent.TIMER, timerRepeat);
                questTimer.start();
                lastTimeLabel.visible = true;
                lastTimeLabel.includeInLayout = true;
            };
            var _local_2:int = _arg_1.data.color;
            if (ToolKit.isEqual(_arg_1.data.type, GamePredef.QUEST_TYPE_CALLBOARD))
            {
                _local_2 = _arg_1.c;
            };
            questName.htmlText = (getQuestNamePrefix(_arg_1.data) + TextUtil.decode((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_QUEST]) + "|") + _arg_1.data.id) + "|") + _arg_1.data.name) + "|") + _local_2) + "|0|0]")));
            var _local_3:* = "";
            if (_arg_1.cn >= 0)
            {
                _local_3 = Language.QUESTCANVAS_S[0];
                _local_3 = _local_3.replace("{questData.cn}", _arg_1.cn);
            };
            var _local_4:String = Language.QUESTCANVAS_S[1];
            var _local_5:* = "";
            var _local_6:* = "";
            var _local_7:* = "";
            if (((ToolKit.isBigThan(quest.rt, 0)) && (ToolKit.isBigThan(quest.rn, 0))))
            {
                switch (Number(quest.rt))
                {
                    case 1:
                        _local_4 = (_local_4 + ((("<br>　" + GamePredef.CURRENCY_TIP[Currency.TYPE_MONEY_BIND]) + ":") + quest.rn));
                        break;
                    case 2:
                        _local_4 = (_local_4 + ((("<br>　" + GamePredef.CURRENCY_TIP[Currency.TYPE_MONEY]) + ":") + quest.rn));
                        break;
                    case 3:
                        _local_4 = (_local_4 + ((("<br>　" + GamePredef.CURRENCY_TIP[Currency.TYPE_GOLD_BIND]) + ":") + quest.rn));
                        break;
                    case 4:
                        _local_4 = (_local_4 + ((("<br>　" + GamePredef.CURRENCY_TIP[Currency.TYPE_GOLD]) + ":") + quest.rn));
                        break;
                    case 10:
                        _local_4 = (_local_4 + ((("<br>　" + GamePredef.CURRENCY_TIP[Currency.TYPE_EXPBATTLE]) + ":") + quest.rn));
                        break;
                    case 11:
                        _local_4 = (_local_4 + ((("<br>　" + GamePredef.CURRENCY_TIP[Currency.TYPE_ACTPOINT]) + ":") + quest.rn));
                        break;
                    case 13:
                        _local_4 = (_local_4 + ((("<br>　" + GamePredef.CURRENCY_TIP[27]) + ":") + quest.rn));
                        break;
                };
            };
            if (_arg_1.require)
            {
                for each (_local_10 in _arg_1.require)
                {
                    if (ToolKit.isEqual(_local_10.kind, GamePredef.QUEST_REQUIRE_ITEM))
                    {
                        _local_11 = ((" (" + _local_10.num) + ")");
                        _local_12 = _core.getTemplateData(_local_10.type, _local_10.itemId);
                        _local_13 = 0;
                        if (_local_10.q < 0)
                        {
                            _local_13 = _core.getItemNum(_local_10.type, _local_10.itemId).num;
                        }
                        else
                        {
                            _local_14 = _core.basic.getColorByQuality(_local_10.q);
                            if (_local_14 < 0)
                            {
                                _local_14 = 0;
                            }
                            else
                            {
                                if (_local_14 > 5)
                                {
                                    _local_14 = 5;
                                };
                            };
                            _local_13 = _core.getItemNumByColor(_local_10.type, _local_10.itemId, _local_14).num;
                        };
                        _local_11 = ((((" (" + _local_13) + "/") + _local_10.num) + ")");
                        _local_5 = (_local_5 + (((((((((((("<br>　" + "<font color='") + GamePredef.MSG_ITEM_COLOR[_local_14]) + "'><a href='event:L_") + GamePredef.LINK_TYPE_ARRAY[_local_10.type]) + "|") + _local_10.itemId) + "|") + _local_10.name) + "' >") + _local_10.name) + "</a></font>") + _local_11));
                    }
                    else
                    {
                        if (ToolKit.isEqual(_local_10.kind, GamePredef.QUEST_REQUIRE_PET))
                        {
                            _local_15 = ((" (" + _local_10.num) + ")");
                            _local_16 = int(_core.basic.colorByGrowRate((_local_10.q / 10)));
                            _local_17 = _core.getPetNumByColor(_local_10.itemId, _local_10.name, _local_16);
                            _local_15 = ((((" (" + _local_17) + "/") + _local_10.num) + ")");
                            _local_18 = "";
                            if (_local_16 >= 1)
                            {
                                _local_18 = (((("<font color='" + GamePredef.MSG_EVENTTEXT_COLOR[0]) + "'>[") + Language.QUESTCANVAS_PCOLOR[_local_16]) + "]</font>");
                            };
                            _local_6 = (_local_6 + (((((((((((((((("<br>　" + Language.QUESTCANVAS_S[2]) + " ") + "<font color='") + GamePredef.MSG_ITEM_COLOR[_local_16]) + "'><a href='event:L_") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CREATURE]) + "|") + _local_10.itemId) + "|") + _local_10.name) + "' >") + _local_10.name) + "</a></font>") + _local_18) + _local_15) + Language.QUESTCANVAS_S[3]));
                        }
                        else
                        {
                            if (ToolKit.isEqual(_local_10.kind, GamePredef.QUEST_REQUIRE_CREATUR))
                            {
                                _local_19 = 0;
                                _local_20 = ((" (0/" + _local_10.num) + ")");
                                if (_arg_1.questKill)
                                {
                                    for each (_local_22 in _arg_1.questKill)
                                    {
                                        if (((_local_22) && (ToolKit.isEqual(_local_22.creatureId, _local_10.itemId))))
                                        {
                                            if (ToolKit.isSmallOrEqual(_local_22.num, 0))
                                            {
                                                _local_20 = Language.QUESTCANVAS_S[4];
                                            }
                                            else
                                            {
                                                _local_19 = ToolKit.minus(_local_10.num, _local_22.num);
                                                _local_20 = ((((" (" + _local_19) + "/") + _local_10.num) + ")");
                                            };
                                        };
                                    };
                                };
                                if (((_arg_1.pos) && (_arg_1.pos.name)))
                                {
                                    _local_21 = _arg_1.pos.name;
                                }
                                else
                                {
                                    _local_21 = _local_10.creature.name;
                                };
                                _local_7 = (_local_7 + (((((((((((((("<br>　" + Language.QUESTCANVAS_S[5]) + " ") + "<font color='") + GamePredef.MSG_EVENTTEXT_COLOR[3]) + "'><a href='event:L_") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CREATURE]) + "|") + _local_10.creature.id) + "|") + _local_21.split("【")[0]) + "' >") + _local_21.split("【")[0]) + "</a></font>") + _local_20));
                            };
                        };
                    };
                };
            };
            _local_4 = (_local_4 + ((_local_5 + _local_6) + _local_7));
            var _local_8:* = "";
            if (ToolKit.isBigThan(quest.startNpc, 0))
            {
                _local_8 = ((TextUtil.decode(((((((Language.QUESTCANVAS_S[6] + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_NPC]) + "|") + quest.startNpc) + "|") + _arg_1.sName) + "|0|0|0]")) + TextUtil.getMapHtml(_arg_1.sMid)) + "<br>");
            }
            else
            {
                if (ToolKit.isEqual(quest.type, GamePredef.QUEST_TYPE_LOOP))
                {
                    _local_23 = quest.subType;
                    _local_24 = _local_23.split("-");
                    _local_25 = _core.data.getData(GamePredef.TBL_QUEST_LOOP, _local_24[1]);
                    if (_local_25)
                    {
                        _local_26 = _core.player.getMyLoopData(_local_25.id);
                        if (_local_26)
                        {
                            if (_local_26.ft >= _local_25.num)
                            {
                                _local_26.ft = ToolKit.minus(_local_26.ft, 1);
                            };
                            _local_8 = (((((((((Language.QUESTCANVAS_S[15] + "<font color='#ff0000'>") + _local_25.name) + "</font> ") + Language.QUESTCANVAS_S[16]) + "<font color='#ff0000'>") + ToolKit.add(_local_26.ft, 1)) + "/") + _local_25.num) + "</font><br>");
                        };
                    };
                }
                else
                {
                    if (ToolKit.isEqual(quest.type, GamePredef.QUEST_TYPE_GUILD))
                    {
                        _local_8 = (("<font color='#ff0000'>" + Language.QUESTCANVAS_S[18]) + "</font><br>");
                    }
                    else
                    {
                        if (((!(ToolKit.isEqual(quest.type, GamePredef.QUEST_TYPE_CALLBOARD))) && (!(quest.type == GamePredef.QUEST_TYPE_CLASS))))
                        {
                            _local_8 = (("<font color='#ff0000'>" + Language.QUESTCANVAS_S[7]) + "</font>");
                        };
                    };
                };
            };
            if ((((_arg_1) && (_arg_1.data.type == GamePredef.QUEST_TYPE_CLASS)) && (quest.finishNpc < 0)))
            {
                _local_27 = _core.data.gameDataIndex3[GamePredef.TBL_NPC][_core.player.classId];
                for (_local_28 in _local_27)
                {
                    quest.finishNpc = _local_28;
                    _arg_1.fName = _local_27[_local_28].name;
                    break;
                };
            };
            if (ToolKit.isBigThan(quest.finishNpc, 0))
            {
                _local_8 = (_local_8 + ((TextUtil.decode(((((((Language.QUESTCANVAS_S[8] + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_NPC]) + "|") + quest.finishNpc) + "|") + _arg_1.fName) + "|0|0|0]")) + TextUtil.getMapHtml(_arg_1.fMid)) + "<br>"));
            };
            if (_local_4.length <= 10)
            {
                _local_4 = "";
            };
            var _local_9:String = _arg_1.data.info;
            if (_arg_1.data.posInfo)
            {
                _local_9 = (_local_9 + ("<br>" + _arg_1.data.posInfo));
            };
            if (_arg_1.data.clsInfo)
            {
                if (_arg_1.state != GamePredef.ST_QUEST_CANTAKE)
                {
                    _local_4 = (_local_4 + ("<br>" + _arg_1.data.clsInfo));
                };
            };
            if (((parent is TipQuest) || (parent.parent is ViewStack)))
            {
                info.htmlText = (((((("<font color='#FFFFFF'>" + _local_9) + "<br>") + _local_4) + "<br>") + _local_8) + "</font>");
            }
            else
            {
                info.htmlText = (((((("<font color='#FFFFFF'>" + _arg_1.data.info) + "<br>") + _local_4) + "<br>") + _local_8) + "</font>");
            };
            if (ToolKit.isEqual(_arg_1.data.type, GamePredef.QUEST_TYPE_CLASS))
            {
                if (_arg_1.clsData)
                {
                    _local_29 = (_arg_1.clsData.num % 10);
                }
                else
                {
                    _local_29 = (_arg_1.cn % 10);
                };
                awardExp.value = Math.round((((GamePredef.BASIC_GET_EXP[_core.player.level] * GamePredef.CLASS_QUEST_MONEY_EXP_NUM[_local_29]) * 10) / 31.5));
            }
            else
            {
                if (ToolKit.isBigThan(_arg_1.data.awardExp, 0))
                {
                    awardExp.value = _arg_1.data.awardExp;
                };
            };
            if (ToolKit.isEqual(_arg_1.data.type, GamePredef.QUEST_TYPE_CLASS))
            {
                awardMoney.type = Currency.TYPE_MONEYALL;
                if (_arg_1.clsData)
                {
                    _local_29 = (_arg_1.clsData.num % 10);
                }
                else
                {
                    _local_29 = (_arg_1.cn % 10);
                };
                awardMoney.value = Math.round((((GamePredef.BASIC_GET_MONEY[_core.player.level] * GamePredef.CLASS_QUEST_MONEY_EXP_NUM[_local_29]) * 3) / 31.5));
            }
            else
            {
                if (((ToolKit.isBigThan(_arg_1.data.moneyType, 0)) && (ToolKit.isBigThan(_arg_1.data.moneyNum, 0))))
                {
                    switch (Number(_arg_1.data.moneyType))
                    {
                        case 1:
                            awardMoney.type = Currency.TYPE_MONEY_BIND;
                            break;
                        case 2:
                            awardMoney.type = Currency.TYPE_MONEY;
                            break;
                        case 3:
                            awardMoney.type = Currency.TYPE_GOLD_BIND;
                            break;
                        case 4:
                            awardMoney.type = Currency.TYPE_GOLD;
                            break;
                        case 10:
                            awardMoney.type = Currency.TYPE_EXPBATTLE;
                            break;
                        case 11:
                            awardMoney.type = Currency.TYPE_ACTPOINT;
                            break;
                    };
                    awardMoney.value = _arg_1.data.moneyNum;
                };
            };
            if (ToolKit.isEqual(_arg_1.data.type, GamePredef.QUEST_TYPE_CALLBOARD))
            {
                awardExp.value = (awardExp.value * GamePredef.CALLBOARD_AWARD_NUM[_arg_1.c]);
                awardMoney.value = (awardMoney.value * GamePredef.CALLBOARD_AWARD_NUM[_arg_1.c]);
            };
            if (_arg_1.award)
            {
                for each (_local_30 in _arg_1.award)
                {
                    if (ToolKit.isEqual(_local_30.kind, GamePredef.QUEST_AWARD_ITEM))
                    {
                        _local_31 = 1;
                        while (_local_31 <= 6)
                        {
                            _local_32 = _core.getTemplateData(_local_30.type, _local_30.itemId).reqClass;
                            _local_33 = ((!(ToolKit.isEqual(_arg_1.data.at, 3))) || ((ToolKit.isEqual(_arg_1.data.at, 3)) && (_local_32.indexOf((("|" + _core.player.classId) + "|")) >= 0)));
                            if (((this[("awardItem" + _local_31)].type == -1) && (_local_33)))
                            {
                                this[("awardItem" + _local_31)].type = _local_30.type;
                                this[("awardItem" + _local_31)].giid = _local_30.itemId;
                                this[("awardItem" + _local_31)].stackNum = _local_30.num;
                                this[("awardItem" + _local_31)].slotData = _local_30;
                                break;
                            };
                            _local_31++;
                        };
                    }
                    else
                    {
                        if (ToolKit.isEqual(_local_30.kind, GamePredef.QUEST_AWARD_PET))
                        {
                            _local_31 = 1;
                            while (_local_31 <= 6)
                            {
                                if (this[("awardItem" + _local_31)].type == -1)
                                {
                                    this[("awardItem" + _local_31)].type = GamePredef.TBL_CREATURE;
                                    this[("awardItem" + _local_31)].giid = _local_30.itemId;
                                    this[("awardItem" + _local_31)].slotData = _local_30;
                                    break;
                                };
                                _local_31++;
                            };
                        }
                        else
                        {
                            if (ToolKit.isEqual(_local_30.kind, GamePredef.QUEST_AWARD_SKILL))
                            {
                                _local_31 = 1;
                                while (_local_31 <= 6)
                                {
                                    if (this[("awardItem" + _local_31)].type == -1)
                                    {
                                        this[("awardItem" + _local_31)].type = GamePredef.TBL_SKILL;
                                        this[("awardItem" + _local_31)].giid = _local_30.itemId;
                                        this[("awardItem" + _local_31)].stackNum = _local_30.num;
                                        this[("awardItem" + _local_31)].slotData = _local_30;
                                        break;
                                    };
                                    _local_31++;
                                };
                            };
                        };
                    };
                };
                if (ToolKit.isEqual(_arg_1.data.at, 2))
                {
                    selectId = -1;
                };
            };
            if (((_arg_1.data.aScriptText) && (_arg_1.data.aScriptText.length > 3)))
            {
                _local_31 = 1;
                while (_local_31 <= 6)
                {
                    if (this[("awardItem" + _local_31)].type == -1)
                    {
                        this[("awardItem" + _local_31)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[("awardItem" + _local_31)].setIconToolTip(ResManager.ICON_QUEST_AWARD, _arg_1.data.aScriptText);
                        return;
                    };
                    _local_31++;
                };
            };
        }

        private function mouseWheelHandler(_arg_1:MouseEvent):void
        {
            var _local_2:MouseEvent = new MouseEvent(MouseEvent.MOUSE_WHEEL);
            _local_2.delta = _arg_1.delta;
        }

        public function set awardMoney(_arg_1:Currency):void
        {
            var _local_2:Object = this._361867363awardMoney;
            if (_local_2 !== _arg_1)
            {
                this._361867363awardMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardMoney", _local_2, _arg_1));
            };
        }

        public function __awardItem1_click(_arg_1:MouseEvent):void
        {
            awardItemClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        private function get _guideVisible():Boolean
        {
            return (this._1062904757_guideVisible);
        }

        public function __awardItem5_click(_arg_1:MouseEvent):void
        {
            awardItemClick(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.comp

