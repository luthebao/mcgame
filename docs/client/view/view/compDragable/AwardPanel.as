// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AwardPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.view.comp.Slot;
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

    public class AwardPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _114843tip:TextArea;
        public var _AwardPanel_BasicGlowButton2:BasicGlowButton;
        private var setTime:Timer = null;
        private var _3533310slot:ItemSlot;
        private var _337438527restTime:int;
        private var _290976940getAwards:BasicGlowButton;
        public var _AwardPanel_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":236,
                    "height":246,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AwardPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":13,
                                "y":39,
                                "width":213,
                                "height":74,
                                "styleName":"CanvasAward",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":TextArea,
                                    "id":"tip",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.fontSize = 13;
                                        this.fontFamily = "宋体";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "selectable":false,
                                            "x":10,
                                            "y":10,
                                            "width":193,
                                            "height":54,
                                            "editable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"getAwards",
                        "events":{"click":"__getAwards_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":32,
                                "y":177.15,
                                "styleName":"BtnStdRed",
                                "width":82
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_AwardPanel_BasicGlowButton2",
                        "events":{"click":"___AwardPanel_BasicGlowButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":137,
                                "y":177.15,
                                "styleName":"BtnStdRed",
                                "width":67
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"slot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":101,
                                "y":121,
                                "movable":false,
                                "height":34.2
                            });
                        }
                    })]
                });
            }
        });
        private var _1258484496awardItem:Object = new Object();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AwardPanel()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 236;
            this.height = 246;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AwardPanel._watcherSetupUtil = _arg_1;
        }


        private function set restTime(_arg_1:int):void
        {
            var _local_2:Object = this._337438527restTime;
            if (_local_2 !== _arg_1)
            {
                this._337438527restTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "restTime", _local_2, _arg_1));
            };
        }

        public function set slot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3533310slot;
            if (_local_2 !== _arg_1)
            {
                this._3533310slot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:AwardPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AwardPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AwardPanelWatcherSetupUtil");
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

        private function onItem():void
        {
            slot.type = awardItem.ti;
            slot.giid = awardItem.ii;
            slot.stackNum = awardItem.n;
            slot.slotData = awardItem;
        }

        [Bindable(event="propertyChange")]
        public function get tip():TextArea
        {
            return (this._114843tip);
        }

        public function init(_arg_1:int=1, _arg_2:Object=null):void
        {
            restTime = _arg_1;
            awardItem = _arg_2;
            show();
            x = ((stage.stageWidth - width) / 2);
            y = ((stage.stageHeight - height) / 2);
            onItem();
            if (restTime != 0)
            {
                getAwards.enabled = false;
                if (setTime != null)
                {
                    return;
                };
                setTime = new Timer(60001, restTime);
                setTime.addEventListener(TimerEvent.TIMER, onTime);
                setTime.start();
            }
            else
            {
                getAwards.enabled = true;
                if (ToolKit.isBigThan(_arg_2.b, 0))
                {
                    slot.slotData.b = 1;
                };
            };
        }

        private function set awardItem(_arg_1:Object):void
        {
            var _local_2:Object = this._1258484496awardItem;
            if (_local_2 !== _arg_1)
            {
                this._1258484496awardItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardItem", _local_2, _arg_1));
            };
        }

        private function getAward():void
        {
            var _local_1:Boolean;
            switch (slot.type)
            {
                case GamePredef.TBL_CREATURE:
                    _local_1 = _core.player.enoughPetSlot(1);
                    break;
                case GamePredef.TBL_EQUIPT_TEMPLATE:
                case GamePredef.TBL_ITEM_TEMPLATE:
                    _local_1 = _core.player.enoughBag(1);
                    break;
                default:
                    _local_1 = true;
            };
            if (_local_1)
            {
                restTime = 0;
                slot.giid = -1;
                _core.view.getUI(ViewManager.MAIN_AWARD_WARN).delWarn();
                if (awardItem.sp)
                {
                    _core.remote.takeSPGift();
                }
                else
                {
                    _core.remote.takeNewGift();
                };
                hide();
            }
            else
            {
                _core.sysMidNote(Language.AWARDPANEL_S[2]);
            };
        }

        [Bindable(event="propertyChange")]
        private function get awardItem():Object
        {
            return (this._1258484496awardItem);
        }

        [Bindable(event="propertyChange")]
        public function get getAwards():BasicGlowButton
        {
            return (this._290976940getAwards);
        }

        public function ___AwardPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            cancel();
        }

        private function getTipText(_arg_1:int):String
        {
            var _local_2:* = "";
            if (_arg_1 == 0)
            {
                return (Language.AWARDPANEL_S[0]);
            };
            _local_2 = Language.AWARDPANEL_S[1].toString();
            return (_local_2.replace("{time}", _arg_1.toString()));
        }

        public function set tip(_arg_1:TextArea):void
        {
            var _local_2:Object = this._114843tip;
            if (_local_2 !== _arg_1)
            {
                this._114843tip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tip", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get restTime():int
        {
            return (this._337438527restTime);
        }

        private function _AwardPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.AWARDPANEL_U[2];
            _local_1 = getTipText(restTime);
            _local_1 = Language.AWARDPANEL_U[0];
            _local_1 = Language.AWARDPANEL_U[1];
            _local_1 = Slot.SLOT_TREASURE;
        }

        private function onTime(_arg_1:TimerEvent):void
        {
            restTime--;
            tip.text = getTipText(restTime);
            if (restTime == 0)
            {
                getAwards.enabled = true;
                setTime.stop();
                setTime.removeEventListener(TimerEvent.TIMER, onTime);
                setTime = null;
                _core.view.getUI(ViewManager.MAIN_AWARD_WARN).warnImage.source = ResManager.ICON_WARN_AWARD;
            };
        }

        public function __getAwards_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        public function set getAwards(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._290976940getAwards;
            if (_local_2 !== _arg_1)
            {
                this._290976940getAwards = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getAwards", _local_2, _arg_1));
            };
        }

        public function reset():void
        {
            if (slot != null)
            {
                slot.giid = -1;
            };
            if (setTime == null)
            {
                return;
            };
            setTime.stop();
            setTime.removeEventListener(TimerEvent.TIMER, onTime);
            setTime = null;
        }

        public function viewClick():void
        {
            show();
        }

        private function _AwardPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwardPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AwardPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = getTipText(restTime);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tip.text = _arg_1;
            }, "tip.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getAwards.label = _arg_1;
            }, "getAwards.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwardPanel_BasicGlowButton2.label = _arg_1;
            }, "_AwardPanel_BasicGlowButton2.label");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot.slotType = _arg_1;
            }, "slot.slotType");
            result[4] = binding;
            return (result);
        }

        public function cancel():void
        {
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get slot():ItemSlot
        {
            return (this._3533310slot);
        }


    }
}//package com.qeedoo.ui.view.compDragable

