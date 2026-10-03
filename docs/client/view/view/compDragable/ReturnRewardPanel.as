// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ReturnRewardPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.ComboBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.TextInput;
    import mx.controls.HRule;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.VRule;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.system.Core;
    import flash.events.Event;
    import mx.formatters.DateFormatter;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
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

    public class ReturnRewardPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1584105757viewStack:ViewStack;
        private var _35335177iGetGiftLabel:RoundedLabel;
        private var _245317528inviteReward:ItemSlot;
        private var _1197759319inviteInfo:TextArea;
        private var _612561589iPayLabel:RoundedLabel;
        private var _1700887067inviteSubmitBtn:BasicGlowButton;
        private var _69226535inviteLabel2:RoundedLabel;
        private var iServerId:int = 0;
        private var rRemainReward:int = 0;
        private var _785110143returnReward:ItemSlot;
        private var _config:Object = null;
        private var _1729241368navBtn1:BasicGlowButton;
        private var _575087872iGetRewardBtn:BasicGlowButton;
        private var _1077878564iRewardLabel:RoundedLabel;
        private var _1659057022inviteServerInput:ComboBox;
        private var _83865907rRewardLabel:RoundedLabel;
        private var _1729241367navBtn0:BasicGlowButton;
        private var _2089651473iRemainGiftLabel:RoundedLabel;
        private var maxInvite:int = 0;
        private var _1619367044deadlineLabel:RoundedLabel;
        private var _2065539191rGetRewardBtn:BasicGlowButton;
        private var _2103680635ruleTArea:TextArea;
        private var _1648562839iNumLabel:RoundedLabel;
        private var iName:String = null;
        private var _69226534inviteLabel1:RoundedLabel;
        private var rNum:int = 0;
        public var _ReturnRewardPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1159981765rRRewardLabel:RoundedLabel;
        private var _751424388inviteRuleTArea:TextArea;
        private var _1729325322inviteNameInput:TextInput;
        private var _938592225iGetGiftBtn:BasicGlowButton;
        private var _104320400iRemainRewardLabel:RoundedLabel;
        private var _68714728rGetGiftBtn:BasicGlowButton;
        private var _1525340606rPayLabel:RoundedLabel;
        private var _99558244hrule:HRule;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":530,
                    "height":340,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ReturnRewardPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"navBtn0",
                        "events":{"click":"__navBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "width":78,
                                "x":18,
                                "y":46
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"navBtn1",
                        "events":{"click":"__navBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "width":78,
                                "x":94,
                                "y":46
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"deadlineLabel",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":299,
                                "y":49,
                                "width":228
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"viewStack",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "65";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "width":510,
                                            "height":0xFF,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"inviteLabel1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":45,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"inviteLabel2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":71,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"inviteNameInput",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":95,
                                                        "y":69,
                                                        "width":90
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ComboBox,
                                                "id":"inviteServerInput",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":95,
                                                        "y":43,
                                                        "editable":false,
                                                        "width":90
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"inviteSubmitBtn",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":62,
                                                        "y":105,
                                                        "styleName":"BtnStdRed2",
                                                        "enabled":true,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"inviteInfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":71,
                                                        "width":165,
                                                        "height":60,
                                                        "editable":false,
                                                        "styleName":"CSSBorder",
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VRule,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":195,
                                                        "y":5,
                                                        "height":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"returnReward",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":335,
                                                        "y":15,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"rGetGiftBtn",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":327,
                                                        "y":55,
                                                        "styleName":"BtnStdRed2",
                                                        "enabled":true,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "id":"hrule",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":195,
                                                        "y":86,
                                                        "width":310
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rPayLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":205,
                                                        "y":102,
                                                        "width":188
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rRewardLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":205,
                                                        "y":120,
                                                        "width":188
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rRRewardLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":205,
                                                        "y":135,
                                                        "width":188
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"rGetRewardBtn",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":420,
                                                        "y":118,
                                                        "styleName":"BtnStdRed2",
                                                        "enabled":true,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":165,
                                                        "width":500
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"ruleTArea",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":175,
                                                        "width":470,
                                                        "height":75,
                                                        "editable":false,
                                                        "styleName":"CSSBorder"
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
                                            "styleName":"CanvasBorder",
                                            "width":510,
                                            "height":0xFF,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"inviteReward",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":85,
                                                        "y":28,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"iNumLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":163,
                                                        "y":17,
                                                        "width":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"iGetGiftLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":163,
                                                        "y":38,
                                                        "width":143
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"iRemainGiftLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":163,
                                                        "y":58,
                                                        "width":143
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"iGetGiftBtn",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":340,
                                                        "y":35,
                                                        "styleName":"BtnStdRed2",
                                                        "enabled":true,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":86,
                                                        "width":500
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"iPayLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":102,
                                                        "width":188
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"iRewardLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":120,
                                                        "width":188
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"iRemainRewardLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":135,
                                                        "width":188
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"iGetRewardBtn",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":340,
                                                        "y":118,
                                                        "styleName":"BtnStdRed2",
                                                        "enabled":true,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":165,
                                                        "width":500
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"inviteRuleTArea",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":175,
                                                        "width":470,
                                                        "height":60,
                                                        "editable":false,
                                                        "styleName":"CSSBorder"
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
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ReturnRewardPanel()
        {
            mx_internal::_document = this;
            this.width = 530;
            this.height = 340;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ReturnRewardPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get iGetRewardBtn():BasicGlowButton
        {
            return (this._575087872iGetRewardBtn);
        }

        [Bindable(event="propertyChange")]
        public function get inviteNameInput():TextInput
        {
            return (this._1729325322inviteNameInput);
        }

        public function set iGetRewardBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._575087872iGetRewardBtn;
            if (_local_2 !== _arg_1)
            {
                this._575087872iGetRewardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iGetRewardBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rGetGiftBtn():BasicGlowButton
        {
            return (this._68714728rGetGiftBtn);
        }

        public function set ruleTArea(_arg_1:TextArea):void
        {
            var _local_2:Object = this._2103680635ruleTArea;
            if (_local_2 !== _arg_1)
            {
                this._2103680635ruleTArea = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ruleTArea", _local_2, _arg_1));
            };
        }

        private function _ReturnRewardPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.RETURN_REWARD_PANEL[0];
            _local_1 = Language.RETURN_REWARD_PANEL[1];
            _local_1 = Language.RETURN_REWARD_PANEL[2];
            _local_1 = Language.RETURN_REWARD_PANEL[3];
            _local_1 = Language.RETURN_REWARD_PANEL[5];
            _local_1 = Language.RETURN_REWARD_PANEL[6];
            _local_1 = Language.RETURN_REWARD_PANEL[7];
            _local_1 = Language.RETURN_REWARD_PANEL[9];
            _local_1 = Language.RETURN_REWARD_PANEL[4];
            _local_1 = Language.RETURN_REWARD_PANEL[18];
            _local_1 = Language.RETURN_REWARD_PANEL[15];
            _local_1 = Language.RETURN_REWARD_PANEL[16];
            _local_1 = Language.RETURN_REWARD_PANEL[13];
            _local_1 = Language.RETURN_REWARD_PANEL[8];
            _local_1 = Language.RETURN_REWARD_PANEL[10];
            _local_1 = Language.RETURN_REWARD_PANEL[11];
            _local_1 = Language.RETURN_REWARD_PANEL[12];
            _local_1 = Language.RETURN_REWARD_PANEL[13];
            _local_1 = Language.RETURN_REWARD_PANEL[14];
            _local_1 = Language.RETURN_REWARD_PANEL[15];
            _local_1 = Language.RETURN_REWARD_PANEL[16];
            _local_1 = Language.RETURN_REWARD_PANEL[13];
            _local_1 = Language.RETURN_REWARD_PANEL[17];
        }

        [Bindable(event="propertyChange")]
        public function get navBtn1():BasicGlowButton
        {
            return (this._1729241368navBtn1);
        }

        public function set rGetRewardBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2065539191rGetRewardBtn;
            if (_local_2 !== _arg_1)
            {
                this._2065539191rGetRewardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rGetRewardBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get inviteSubmitBtn():BasicGlowButton
        {
            return (this._1700887067inviteSubmitBtn);
        }

        public function onGetReturnReward(_arg_1:int, _arg_2:String):void
        {
            if (_arg_1 > 0)
            {
                if (_arg_2 == "returner")
                {
                    rGetRewardBtn.enabled = false;
                    rGetRewardBtn.removeEventListener(MouseEvent.CLICK, onGetReturnReward);
                    rRRewardLabel.text = (Language.RETURN_REWARD_PANEL[16] as String).replace("{num}", 0);
                    rRemainReward = 0;
                }
                else
                {
                    iGetRewardBtn.enabled = false;
                    iGetRewardBtn.removeEventListener(MouseEvent.CLICK, onGetReturnReward);
                    iRemainRewardLabel.text = (Language.RETURN_REWARD_PANEL[16] as String).replace("{num}", 0);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get navBtn0():BasicGlowButton
        {
            return (this._1729241367navBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get iGetGiftBtn():BasicGlowButton
        {
            return (this._938592225iGetGiftBtn);
        }

        public function set iRemainRewardLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._104320400iRemainRewardLabel;
            if (_local_2 !== _arg_1)
            {
                this._104320400iRemainRewardLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iRemainRewardLabel", _local_2, _arg_1));
            };
        }

        public function set rGetGiftBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._68714728rGetGiftBtn;
            if (_local_2 !== _arg_1)
            {
                this._68714728rGetGiftBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rGetGiftBtn", _local_2, _arg_1));
            };
        }

        public function set rPayLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1525340606rPayLabel;
            if (_local_2 !== _arg_1)
            {
                this._1525340606rPayLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rPayLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get inviteLabel1():RoundedLabel
        {
            return (this._69226534inviteLabel1);
        }

        [Bindable(event="propertyChange")]
        public function get inviteLabel2():RoundedLabel
        {
            return (this._69226535inviteLabel2);
        }

        public function set inviteReward(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._245317528inviteReward;
            if (_local_2 !== _arg_1)
            {
                this._245317528inviteReward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteReward", _local_2, _arg_1));
            };
        }

        public function set iNumLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1648562839iNumLabel;
            if (_local_2 !== _arg_1)
            {
                this._1648562839iNumLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iNumLabel", _local_2, _arg_1));
            };
        }

        private function _ReturnRewardPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ReturnRewardPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ReturnRewardPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                navBtn0.label = _arg_1;
            }, "navBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                navBtn1.label = _arg_1;
            }, "navBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                deadlineLabel.text = _arg_1;
            }, "deadlineLabel.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                inviteLabel1.text = _arg_1;
            }, "inviteLabel1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                inviteLabel2.text = _arg_1;
            }, "inviteLabel2.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                inviteSubmitBtn.label = _arg_1;
            }, "inviteSubmitBtn.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                inviteInfo.htmlText = _arg_1;
            }, "inviteInfo.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rGetGiftBtn.label = _arg_1;
            }, "rGetGiftBtn.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rPayLabel.text = _arg_1;
            }, "rPayLabel.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rRewardLabel.text = _arg_1;
            }, "rRewardLabel.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rRRewardLabel.text = _arg_1;
            }, "rRRewardLabel.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rGetRewardBtn.label = _arg_1;
            }, "rGetRewardBtn.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                ruleTArea.htmlText = _arg_1;
            }, "ruleTArea.htmlText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iNumLabel.text = _arg_1;
            }, "iNumLabel.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iGetGiftLabel.text = _arg_1;
            }, "iGetGiftLabel.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iRemainGiftLabel.text = _arg_1;
            }, "iRemainGiftLabel.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iGetGiftBtn.label = _arg_1;
            }, "iGetGiftBtn.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iPayLabel.text = _arg_1;
            }, "iPayLabel.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iRewardLabel.text = _arg_1;
            }, "iRewardLabel.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iRemainRewardLabel.text = _arg_1;
            }, "iRemainRewardLabel.text");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iGetRewardBtn.label = _arg_1;
            }, "iGetRewardBtn.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RETURN_REWARD_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                inviteRuleTArea.htmlText = _arg_1;
            }, "inviteRuleTArea.htmlText");
            result[22] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get rRewardLabel():RoundedLabel
        {
            return (this._83865907rRewardLabel);
        }

        public function set inviteSubmitBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1700887067inviteSubmitBtn;
            if (_local_2 !== _arg_1)
            {
                this._1700887067inviteSubmitBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteSubmitBtn", _local_2, _arg_1));
            };
        }

        public function set navBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1729241368navBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1729241368navBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "navBtn1", _local_2, _arg_1));
            };
        }

        public function set iGetGiftBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._938592225iGetGiftBtn;
            if (_local_2 !== _arg_1)
            {
                this._938592225iGetGiftBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iGetGiftBtn", _local_2, _arg_1));
            };
        }

        public function set navBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1729241367navBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1729241367navBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "navBtn0", _local_2, _arg_1));
            };
        }

        public function set inviteLabel1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._69226534inviteLabel1;
            if (_local_2 !== _arg_1)
            {
                this._69226534inviteLabel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteLabel1", _local_2, _arg_1));
            };
        }

        public function set inviteLabel2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._69226535inviteLabel2;
            if (_local_2 !== _arg_1)
            {
                this._69226535inviteLabel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteLabel2", _local_2, _arg_1));
            };
        }

        private function submitInviter(_arg_1:Event):void
        {
            iServerId = inviteServerInput.selectedItem.serverId;
            iName = inviteNameInput.text;
            var _local_2:Core = Core.getInstance();
            _local_2.remote.call("submitInviter", null, iServerId, iName);
        }

        [Bindable(event="propertyChange")]
        public function get inviteInfo():TextArea
        {
            return (this._1197759319inviteInfo);
        }

        [Bindable(event="propertyChange")]
        public function get hrule():HRule
        {
            return (this._99558244hrule);
        }

        public function set iPayLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._612561589iPayLabel;
            if (_local_2 !== _arg_1)
            {
                this._612561589iPayLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iPayLabel", _local_2, _arg_1));
            };
        }

        public function set rRewardLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._83865907rRewardLabel;
            if (_local_2 !== _arg_1)
            {
                this._83865907rRewardLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rRewardLabel", _local_2, _arg_1));
            };
        }

        public function initConfig(_arg_1:Object):void
        {
            var _local_2:Date;
            var _local_3:DateFormatter;
            var _local_4:String;
            var _local_5:Date;
            var _local_6:String;
            var _local_7:Core;
            var _local_8:Object;
            var _local_9:String;
            if (_arg_1)
            {
                _config = _arg_1;
                _local_2 = new Date(_arg_1.end);
                _local_3 = new DateFormatter();
                _local_3.formatString = "YYYY-MM-DD JJ:NN:SS";
                _local_4 = _local_3.format(_local_2);
                deadlineLabel.text = (Language.RETURN_REWARD_PANEL[3] as String).replace("{time}", _local_4);
                _local_5 = new Date(_arg_1.lastLoginTime);
                _local_6 = (Language.RETURN_REWARD_PANEL[8] as String);
                _local_6 = _local_6.replace("{year}", _local_5.getFullYear());
                _local_6 = _local_6.replace("{month}", (_local_5.getMonth() + 1));
                _local_6 = _local_6.replace("{date}", _local_5.getDate());
                _local_6 = _local_6.replace("{perPay}", _arg_1.rPerPay);
                _local_6 = _local_6.replace("{perReward}", _arg_1.rPerReward);
                _local_7 = Core.getInstance();
                _local_8 = _local_7.getTemplateData(GamePredef.TBL_ITEM_TEMPLATE, _arg_1.rItemId);
                if (_local_8)
                {
                    _local_6 = _local_6.replace("{item}", _local_8.name);
                    returnReward.type = GamePredef.TBL_ITEM_TEMPLATE;
                    returnReward.giid = _arg_1.rItemId;
                    returnReward.slotData = _local_8;
                };
                ruleTArea.htmlText = _local_6;
                maxInvite = _arg_1.maxInvite;
                _local_9 = (Language.RETURN_REWARD_PANEL[17] as String);
                _local_9 = _local_9.replace("{max}", maxInvite);
                _local_9 = _local_9.replace("{perPay}", _arg_1.iPerPay);
                _local_9 = _local_9.replace("{perReward}", _arg_1.iPerReward);
                _local_8 = _local_7.getTemplateData(GamePredef.TBL_ITEM_TEMPLATE, _arg_1.iItemId);
                if (_local_8)
                {
                    _local_9 = _local_9.replace("{item}", _local_8.name);
                    inviteReward.type = GamePredef.TBL_ITEM_TEMPLATE;
                    inviteReward.giid = _arg_1.iItemId;
                    inviteReward.slotData = _local_8;
                };
                inviteRuleTArea.htmlText = _local_9;
            };
        }

        private function changeView(_arg_1:Number):void
        {
            viewStack.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 2)
            {
                this[("navBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("navBtn" + _arg_1)].selected = true;
        }

        private function getReturnGift(_arg_1:Event):void
        {
            var _local_2:Core = Core.getInstance();
            if (_arg_1.target == rGetGiftBtn)
            {
                _local_2.remote.call("getReturnGift", null, "returner");
            }
            else
            {
                if (_arg_1.target == iGetGiftBtn)
                {
                    _local_2.remote.call("getReturnGift", null, "inviter");
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get deadlineLabel():RoundedLabel
        {
            return (this._1619367044deadlineLabel);
        }

        [Bindable(event="propertyChange")]
        public function get inviteServerInput():ComboBox
        {
            return (this._1659057022inviteServerInput);
        }

        [Bindable(event="propertyChange")]
        public function get returnReward():ItemSlot
        {
            return (this._785110143returnReward);
        }

        public function __navBtn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        [Bindable(event="propertyChange")]
        public function get ruleTArea():TextArea
        {
            return (this._2103680635ruleTArea);
        }

        [Bindable(event="propertyChange")]
        public function get rGetRewardBtn():BasicGlowButton
        {
            return (this._2065539191rGetRewardBtn);
        }

        public function set rRRewardLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1159981765rRRewardLabel;
            if (_local_2 !== _arg_1)
            {
                this._1159981765rRRewardLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rRRewardLabel", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:ReturnRewardPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ReturnRewardPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ReturnRewardPanelWatcherSetupUtil");
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
        public function get iNumLabel():RoundedLabel
        {
            return (this._1648562839iNumLabel);
        }

        [Bindable(event="propertyChange")]
        public function get inviteReward():ItemSlot
        {
            return (this._245317528inviteReward);
        }

        public function set inviteInfo(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1197759319inviteInfo;
            if (_local_2 !== _arg_1)
            {
                this._1197759319inviteInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iPayLabel():RoundedLabel
        {
            return (this._612561589iPayLabel);
        }

        public function set iRewardLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1077878564iRewardLabel;
            if (_local_2 !== _arg_1)
            {
                this._1077878564iRewardLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iRewardLabel", _local_2, _arg_1));
            };
        }

        public function onSubmitInviter(_arg_1:int):void
        {
            var _local_2:Core;
            if (_arg_1 == 0)
            {
                inviteLabel1.visible = false;
                inviteLabel2.visible = false;
                inviteNameInput.visible = false;
                inviteServerInput.visible = false;
                inviteSubmitBtn.visible = false;
                inviteSubmitBtn.removeEventListener(MouseEvent.CLICK, submitInviter);
                inviteInfo.visible = true;
                inviteInfo.htmlText = (Language.RETURN_REWARD_PANEL[9] as String).replace("{server}", iServerId).replace("{name}", iName);
                rGetGiftBtn.label = Language.RETURN_REWARD_PANEL[4];
                rGetGiftBtn.enabled = true;
                rGetGiftBtn.addEventListener(MouseEvent.CLICK, getReturnGift);
                if (rRemainReward > 0)
                {
                    rGetRewardBtn.enabled = true;
                    rGetRewardBtn.addEventListener(MouseEvent.CLICK, getReturnReward);
                };
            }
            else
            {
                _local_2 = Core.getInstance();
                _local_2.sysMsg(Language.RETURN_REWARD_PANEL[(21 + _arg_1)]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get iRemainRewardLabel():RoundedLabel
        {
            return (this._104320400iRemainRewardLabel);
        }

        public function initWithData(_arg_1:Object):void
        {
        }

        public function __navBtn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        [Bindable(event="propertyChange")]
        public function get rPayLabel():RoundedLabel
        {
            return (this._1525340606rPayLabel);
        }

        public function set viewStack(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1584105757viewStack;
            if (_local_2 !== _arg_1)
            {
                this._1584105757viewStack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewStack", _local_2, _arg_1));
            };
        }

        public function set hrule(_arg_1:HRule):void
        {
            var _local_2:Object = this._99558244hrule;
            if (_local_2 !== _arg_1)
            {
                this._99558244hrule = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hrule", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rRRewardLabel():RoundedLabel
        {
            return (this._1159981765rRRewardLabel);
        }

        public function onGetReturnGift(_arg_1:int, _arg_2:String):void
        {
            if (_arg_1 > 0)
            {
                if (_arg_2 == "returner")
                {
                    rGetGiftBtn.label = Language.RETURN_REWARD_PANEL[19];
                    rGetGiftBtn.enabled = false;
                    rGetGiftBtn.removeEventListener(MouseEvent.CLICK, onGetReturnGift);
                }
                else
                {
                    iGetGiftBtn.enabled = false;
                    iGetGiftBtn.removeEventListener(MouseEvent.CLICK, onGetReturnGift);
                    iRemainGiftLabel.text = (Language.RETURN_REWARD_PANEL[12] as String).replace("{num}", 0);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get iRewardLabel():RoundedLabel
        {
            return (this._1077878564iRewardLabel);
        }

        public function set iRemainGiftLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2089651473iRemainGiftLabel;
            if (_local_2 !== _arg_1)
            {
                this._2089651473iRemainGiftLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iRemainGiftLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get inviteRuleTArea():TextArea
        {
            return (this._751424388inviteRuleTArea);
        }

        [Bindable(event="propertyChange")]
        public function get viewStack():ViewStack
        {
            return (this._1584105757viewStack);
        }

        public function onGetReturnRewardInfo(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:ArrayCollection;
            var _local_4:int;
            var _local_5:Core;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            if (_arg_1.type == "returner")
            {
                if (_arg_1.isReturner)
                {
                    _local_5 = Core.getInstance();
                    if ((((_arg_1.gift == 0) && (_arg_1.iServerId)) && (_local_5.player.level >= 50)))
                    {
                        rGetGiftBtn.label = Language.RETURN_REWARD_PANEL[4];
                        rGetGiftBtn.enabled = true;
                        rGetGiftBtn.addEventListener(MouseEvent.CLICK, getReturnGift);
                    }
                    else
                    {
                        if (_arg_1.gift == 1)
                        {
                            rGetGiftBtn.label = Language.RETURN_REWARD_PANEL[19];
                            rGetGiftBtn.enabled = false;
                        }
                        else
                        {
                            rGetGiftBtn.label = Language.RETURN_REWARD_PANEL[4];
                            rGetGiftBtn.enabled = false;
                        };
                    };
                    rPayLabel.text = (Language.RETURN_REWARD_PANEL[18] as String).replace("{num}", _arg_1.pay);
                    _local_6 = int((int((_arg_1.pay / _config.rPerPay)) * _config.rPerReward));
                    rRewardLabel.text = (Language.RETURN_REWARD_PANEL[15] as String).replace("{num}", _local_6);
                    rRemainReward = (_local_6 - _arg_1.gold);
                    rRRewardLabel.text = (Language.RETURN_REWARD_PANEL[16] as String).replace("{num}", rRemainReward);
                    rPayLabel.visible = true;
                    rRRewardLabel.visible = true;
                    rGetRewardBtn.visible = true;
                    if ((((rRemainReward > 0) && (_arg_1.iServerId)) && (_local_5.player.level >= 50)))
                    {
                        rGetRewardBtn.enabled = true;
                        rGetRewardBtn.addEventListener(MouseEvent.CLICK, getReturnReward);
                    }
                    else
                    {
                        rGetRewardBtn.enabled = false;
                    };
                    if (_arg_1.iServerId)
                    {
                        inviteLabel1.visible = false;
                        inviteLabel2.visible = false;
                        inviteNameInput.visible = false;
                        inviteServerInput.visible = false;
                        inviteSubmitBtn.visible = false;
                        inviteInfo.visible = true;
                        inviteInfo.htmlText = (Language.RETURN_REWARD_PANEL[9] as String).replace("{server}", _arg_1.iServerId).replace("{name}", _arg_1.iName);
                    }
                    else
                    {
                        inviteLabel1.visible = true;
                        inviteLabel2.visible = true;
                        inviteNameInput.visible = true;
                        inviteServerInput.visible = true;
                        inviteSubmitBtn.visible = true;
                        inviteInfo.visible = false;
                        if (_local_5.player.level >= 50)
                        {
                            inviteSubmitBtn.enabled = true;
                            inviteSubmitBtn.addEventListener(MouseEvent.CLICK, submitInviter);
                        }
                        else
                        {
                            inviteSubmitBtn.enabled = false;
                        };
                    };
                }
                else
                {
                    if (_arg_1.isReturner == false)
                    {
                        rPayLabel.visible = false;
                        rRRewardLabel.visible = false;
                        rGetRewardBtn.visible = false;
                        rRewardLabel.text = Language.RETURN_REWARD_PANEL[20];
                        rGetGiftBtn.label = Language.RETURN_REWARD_PANEL[4];
                        rGetGiftBtn.enabled = false;
                        inviteLabel1.visible = true;
                        inviteLabel2.visible = true;
                        inviteNameInput.visible = true;
                        inviteServerInput.visible = true;
                        inviteSubmitBtn.visible = true;
                        inviteInfo.visible = false;
                        inviteSubmitBtn.enabled = false;
                    };
                };
                _local_2 = _arg_1.serverList.length;
                _local_3 = new ArrayCollection();
                _local_4 = 0;
                while (_local_4 < _local_2)
                {
                    _local_7 = _arg_1.serverList[_local_4];
                    _local_3.addItem({
                        "label":(_local_7 + Language.RETURN_REWARD_PANEL[21]),
                        "serverId":_local_7
                    });
                    _local_4++;
                };
                inviteServerInput.dataProvider = _local_3;
            }
            else
            {
                if (_arg_1.type == "inviter")
                {
                    iNumLabel.text = (Language.RETURN_REWARD_PANEL[10] as String).replace("{num}", _arg_1.num).replace("{max}", maxInvite);
                    iGetGiftLabel.text = (Language.RETURN_REWARD_PANEL[11] as String).replace("{num}", _arg_1.num);
                    iRemainGiftLabel.text = (Language.RETURN_REWARD_PANEL[12] as String).replace("{num}", (_arg_1.num - _arg_1.gift));
                    if ((_arg_1.num - _arg_1.gift) > 0)
                    {
                        iGetGiftBtn.enabled = true;
                        iGetGiftBtn.addEventListener(MouseEvent.CLICK, getReturnGift);
                    }
                    else
                    {
                        iGetGiftBtn.enabled = false;
                    };
                    iPayLabel.text = (Language.RETURN_REWARD_PANEL[14] as String).replace("{num}", _arg_1.pay);
                    _local_8 = int((int((_arg_1.pay / _config.iPerPay)) * _config.iPerReward));
                    iRewardLabel.text = (Language.RETURN_REWARD_PANEL[15] as String).replace("{num}", _local_8);
                    iRemainRewardLabel.text = (Language.RETURN_REWARD_PANEL[16] as String).replace("{num}", (_local_8 - _arg_1.gold));
                    if ((_local_8 - _arg_1.gold) > 0)
                    {
                        iGetRewardBtn.enabled = true;
                        iGetRewardBtn.addEventListener(MouseEvent.CLICK, getReturnReward);
                    }
                    else
                    {
                        iGetRewardBtn.enabled = false;
                    };
                };
            };
        }

        public function set iGetGiftLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._35335177iGetGiftLabel;
            if (_local_2 !== _arg_1)
            {
                this._35335177iGetGiftLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iGetGiftLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iRemainGiftLabel():RoundedLabel
        {
            return (this._2089651473iRemainGiftLabel);
        }

        private function getReturnReward(_arg_1:Event):void
        {
            var _local_2:Core = Core.getInstance();
            if (_arg_1.target == rGetRewardBtn)
            {
                _local_2.remote.call("getReturnReward", null, "returner");
            }
            else
            {
                if (_arg_1.target == iGetRewardBtn)
                {
                    _local_2.remote.call("getReturnReward", null, "inviter");
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get iGetGiftLabel():RoundedLabel
        {
            return (this._35335177iGetGiftLabel);
        }

        public function set deadlineLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1619367044deadlineLabel;
            if (_local_2 !== _arg_1)
            {
                this._1619367044deadlineLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deadlineLabel", _local_2, _arg_1));
            };
        }

        public function set inviteNameInput(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1729325322inviteNameInput;
            if (_local_2 !== _arg_1)
            {
                this._1729325322inviteNameInput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteNameInput", _local_2, _arg_1));
            };
        }

        public function set inviteServerInput(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._1659057022inviteServerInput;
            if (_local_2 !== _arg_1)
            {
                this._1659057022inviteServerInput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteServerInput", _local_2, _arg_1));
            };
        }

        override public function show():void
        {
            super.show();
            var _local_1:Core = Core.getInstance();
            _local_1.remote.call("getReturnRewardInfo", null);
        }

        public function set returnReward(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._785110143returnReward;
            if (_local_2 !== _arg_1)
            {
                this._785110143returnReward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "returnReward", _local_2, _arg_1));
            };
        }

        public function set inviteRuleTArea(_arg_1:TextArea):void
        {
            var _local_2:Object = this._751424388inviteRuleTArea;
            if (_local_2 !== _arg_1)
            {
                this._751424388inviteRuleTArea = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteRuleTArea", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

