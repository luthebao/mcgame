// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.StarSpeedUpPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.ItemSlotStars;
    import mx.controls.CheckBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.events.NumericStepperEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.FlexEvent;
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

    public class StarSpeedUpPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const MINUS_TIME_PER_ITEM:Number = 300000;
        private var _starType:int;
        private var _1279261040rl_name:RoundedLabel;
        private var _1279447474rl_time:RoundedLabel;
        public var _StarSpeedUpPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _97884btn:DelayButton;
        private var _3525ns:NumericStepper;
        private var _928564223rl_num:RoundedLabel;
        private var _3242771item:ItemSlotStars;
        private var _1536861091checkBox:CheckBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":220,
                    "height":260,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_StarSpeedUpPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "39";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":200,
                                "height":200,
                                "x":10,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlotStars,
                                    "id":"item",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "36";
                                        this.horizontalCenter = "0";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl_time",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":84});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl_name",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.top = "10";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl_num",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "30";
                                        this.bottom = "38";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns",
                                    "events":{"change":"__ns_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "38";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":92,
                                            "maximum":9999
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"btn",
                                    "events":{"click":"__btn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":5000,
                                            "styleName":"BtnStdRed",
                                            "width":60
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"checkBox",
                                    "events":{"change":"__checkBox_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":92,
                                            "y":110,
                                            "height":22
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
        private var _dm:DataManager = DataManager.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function StarSpeedUpPanel()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 220;
            this.height = 260;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___StarSpeedUpPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StarSpeedUpPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get rl_num():RoundedLabel
        {
            return (this._928564223rl_num);
        }

        public function set rl_num(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._928564223rl_num;
            if (_local_2 !== _arg_1)
            {
                this._928564223rl_num = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_num", _local_2, _arg_1));
            };
        }

        private function _StarSpeedUpPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.STAR_SPEED_UP_PANEL_U[0];
            _local_1 = Slot.SLOT_STARS_SPEED;
            _local_1 = Language.STAR_SPEED_UP_PANEL_U[1];
            _local_1 = Language.STAR_SPEED_UP_PANEL_U[2];
            _local_1 = (!(checkBox.selected));
            _local_1 = Language.STAR_SPEED_UP_PANEL_U[3];
            _local_1 = Language.STAR_SPEED_UP_PANEL_U[4];
            _local_1 = Language.STAR_SPEED_UP_PANEL_S[4];
        }

        public function __ns_change(_arg_1:NumericStepperEvent):void
        {
            changeNum();
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            speedUp();
        }

        override public function initialize():void
        {
            var target:StarSpeedUpPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StarSpeedUpPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_StarSpeedUpPanelWatcherSetupUtil");
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

        public function set ns(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._3525ns;
            if (_local_2 !== _arg_1)
            {
                this._3525ns = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlotStars
        {
            return (this._3242771item);
        }

        private function updateMinusTime(_arg_1:int):void
        {
            var _local_2:Number = (MINUS_TIME_PER_ITEM * _arg_1);
            var _local_3:Number = (_local_2 / (60 * 1000));
            var _local_4:int = int((_local_3 / (24 * 60)));
            var _local_5:int = int(((_local_3 % (24 * 60)) / 60));
            var _local_6:int = ((_local_3 % (24 * 60)) % 60);
            var _local_7:String = Language.STAR_SPEED_UP_PANEL_S[0].toString().replace("{d}", _local_4).replace("{h}", _local_5).replace("{m}", _local_6);
            rl_time.text = (Language.STAR_SPEED_UP_PANEL_U[1] + _local_7);
        }

        public function set item(_arg_1:ItemSlotStars):void
        {
            var _local_2:Object = this._3242771item;
            if (_local_2 !== _arg_1)
            {
                this._3242771item = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item", _local_2, _arg_1));
            };
        }

        private function _StarSpeedUpPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_SPEED_UP_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarSpeedUpPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_StarSpeedUpPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_STARS_SPEED);
            }, function (_arg_1:int):void
            {
                item.slotType = _arg_1;
            }, "item.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_SPEED_UP_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rl_time.text = _arg_1;
            }, "rl_time.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_SPEED_UP_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rl_num.text = _arg_1;
            }, "rl_num.text");
            result[3] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(checkBox.selected));
            }, function (_arg_1:Boolean):void
            {
                ns.enabled = _arg_1;
            }, "ns.enabled");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_SPEED_UP_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn.label = _arg_1;
            }, "btn.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_SPEED_UP_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                checkBox.label = _arg_1;
            }, "checkBox.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_SPEED_UP_PANEL_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                checkBox.toolTip = _arg_1;
            }, "checkBox.toolTip");
            result[7] = binding;
            return (result);
        }

        public function slotGiidChange(_arg_1:Event):void
        {
            if (((item.slotData) && (item.slotData.tid == GamePredef.STAR_SPEED_UP_ITEM_IDS[_starType])))
            {
                btn.enabled = true;
                ns.enabled = true;
                checkBox.enabled = true;
                if (checkBox.selected)
                {
                    ns.enabled = false;
                    updateMinusTime(item.stackNum);
                };
            };
        }

        public function init():void
        {
            item.addEventListener(GameEvent.SLOT_NUM_CHANGE, slotGiidChange);
        }

        private function changeNum():void
        {
            if (!item.slotData)
            {
                _core.sysMidNote(Language.STAR_SPEED_UP_PANEL_S[2]);
                return;
            };
            updateMinusTime(ns.value);
        }

        public function set btn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rl_time():RoundedLabel
        {
            return (this._1279447474rl_time);
        }

        public function onSpeedUpStarLvUp(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_CHARACTOR);
                _local_2.onBeginStarLvUp(_arg_1.d);
                item.stackNum = (item.stackNum - _arg_1.n);
            };
        }

        [Bindable(event="propertyChange")]
        public function get checkBox():CheckBox
        {
            return (this._1536861091checkBox);
        }

        [Bindable(event="propertyChange")]
        public function get ns():NumericStepper
        {
            return (this._3525ns);
        }

        private function changeSelect():void
        {
            var _local_1:int;
            if (checkBox.selected)
            {
                _local_1 = 0;
                ((item.slotData) && (_local_1 = item.stackNum));
                updateMinusTime(_local_1);
            }
            else
            {
                updateMinusTime(ns.value);
            };
        }

        public function set checkBox(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1536861091checkBox;
            if (_local_2 !== _arg_1)
            {
                this._1536861091checkBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "checkBox", _local_2, _arg_1));
            };
        }

        private function speedUp():void
        {
            var _local_1:String;
            if (!item.slotData)
            {
                _core.sysMidNote(Language.STAR_SPEED_UP_PANEL_S[2]);
                return;
            };
            if (GamePredef.STAR_SPEED_UP_ITEM_IDS[_starType] != item.slotData.tid)
            {
                _local_1 = Language.STAR_SPEED_UP_PANEL_S[1].toString().replace("{name}", Language.STAR_ADD_PANEL_U[_starType]);
                _core.sysMidNote(_local_1);
                return;
            };
            if (((!(checkBox.selected)) && (ns.value <= 0)))
            {
                _core.sysMidNote(Language.STAR_SPEED_UP_PANEL_S[3]);
                return;
            };
            _core.remote.call("speedUpStarLvUp", new Responder(onSpeedUpStarLvUp), _starType, checkBox.selected, ns.value, item.slotData.id);
        }

        [Bindable(event="propertyChange")]
        public function get btn():DelayButton
        {
            return (this._97884btn);
        }

        public function set rl_name(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1279261040rl_name;
            if (_local_2 !== _arg_1)
            {
                this._1279261040rl_name = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_name", _local_2, _arg_1));
            };
        }

        public function set rl_time(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1279447474rl_time;
            if (_local_2 !== _arg_1)
            {
                this._1279447474rl_time = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_time", _local_2, _arg_1));
            };
        }

        public function setSelectStar(_arg_1:int):void
        {
            var _local_2:Object;
            var _local_3:int;
            _starType = _arg_1;
            rl_name.text = Language.STAR_ADD_PANEL_U[_arg_1];
            item.clean();
            for each (_local_2 in _dm.sList)
            {
                if (((ToolKit.isBigThan(_local_2.sid, GamePredef.SLOT_SID_BAG[0])) && (ToolKit.isSmallOrEqual(_local_2.sid, GamePredef.SLOT_SID_BAG[_core.player.bagSlotNum]))))
                {
                    _local_3 = GamePredef.STAR_SPEED_UP_ITEM_IDS[_starType];
                    if (_local_2.tid == _local_3)
                    {
                        item.slotData = _local_2;
                        item.type = _local_2.type;
                        item.giid = _local_2.itemId;
                        item.stackNum = _local_2.stackNum;
                        break;
                    };
                };
            };
            if (!item.slotData)
            {
                item.type = GamePredef.TBL_ITEM_TEMPLATE;
                item.giid = GamePredef.STAR_SPEED_UP_ITEM_IDS[_starType];
                item.stackNum = 0;
                btn.enabled = false;
                ns.enabled = false;
                checkBox.enabled = false;
            }
            else
            {
                btn.enabled = true;
                ns.enabled = true;
                checkBox.enabled = true;
            };
            changeSelect();
        }

        public function __checkBox_change(_arg_1:Event):void
        {
            changeSelect();
        }

        [Bindable(event="propertyChange")]
        public function get rl_name():RoundedLabel
        {
            return (this._1279261040rl_name);
        }

        public function ___StarSpeedUpPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.compDragable

