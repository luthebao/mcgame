// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AwardPanelAll

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.TextInput;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import com.adobe.serialization.json.JSON;
    import mx.collections.ArrayCollection;
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

    public class AwardPanelAll extends DragableCanvas implements IBindingClient 
    {

        private static const PRE_1:String = "N";
        private static const PRE_2:String = "G";
        private static const PRE_3:String = "D";
        private static const PRE_A:String = "A";
        private static const PRE_O:String = "O";
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _core:Core;
        public var _AwardPanelAll_BasicDelayButton2:BasicDelayButton;
        private var _itemIcon:Image;
        private var _425076048getAwardsByCode:BasicGlowButton;
        private var _3311i8:ItemSlot;
        public var _AwardPanelAll_IntroText1:IntroText;
        public var _AwardPanelAll_IntroText2:IntroText;
        public var _AwardPanelAll_IntroText3:IntroText;
        public var _AwardPanelAll_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3701ti:TextInput;
        private var giftCount:int = 0;
        private var _3310i7:ItemSlot;
        private var _1197257913getAwardsFromNet:BasicDelayButton;
        private var obj:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":442,
                    "height":382,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AwardPanelAll_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":13,
                                "y":37,
                                "width":419,
                                "height":317,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":TextInput,
                                    "id":"ti",
                                    "events":{"mouseDown":"__ti_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.cornerRadius = 0;
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":201.5,
                                            "y":58,
                                            "width":135,
                                            "height":20,
                                            "maxChars":12
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0xFF,
                                            "y":153
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0xFF,
                                            "y":264
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"getAwardsByCode",
                                    "events":{"click":"__getAwardsByCode_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":350.9,
                                            "y":55,
                                            "styleName":"BtnStdRed",
                                            "width":58.1
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"getAwardsFromNet",
                                    "events":{"click":"__getAwardsFromNet_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":60000,
                                            "x":350.9,
                                            "y":158,
                                            "styleName":"BtnStdRed",
                                            "width":58.1
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"_AwardPanelAll_BasicDelayButton2",
                                    "events":{"click":"___AwardPanelAll_BasicDelayButton2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":60000,
                                            "x":350.9,
                                            "y":269,
                                            "styleName":"BtnStdRed",
                                            "width":58.1
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"_AwardPanelAll_IntroText1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10,
                                            "width":149.5,
                                            "height":85
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"_AwardPanelAll_IntroText2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":119,
                                            "width":149.5,
                                            "height":85
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"_AwardPanelAll_IntroText3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":222,
                                            "width":149.5,
                                            "height":85
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AwardPanelAll()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 442;
            this.height = 382;
            this.addEventListener("creationComplete", ___AwardPanelAll_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AwardPanelAll._watcherSetupUtil = _arg_1;
        }


        public function __ti_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get i7():ItemSlot
        {
            return (this._3310i7);
        }

        [Bindable(event="propertyChange")]
        public function get ti():TextInput
        {
            return (this._3701ti);
        }

        override public function initialize():void
        {
            var target:AwardPanelAll;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AwardPanelAll_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AwardPanelAllWatcherSetupUtil");
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

        public function onSerchForGift(_arg_1:Boolean):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                _itemIcon = new Image();
                _local_2 = _core.getTemplateData(GamePredef.TBL_ITEM_TEMPLATE, 2059, false);
                if (_local_2)
                {
                    _itemIcon.source = ResManager.getIconUrl(_local_2.iconCode);
                    ResManager.setColorCode(_itemIcon, _local_2.colorCode);
                    i8.addChild(_itemIcon);
                };
            };
        }

        public function init():void
        {
            iniGift();
        }

        private function take():void
        {
            if (!_core.player.enoughBag(1))
            {
                _core.sysMidNote(Language.AWARDCODEPANEL_S[0]);
                return;
            };
            var _local_1:String = ti.text.slice(0, 1);
            if ((((ti.text) && (ti.text.length)) && (((((((_local_1 == PRE_1) || (_local_1 == PRE_2)) || (_local_1 == PRE_3)) || (_local_1 == PRE_A)) || (_local_1 == PRE_O)) || (ti.text.length == 9)) > 0)))
            {
                _core.remote.uc(ti.text);
            };
            ti.text = "";
        }

        private function _AwardPanelAll_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwardPanelAll_BasicTitleCanvas1.text = _arg_1;
            }, "_AwardPanelAll_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDALL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getAwardsByCode.label = _arg_1;
            }, "getAwardsByCode.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDALL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getAwardsFromNet.label = _arg_1;
            }, "getAwardsFromNet.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwardPanelAll_BasicDelayButton2.toolTip = _arg_1;
            }, "_AwardPanelAll_BasicDelayButton2.toolTip");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDALL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwardPanelAll_BasicDelayButton2.label = _arg_1;
            }, "_AwardPanelAll_BasicDelayButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDALL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwardPanelAll_IntroText1.text = _arg_1;
            }, "_AwardPanelAll_IntroText1.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDALL_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwardPanelAll_IntroText2.text = _arg_1;
            }, "_AwardPanelAll_IntroText2.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AWARDALL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AwardPanelAll_IntroText3.text = _arg_1;
            }, "_AwardPanelAll_IntroText3.text");
            result[7] = binding;
            return (result);
        }

        public function ___AwardPanelAll_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            systemAward();
        }

        public function iniGift():void
        {
            _core = Core.getInstance();
            _core.remote.call("serchForGift", new Responder(onSerchForGift));
            getGameGift();
        }

        public function ___AwardPanelAll_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set getAwardsFromNet(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._1197257913getAwardsFromNet;
            if (_local_2 !== _arg_1)
            {
                this._1197257913getAwardsFromNet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getAwardsFromNet", _local_2, _arg_1));
            };
        }

        public function getGameGift():void
        {
            _core.remote.searchGameGift();
        }

        [Bindable(event="propertyChange")]
        public function get getAwardsByCode():BasicGlowButton
        {
            return (this._425076048getAwardsByCode);
        }

        [Bindable(event="propertyChange")]
        public function get getAwardsFromNet():BasicDelayButton
        {
            return (this._1197257913getAwardsFromNet);
        }

        public function onGetGameGift(_arg_1:String):void
        {
            var _local_3:Object;
            obj = com.adobe.serialization.json.JSON.decode(_arg_1);
            var _local_2:ArrayCollection = new ArrayCollection();
            for each (_local_3 in obj)
            {
                giftCount = (giftCount + 1);
                _local_2.addItem(_local_3);
            };
            if (giftCount == 0)
            {
                return;
            };
            _itemIcon = new Image();
            var _local_4:Object = _core.getTemplateData(GamePredef.TBL_ITEM_TEMPLATE, _local_2[0].giftid, false);
            if (_local_4)
            {
                _itemIcon.source = ResManager.getIconUrl(_local_4.iconCode);
                ResManager.setColorCode(_itemIcon, _local_4.colorCode);
                i7.addChild(_itemIcon);
            };
        }

        public function set i7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3310i7;
            if (_local_2 !== _arg_1)
            {
                this._3310i7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i7", _local_2, _arg_1));
            };
        }

        public function set i8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3311i8;
            if (_local_2 !== _arg_1)
            {
                this._3311i8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i8", _local_2, _arg_1));
            };
        }

        public function __getAwardsByCode_click(_arg_1:MouseEvent):void
        {
            take();
        }

        public function set getAwardsByCode(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._425076048getAwardsByCode;
            if (_local_2 !== _arg_1)
            {
                this._425076048getAwardsByCode = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getAwardsByCode", _local_2, _arg_1));
            };
        }

        public function set ti(_arg_1:TextInput):void
        {
            var _local_2:Object = this._3701ti;
            if (_local_2 !== _arg_1)
            {
                this._3701ti = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ti", _local_2, _arg_1));
            };
        }

        private function systemAward():void
        {
            _core.remote.gtg();
            i8.removeAllChildren();
        }

        [Bindable(event="propertyChange")]
        public function get i8():ItemSlot
        {
            return (this._3311i8);
        }

        public function __getAwardsFromNet_click(_arg_1:MouseEvent):void
        {
            moveGiftToBag();
        }

        public function makeGiftCount(_arg_1:Object):void
        {
            var _local_2:*;
            if (obj)
            {
                for (_local_2 in _arg_1)
                {
                    delete obj[_local_2];
                    if (giftCount <= 0)
                    {
                        giftCount = 0;
                    }
                    else
                    {
                        giftCount = (giftCount - 1);
                    };
                };
            };
            if (giftCount > 0)
            {
                _core.sysMidMsg(Language.AWARDCODEPANEL_S[3].toString().replace("{num}", giftCount));
            }
            else
            {
                _core.sysMidMsg(Language.AWARDCODEPANEL_S[2]);
                i7.removeAllChildren();
            };
        }

        public function moveGiftToBag():void
        {
            if (giftCount == 0)
            {
                return;
            };
            if (obj)
            {
                _core.remote.call("getGameGift", null, obj);
            };
        }

        public function cancel():void
        {
            hide();
        }

        public function onGiftRemain():void
        {
            i8.addChild(_itemIcon);
        }

        private function _AwardPanelAll_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.AWARDPANEL_U[2];
            _local_1 = Language.AWARDALL_S[3];
            _local_1 = Language.AWARDALL_S[3];
            _local_1 = Language.SYSTEMSHOPPANEL_S[14];
            _local_1 = Language.AWARDALL_S[3];
            _local_1 = Language.AWARDALL_S[0];
            _local_1 = Language.AWARDALL_S[1];
            _local_1 = Language.AWARDALL_S[2];
        }


    }
}//package com.qeedoo.ui.view.compDragable

