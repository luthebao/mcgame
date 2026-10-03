// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GuildContribPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.ItemSlotMaterial;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import mx.events.DragEvent;
    import flash.events.MouseEvent;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.event.GameDataEvent;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import flash.net.Responder;
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

    public class GuildContribPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1584105757viewStack:ViewStack;
        private var SPE_MATERIAL:* = 2039;
        private var _616657662contribMaterialSlot:ItemSlotMaterial;
        private var _114843tip:Label;
        public var _GuildContribPanel_BasicTxtButton3:BasicTxtButton;
        private var _1456922671rlb_Contrib3:RoundedLabel;
        public var _GuildContribPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1456922673rlb_Contrib1:RoundedLabel;
        private var RARE_MATERIAL:* = 1;
        private var _1732852661materialBtn:BasicGlowButton;
        private var _526049965goldNumText:TextInput;
        public var _GuildContribPanel_BasicGlowButton2:BasicGlowButton;
        private var _1682497030silverNumText:TextInput;
        private var _631549699contribBtn:BasicGlowButton;
        private var _1286465560itxt_money:IntroText;
        private var UNKNOWN_MATERIAL:* = 10000;
        private var _1456922672rlb_Contrib2:RoundedLabel;
        private var _1456922670rlb_Contrib4:RoundedLabel;
        private var _332386948moneyBtn:BasicGlowButton;
        private var _280939890materialContrib:BoxLabel;
        private var _470795009itxt_material:IntroText;
        private var COMMON_MATERIAL:* = 2;
        public var _GuildContribPanel_BasicTxtButton1:BasicTxtButton;
        public var _GuildContribPanel_BasicTxtButton2:BasicTxtButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":400,
                    "height":321.4,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GuildContribPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"viewStack",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "60";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"moneyTab",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"itxt_money",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":78});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"silverNumText",
                                                "events":{"change":"__silverNumText_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":85,
                                                        "y":112,
                                                        "width":85,
                                                        "height":19,
                                                        "restrict":"[0-9]",
                                                        "maxChars":14
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"goldNumText",
                                                "events":{"change":"__goldNumText_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":228,
                                                        "y":112,
                                                        "width":85,
                                                        "height":19,
                                                        "restrict":"[0-9]",
                                                        "maxChars":14
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_GuildContribPanel_BasicTxtButton1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":39,
                                                        "y":112,
                                                        "width":40,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_GuildContribPanel_BasicTxtButton2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":180,
                                                        "y":112,
                                                        "width":40,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rlb_Contrib1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":39,
                                                        "y":149,
                                                        "width":274
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rlb_Contrib2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":39,
                                                        "y":175,
                                                        "width":274
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
                                            "label":"materialTab",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_GuildContribPanel_BasicTxtButton3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":222,
                                                        "y":120,
                                                        "height":20,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"materialContrib",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":160,
                                                        "y":120,
                                                        "width":61,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotMaterial,
                                                "id":"contribMaterialSlot",
                                                "events":{"dragDrop":"__contribMaterialSlot_dragDrop"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":118,
                                                        "y":113,
                                                        "haveRequireSlot":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"tip",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16468278;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":118,
                                                        "y":92,
                                                        "width":160,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"itxt_material",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":78});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rlb_Contrib3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":162});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rlb_Contrib4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":180.5});
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"contribBtn",
                        "events":{"click":"__contribBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "30";
                            this.horizontalCenter = "-35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "width":45
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GuildContribPanel_BasicGlowButton2",
                        "events":{"click":"___GuildContribPanel_BasicGlowButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "30";
                            this.horizontalCenter = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "width":45
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
                                    "id":"moneyBtn",
                                    "events":{"click":"__moneyBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"materialBtn",
                                    "events":{"click":"__materialBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GuildContribPanel()
        {
            mx_internal::_document = this;
            this.width = 400;
            this.height = 321.4;
            this.styleName = "StandardContent";
            this.x = 60;
            this.y = 60;
            this.addEventListener("creationComplete", ___GuildContribPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuildContribPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get contribBtn():BasicGlowButton
        {
            return (this._631549699contribBtn);
        }

        public function set contribBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._631549699contribBtn;
            if (_local_2 !== _arg_1)
            {
                this._631549699contribBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contribBtn", _local_2, _arg_1));
            };
        }

        public function set silverNumText(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1682497030silverNumText;
            if (_local_2 !== _arg_1)
            {
                this._1682497030silverNumText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "silverNumText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get contribMaterialSlot():ItemSlotMaterial
        {
            return (this._616657662contribMaterialSlot);
        }

        public function __goldNumText_change(_arg_1:Event):void
        {
            onContribution();
        }

        private function silverToGuildMoney(_arg_1:Number):Number
        {
            if (isNaN(_arg_1))
            {
                return (0);
            };
            return (_arg_1);
        }

        public function init():void
        {
            itxt_money.content.verticalScrollPolicy = "off";
            itxt_material.content.verticalScrollPolicy = "off";
        }

        public function set contribMaterialSlot(_arg_1:ItemSlotMaterial):void
        {
            var _local_2:Object = this._616657662contribMaterialSlot;
            if (_local_2 !== _arg_1)
            {
                this._616657662contribMaterialSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contribMaterialSlot", _local_2, _arg_1));
            };
        }

        public function set itxt_material(_arg_1:IntroText):void
        {
            var _local_2:Object = this._470795009itxt_material;
            if (_local_2 !== _arg_1)
            {
                this._470795009itxt_material = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itxt_material", _local_2, _arg_1));
            };
        }

        private function contribMReturn(_arg_1:Object):void
        {
            var _local_2:Number = Number(_arg_1);
            if (_local_2 != 0)
            {
                contribMaterialSlot.update();
            };
        }

        [Bindable(event="propertyChange")]
        public function get silverNumText():TextInput
        {
            return (this._1682497030silverNumText);
        }

        private function _GuildContribPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildContribPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GuildContribPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                itxt_money.text = _arg_1;
            }, "itxt_money.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildContribPanel_BasicTxtButton1.label = _arg_1;
            }, "_GuildContribPanel_BasicTxtButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildContribPanel_BasicTxtButton2.label = _arg_1;
            }, "_GuildContribPanel_BasicTxtButton2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[17].toString().replace("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rlb_Contrib1.text = _arg_1;
            }, "rlb_Contrib1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[18].toString().replace("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rlb_Contrib2.text = _arg_1;
            }, "rlb_Contrib2.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildContribPanel_BasicTxtButton3.label = _arg_1;
            }, "_GuildContribPanel_BasicTxtButton3.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[62];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                itxt_material.text = _arg_1;
            }, "itxt_material.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[17].toString().replace("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rlb_Contrib3.text = _arg_1;
            }, "rlb_Contrib3.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[19].toString().replace("{item}", Language.GUILDCONTRIBPANEL_U[10]).replace("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rlb_Contrib4.text = _arg_1;
            }, "rlb_Contrib4.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                contribBtn.label = _arg_1;
            }, "contribBtn.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildContribPanel_BasicGlowButton2.label = _arg_1;
            }, "_GuildContribPanel_BasicGlowButton2.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                moneyBtn.label = _arg_1;
            }, "moneyBtn.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDCONTRIBPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                materialBtn.label = _arg_1;
            }, "materialBtn.label");
            result[13] = binding;
            return (result);
        }

        public function ___GuildContribPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set tip(_arg_1:Label):void
        {
            var _local_2:Object = this._114843tip;
            if (_local_2 !== _arg_1)
            {
                this._114843tip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tip", _local_2, _arg_1));
            };
        }

        public function __contribMaterialSlot_dragDrop(_arg_1:DragEvent):void
        {
            dragDropHandler(_arg_1);
        }

        private function selectBtnClicked(_arg_1:Event):void
        {
            if (_arg_1.target == moneyBtn)
            {
                viewStack.selectedIndex = 0;
                materialBtn.selected = false;
                moneyBtn.selected = true;
                contribBtn.enabled = true;
            }
            else
            {
                if (_arg_1.target == materialBtn)
                {
                    viewStack.selectedIndex = 1;
                    materialBtn.selected = true;
                    moneyBtn.selected = false;
                    contribBtn.enabled = false;
                }
                else
                {
                    return;
                };
            };
        }

        public function __contribBtn_click(_arg_1:MouseEvent):void
        {
            contribute();
        }

        public function reset():void
        {
            contribMaterialSlot.clean();
            materialContrib.text = "";
            silverNumText.text = "";
            goldNumText.text = "";
        }

        private function contributeMoney():void
        {
            var sNum:Number;
            var gNum:Number;
            var gfunc:Function;
            if (!_core.delPass)
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                return;
            };
            var silver:String = silverNumText.text;
            var gold:String = goldNumText.text;
            sNum = Number(trimFrontZero(silver));
            gNum = Number(trimFrontZero(gold));
            if (((sNum <= 0) && (gNum <= 0)))
            {
                return;
            };
            if ((sNum % 1000) != 0)
            {
                Alert.show(Language.GUILDCONTRIBPANEL_U[0], "");
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (((!(_arg_1 == null)) && (_arg_1.detail == Alert.OK)))
                {
                    Core.getInstance().remote.contribMoney({
                        "g":gNum,
                        "s":sNum
                    });
                };
                reset();
            };
            if (_core.player.gold < gNum)
            {
                Alert.show(Language.GUILDCONTRIBPANEL_U[1], "", Alert.OK);
            }
            else
            {
                if (_core.player.money < sNum)
                {
                    Alert.show(Language.GUILDCONTRIBPANEL_U[2], "", Alert.OK);
                }
                else
                {
                    Alert.show(Language.GUILDCONTRIBPANEL_U[3], "", (Alert.OK | Alert.NO), null, func);
                };
            };
        }

        private function setItemNumHandler(_arg_1:Number):*
        {
            contribMaterialSlot.stackNum = _arg_1;
            materialContrib.text = _arg_1.toString();
            contribBtn.enabled = true;
            onContribMaterialTab(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get goldNumText():TextInput
        {
            return (this._526049965goldNumText);
        }

        public function ___GuildContribPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        private function dataLoaded(_arg_1:GameDataEvent):void
        {
            var _local_4:NumPanel;
            _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.index), dataLoaded);
            var _local_2:Object = Core.getInstance().data.getGameData(_arg_1.data.type, _arg_1.data.index);
            var _local_3:Number = Number(_local_2.color);
            if (_local_3 < 2)
            {
                contribMaterialSlot.clean();
                tip.text = Language.GUILDCONTRIBPANEL_U[7];
            }
            else
            {
                tip.text = "";
                _local_4 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                _local_4.showSelected(contribMaterialSlot, null, NumPanel.TYPE_BUY, setItemNumHandler, cancelHandler);
                _local_4.closeWith(this);
            };
        }

        private function createPanel():void
        {
            moneyBtn.selected = true;
            materialBtn.selected = false;
            viewStack.selectedIndex = 0;
        }

        public function set materialBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1732852661materialBtn;
            if (_local_2 !== _arg_1)
            {
                this._1732852661materialBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "materialBtn", _local_2, _arg_1));
            };
        }

        private function contribute():void
        {
            if (viewStack.selectedIndex == 0)
            {
                contributeMoney();
            }
            else
            {
                contributeMaterial();
            };
        }

        private function trimFrontZero(_arg_1:String):String
        {
            var _local_2:* = 0;
            while (_local_2 < _arg_1.length)
            {
                if (_arg_1.charAt(_local_2) != "0")
                {
                    return (_arg_1.substr(_local_2));
                };
                _local_2++;
            };
            return ("");
        }

        private function cancelHandler():void
        {
            contribMaterialSlot.clean();
            materialContrib.text = "";
        }

        [Bindable(event="propertyChange")]
        public function get materialContrib():BoxLabel
        {
            return (this._280939890materialContrib);
        }

        private function getMaterialType(_arg_1:*):*
        {
            switch (Number(_arg_1))
            {
                case 16:
                case 7:
                case 18:
                case 22:
                case 25:
                case 27:
                    return (COMMON_MATERIAL);
                case 24:
                case 21:
                case 23:
                case 26:
                case 28:
                    return (RARE_MATERIAL);
                case 2039:
                    return (SPE_MATERIAL);
                default:
                    return (UNKNOWN_MATERIAL);
            };
        }

        [Bindable(event="propertyChange")]
        public function get moneyBtn():BasicGlowButton
        {
            return (this._332386948moneyBtn);
        }

        private function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:ItemSlot;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:Number;
            var _local_8:NumPanel;
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as ItemSlot);
                if (_local_2 == contribMaterialSlot)
                {
                    return;
                };
                _local_3 = _core.getTemplateData(_local_2.type, _local_2.giid);
                if (!_local_3)
                {
                    return;
                };
                if (!((ToolKit.isEqual(_local_3.kind, GamePredef.ITEM_KIND_MATERIAL)) || (ToolKit.isEqual(_local_3.id, 2039))))
                {
                    tip.text = Language.GUILDCONTRIBPANEL_U[8];
                    return;
                };
                _local_4 = _local_2.type;
                _local_5 = _local_2.slotData.itemId;
                if (_core.data.hasData(_local_4, _local_5))
                {
                    _local_6 = _core.data.getGameData(_local_4, _local_5);
                    _local_7 = Number(_local_6.color);
                    if (((_local_7 < 2) && (!(ToolKit.isEqual(_local_3.id, 2039)))))
                    {
                        contribMaterialSlot.clean();
                        tip.text = Language.GUILDCONTRIBPANEL_U[7];
                    }
                    else
                    {
                        tip.text = "";
                        _local_8 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                        _local_8.showSelected(_local_2, null, NumPanel.TYPE_BUY, setItemNumHandler, cancelHandler);
                        _local_8.closeWith(this);
                    };
                }
                else
                {
                    _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _local_4) + "_") + _local_5), dataLoaded);
                    _core.data.getGameData(_local_4, _local_5);
                };
            };
        }

        private function onContribution():void
        {
            var _local_1:Number = (silverToContribution(parseInt(silverNumText.text)) + goldToContribution(parseInt(goldNumText.text)));
            rlb_Contrib1.text = Language.GUILDCONTRIBPANEL_U[17].toString().replace("{num}", Math.floor(_local_1));
            var _local_2:Number = (silverToGuildMoney(parseInt(silverNumText.text)) + goldToGuildMoney(parseInt(goldNumText.text)));
            rlb_Contrib2.text = Language.GUILDCONTRIBPANEL_U[18].toString().replace("{num}", Math.floor(_local_2));
        }

        override public function initialize():void
        {
            var target:GuildContribPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuildContribPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GuildContribPanelWatcherSetupUtil");
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

        private function silverToContribution(_arg_1:Number):Number
        {
            if (isNaN(_arg_1))
            {
                return (0);
            };
            return (_arg_1 / 8);
        }

        [Bindable(event="propertyChange")]
        public function get tip():Label
        {
            return (this._114843tip);
        }

        public function __materialBtn_click(_arg_1:MouseEvent):void
        {
            selectBtnClicked(_arg_1);
        }

        public function set rlb_Contrib2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1456922672rlb_Contrib2;
            if (_local_2 !== _arg_1)
            {
                this._1456922672rlb_Contrib2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rlb_Contrib2", _local_2, _arg_1));
            };
        }

        public function set rlb_Contrib3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1456922671rlb_Contrib3;
            if (_local_2 !== _arg_1)
            {
                this._1456922671rlb_Contrib3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rlb_Contrib3", _local_2, _arg_1));
            };
        }

        public function set rlb_Contrib4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1456922670rlb_Contrib4;
            if (_local_2 !== _arg_1)
            {
                this._1456922670rlb_Contrib4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rlb_Contrib4", _local_2, _arg_1));
            };
        }

        public function set rlb_Contrib1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1456922673rlb_Contrib1;
            if (_local_2 !== _arg_1)
            {
                this._1456922673rlb_Contrib1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rlb_Contrib1", _local_2, _arg_1));
            };
        }

        public function set goldNumText(_arg_1:TextInput):void
        {
            var _local_2:Object = this._526049965goldNumText;
            if (_local_2 !== _arg_1)
            {
                this._526049965goldNumText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldNumText", _local_2, _arg_1));
            };
        }

        private function contributeMaterial():void
        {
            var mNum:Number;
            if (contribMaterialSlot.slotData == null)
            {
                return;
            };
            mNum = contribMaterialSlot.stackNum;
            if ((((contribMaterialSlot.slotData == null) || (mNum <= 0)) || (mNum > contribMaterialSlot.slotData.stackNum)))
            {
                Alert.show(Language.GUILDCONTRIBPANEL_U[4], "", Alert.OK);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    Core.getInstance().remote.call("contribMaterial", new Responder(contribMReturn), {
                        "num":mNum,
                        "slotId":Number(contribMaterialSlot.slotData.id)
                    });
                    reset();
                    contribBtn.enabled = false;
                };
            };
            Alert.show(Language.GUILDCONTRIBPANEL_U[5], "", (Alert.YES | Alert.NO), this, func);
        }

        [Bindable(event="propertyChange")]
        public function get materialBtn():BasicGlowButton
        {
            return (this._1732852661materialBtn);
        }

        private function goldToContribution(_arg_1:Number):Number
        {
            if (isNaN(_arg_1))
            {
                return (0);
            };
            return ((_arg_1 * 2000) / 8);
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

        [Bindable(event="propertyChange")]
        public function get rlb_Contrib1():RoundedLabel
        {
            return (this._1456922673rlb_Contrib1);
        }

        public function set itxt_money(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1286465560itxt_money;
            if (_local_2 !== _arg_1)
            {
                this._1286465560itxt_money = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itxt_money", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rlb_Contrib3():RoundedLabel
        {
            return (this._1456922671rlb_Contrib3);
        }

        [Bindable(event="propertyChange")]
        public function get rlb_Contrib4():RoundedLabel
        {
            return (this._1456922670rlb_Contrib4);
        }

        private function onContribMaterialTab(_arg_1:Number):void
        {
            var _local_2:Number = contribMaterialSlot.slotData.itemId;
            var _local_3:int = contribMaterialSlot.type;
            var _local_4:int = contribMaterialSlot.slotData.tid;
            var _local_5:Object = _core.data.getGameData(_local_3, _local_2);
            var _local_6:Number = Number(_local_5.color);
            var _local_7:Object = new Object();
            _local_7.type = getMaterialType(_local_4);
            _local_7.num = Math.floor(((_arg_1 * Math.pow(_local_6, 5)) / 8));
            if (_local_7.type == COMMON_MATERIAL)
            {
                _local_7.contrib = Math.floor((((_arg_1 * Math.pow(_local_6, 5)) * 50) / 8));
                _local_7.materialName = Language.GUILDBUILDPROCESS_U[3];
            }
            else
            {
                if (_local_7.type == RARE_MATERIAL)
                {
                    _local_7.contrib = Math.floor((((_arg_1 * Math.pow(_local_6, 5)) * 100) / 8));
                    _local_7.materialName = Language.GUILDBUILDPROCESS_U[4];
                }
                else
                {
                    if (_local_7.type == SPE_MATERIAL)
                    {
                        _local_7.contrib = (_arg_1 * 100);
                        _local_7.materialName = Language.GUILDBUILDPROCESS_U[5];
                        _local_7.num = _arg_1;
                    }
                    else
                    {
                        _local_7 = null;
                    };
                };
            };
            rlb_Contrib3.text = Language.GUILDCONTRIBPANEL_U[17].toString().replace("{num}", Math.floor(_local_7.contrib));
            rlb_Contrib4.text = Language.GUILDCONTRIBPANEL_U[19].toString().replace("{item}", _local_7.materialName).replace("{num}", _local_7.num);
        }

        [Bindable(event="propertyChange")]
        public function get rlb_Contrib2():RoundedLabel
        {
            return (this._1456922672rlb_Contrib2);
        }

        [Bindable(event="propertyChange")]
        public function get viewStack():ViewStack
        {
            return (this._1584105757viewStack);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                reset();
            };
            super.visible = _arg_1;
        }

        public function __moneyBtn_click(_arg_1:MouseEvent):void
        {
            selectBtnClicked(_arg_1);
        }

        public function __silverNumText_change(_arg_1:Event):void
        {
            onContribution();
        }

        private function goldToGuildMoney(_arg_1:Number):Number
        {
            if (isNaN(_arg_1))
            {
                return (0);
            };
            return (_arg_1 * 2000);
        }

        public function set materialContrib(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._280939890materialContrib;
            if (_local_2 !== _arg_1)
            {
                this._280939890materialContrib = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "materialContrib", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itxt_money():IntroText
        {
            return (this._1286465560itxt_money);
        }

        public function set moneyBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._332386948moneyBtn;
            if (_local_2 !== _arg_1)
            {
                this._332386948moneyBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyBtn", _local_2, _arg_1));
            };
        }

        private function _GuildContribPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GUILDPANEL_U[13];
            _local_1 = Language.GUILDPANEL_S[61];
            _local_1 = Language.GUILDCONTRIBPANEL_U[11];
            _local_1 = Language.GUILDCONTRIBPANEL_U[13];
            _local_1 = Language.GUILDCONTRIBPANEL_U[17].toString().replace("{num}", 0);
            _local_1 = Language.GUILDCONTRIBPANEL_U[18].toString().replace("{num}", 0);
            _local_1 = Language.GUILDCONTRIBPANEL_U[14];
            _local_1 = Language.GUILDPANEL_S[62];
            _local_1 = Language.GUILDCONTRIBPANEL_U[17].toString().replace("{num}", 0);
            _local_1 = Language.GUILDCONTRIBPANEL_U[19].toString().replace("{item}", Language.GUILDCONTRIBPANEL_U[10]).replace("{num}", 0);
            _local_1 = Language.GUILDCONTRIBPANEL_U[15];
            _local_1 = Language.GUILDCONTRIBPANEL_U[16];
            _local_1 = Language.GUILDCONTRIBPANEL_U[9];
            _local_1 = Language.GUILDCONTRIBPANEL_U[10];
        }

        [Bindable(event="propertyChange")]
        public function get itxt_material():IntroText
        {
            return (this._470795009itxt_material);
        }


    }
}//package com.qeedoo.ui.view.compDragable

