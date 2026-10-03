// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MCZDPetFightConf

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.MCZDPetConfigCanvas;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.containers.Tile;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.Slot;
    import flash.utils.setTimeout;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
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

    public class MCZDPetFightConf extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3437300pet3:ItemSlot;
        private var _3437302pet5:ItemSlot;
        private var _petList:Object;
        public var _MCZDPetFightConf_IntroText1:IntroText;
        private var _106940444psPet:PageSelector;
        private var _2106582911_petArenaHasTicket:Boolean = false;
        private var _110851pf9:MCZDPetConfigCanvas;
        private var _1845684364loadWarn:Label;
        private var _110848pf6:MCZDPetConfigCanvas;
        private var _3437298pet1:ItemSlot;
        public var _MCZDPetFightConf_RoundedLabel2:RoundedLabel;
        public var _MCZDPetFightConf_RoundedLabel3:RoundedLabel;
        public var _MCZDPetFightConf_RoundedLabel4:RoundedLabel;
        public var _MCZDPetFightConf_RoundedLabel5:RoundedLabel;
        public var _MCZDPetFightConf_RoundedLabel1:RoundedLabel;
        private var _3437301pet4:ItemSlot;
        private var _105765600okBtn:BasicDelayButton;
        private var _3437303pet6:ItemSlot;
        private var _1007683640pTitle:BasicTitleCanvas;
        private var _110849pf7:MCZDPetConfigCanvas;
        public var _MCZDPetFightConf_Label1:Label;
        public var _MCZDPetFightConf_Label2:Label;
        public var _MCZDPetFightConf_BasicTxtButton1:BasicTxtButton;
        public var _petArenaData:*;
        private var _110850pf8:MCZDPetConfigCanvas;
        private var _3437299pet2:ItemSlot;
        private var _dataForServer:Object;
        private var _110847pf5:MCZDPetConfigCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":530,
                    "height":350,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"pTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":40,
                                "width":160,
                                "height":144,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_MCZDPetFightConf_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":5});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":35,
                                            "width":125,
                                            "height":80,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"psPet",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":120
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
                                "x":4,
                                "y":192,
                                "width":161,
                                "height":148,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_MCZDPetFightConf_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":5});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_MCZDPetFightConf_BasicTxtButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":62,
                                            "width":146,
                                            "height":73,
                                            "enabled":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"_MCZDPetFightConf_IntroText1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":170,
                                "y":40,
                                "width":350,
                                "height":120
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":170,
                                "y":170,
                                "width":350,
                                "height":170,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDPetFightConf_RoundedLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "16";
                                        this.top = "30";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":94});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDPetFightConf_RoundedLabel2",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "83";
                                        this.top = "30";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":94});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDPetFightConf_RoundedLabel3",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "151";
                                        this.top = "30";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":94});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDPetFightConf_RoundedLabel4",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "220";
                                        this.top = "30";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":94});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDPetFightConf_RoundedLabel5",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "288";
                                        this.top = "30";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":94});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":50,
                                            "width":340,
                                            "height":65,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":MCZDPetConfigCanvas,
                                                "id":"pf5"
                                            }), new UIComponentDescriptor({
                                                "type":MCZDPetConfigCanvas,
                                                "id":"pf6"
                                            }), new UIComponentDescriptor({
                                                "type":MCZDPetConfigCanvas,
                                                "id":"pf7"
                                            }), new UIComponentDescriptor({
                                                "type":MCZDPetConfigCanvas,
                                                "id":"pf8"
                                            }), new UIComponentDescriptor({
                                                "type":MCZDPetConfigCanvas,
                                                "id":"pf9"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"okBtn",
                                    "events":{"click":"__okBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":145,
                                            "clickDelay":5000,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"loadWarn",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "x":5,
                                            "y":50,
                                            "width":340,
                                            "height":160
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
        private var _confDataList:Object = {};
        private var _defaultCmd:Object = {
            "action":GamePredef.BATTLE_ACTION_ATTACK,
            "level":-1,
            "id":-1
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MCZDPetFightConf()
        {
            mx_internal::_document = this;
            this.width = 530;
            this.height = 350;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___MCZDPetFightConf_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MCZDPetFightConf._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get pf6():MCZDPetConfigCanvas
        {
            return (this._110848pf6);
        }

        [Bindable(event="propertyChange")]
        public function get pf7():MCZDPetConfigCanvas
        {
            return (this._110849pf7);
        }

        public function set pf7(_arg_1:MCZDPetConfigCanvas):void
        {
            var _local_2:Object = this._110849pf7;
            if (_local_2 !== _arg_1)
            {
                this._110849pf7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet4():ItemSlot
        {
            return (this._3437301pet4);
        }

        private function set _petArenaHasTicket(_arg_1:Boolean):void
        {
            var _local_2:Object = this._2106582911_petArenaHasTicket;
            if (_local_2 !== _arg_1)
            {
                this._2106582911_petArenaHasTicket = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_petArenaHasTicket", _local_2, _arg_1));
            };
        }

        public function onUpdataMCZDConf(_arg_1:Object):void
        {
            if (!_arg_1.f)
            {
                if (_arg_1.r == "onlyOnce")
                {
                    Alert.show(Language.MCZDPETFIGHT_PANEL_U[52]);
                    _core.remote.call("getMCZDConf", null);
                };
                if (_arg_1.r == "time")
                {
                    Alert.show(Language.MCZDPETFIGHT_PANEL_U[65]);
                };
            }
            else
            {
                Alert.show(Language.MCZDPETFIGHT_PANEL_U[53]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get pf8():MCZDPetConfigCanvas
        {
            return (this._110850pf8);
        }

        public function set pf8(_arg_1:MCZDPetConfigCanvas):void
        {
            var _local_2:Object = this._110850pf8;
            if (_local_2 !== _arg_1)
            {
                this._110850pf8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf8", _local_2, _arg_1));
            };
        }

        public function set pf9(_arg_1:MCZDPetConfigCanvas):void
        {
            var _local_2:Object = this._110851pf9;
            if (_local_2 !== _arg_1)
            {
                this._110851pf9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf9", _local_2, _arg_1));
            };
        }

        public function set pf6(_arg_1:MCZDPetConfigCanvas):void
        {
            var _local_2:Object = this._110848pf6;
            if (_local_2 !== _arg_1)
            {
                this._110848pf6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf6", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            initPetView();
            this.petCrossConf = {"t":_petArenaHasTicket};
        }

        public function set loadWarn(_arg_1:Label):void
        {
            var _local_2:Object = this._1845684364loadWarn;
            if (_local_2 !== _arg_1)
            {
                this._1845684364loadWarn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loadWarn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pf9():MCZDPetConfigCanvas
        {
            return (this._110851pf9);
        }

        [Bindable(event="propertyChange")]
        public function get psPet():PageSelector
        {
            return (this._106940444psPet);
        }

        private function initPetView():void
        {
            var _local_2:*;
            var _local_3:Object;
            _petList = _core.player.petList;
            var _local_1:Array = [];
            if (_petList)
            {
                for each (_local_2 in _petList)
                {
                    if (_local_2)
                    {
                        _local_3 = _core.data.gameData[GamePredef.TBL_CREATURE][_local_2.tid];
                        if ((((_local_3) && (_local_2.binded == 1)) && (_core.player.level >= _local_3.useLv)))
                        {
                            _local_1.push(_local_2);
                        };
                    };
                };
            };
            _local_1.sortOn(["exp", "growRate"], [(Array.DESCENDING | Array.NUMERIC), (Array.DESCENDING | Array.NUMERIC)]);
            _petList = _local_1;
            psPet.onPageChanged = onPsPageChanged;
            psPet.onPageCleared = onPsPageClear;
            psPet.initPageSeletor(_petList.length, 6);
        }

        public function set psPet(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._106940444psPet;
            if (_local_2 !== _arg_1)
            {
                this._106940444psPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "psPet", _local_2, _arg_1));
            };
        }

        public function clearCacheConfData(_arg_1:Number):void
        {
            if (_confDataList[_arg_1])
            {
                delete _confDataList[_arg_1];
            };
        }

        private function _MCZDPetFightConf_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pTitle.text = _arg_1;
            }, "pTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDPetFightConf_Label1.text = _arg_1;
            }, "_MCZDPetFightConf_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet1.slotType = _arg_1;
            }, "pet1.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet2.slotType = _arg_1;
            }, "pet2.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet3.slotType = _arg_1;
            }, "pet3.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet4.slotType = _arg_1;
            }, "pet4.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet5.slotType = _arg_1;
            }, "pet5.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet6.slotType = _arg_1;
            }, "pet6.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDPetFightConf_Label2.text = _arg_1;
            }, "_MCZDPetFightConf_Label2.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDPetFightConf_BasicTxtButton1.text = _arg_1;
            }, "_MCZDPetFightConf_BasicTxtButton1.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[70];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDPetFightConf_IntroText1.htmlText = _arg_1;
            }, "_MCZDPetFightConf_IntroText1.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDPetFightConf_RoundedLabel1.text = _arg_1;
            }, "_MCZDPetFightConf_RoundedLabel1.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDPetFightConf_RoundedLabel2.text = _arg_1;
            }, "_MCZDPetFightConf_RoundedLabel2.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDPetFightConf_RoundedLabel3.text = _arg_1;
            }, "_MCZDPetFightConf_RoundedLabel3.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDPetFightConf_RoundedLabel4.text = _arg_1;
            }, "_MCZDPetFightConf_RoundedLabel4.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDPetFightConf_RoundedLabel5.text = _arg_1;
            }, "_MCZDPetFightConf_RoundedLabel5.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                okBtn.label = _arg_1;
            }, "okBtn.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                loadWarn.text = _arg_1;
            }, "loadWarn.text");
            result[17] = binding;
            return (result);
        }

        private function _MCZDPetFightConf_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[0];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[29];
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[28];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[27];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[70];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[44];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[45];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[46];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[47];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[48];
            _local_1 = Language.PET_ARENA_U[41];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[14];
        }

        public function reset():void
        {
            _petArenaData = undefined;
            var _local_1:int = 5;
            while (_local_1 < 10)
            {
                this[("pf" + _local_1)].cleanView();
                _local_1++;
            };
        }

        public function set petCrossConf(_arg_1:Object):void
        {
            if (!initialized)
            {
                return;
            };
            if (_petArenaData == undefined)
            {
                loadWarn.visible = true;
                _core.remote.call("getMCZDConf", null);
                setTimeout(removeLoadWarnLabel, 3000);
            }
            else
            {
                onGetMCZDConf(_petArenaData);
            };
        }

        public function onGetMCZDConf(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Array;
            var _local_7:Object;
            loadWarn.visible = false;
            _petArenaData = _arg_1;
            var _local_2:int = 5;
            while (_local_2 < 10)
            {
                this[("pf" + _local_2)].cleanView();
                _local_2++;
            };
            if (_arg_1)
            {
                _local_3 = _arg_1.conf1;
                _local_4 = 5;
                while (_local_4 < 10)
                {
                    if (_local_3[_local_4])
                    {
                        _local_5 = Number(_local_3[_local_4].pid);
                        this[("pf" + _local_4)].setPet(_local_5);
                        this[("pf" + _local_4)].conf = _local_3[_local_4];
                        _confDataList[_local_5] = _local_3[_local_4];
                        _local_6 = new Array();
                        if (((_confDataList[_local_5].cmdList) && (!(_confDataList[_local_5].cmdList == null))))
                        {
                            for each (_local_7 in _confDataList[_local_5].cmdList)
                            {
                                _local_6.push(_local_7);
                            };
                            _confDataList[_local_5].cmdList = _local_6;
                        };
                    };
                    _local_4++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        private function get _petArenaHasTicket():Boolean
        {
            return (this._2106582911_petArenaHasTicket);
        }

        private function onPsPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int = 1;
            while (_local_4 <= _arg_2)
            {
                _local_3 = ((_local_4 - 1) + _arg_1);
                this[("pet" + _local_4)].type = GamePredef.TBL_PET;
                this[("pet" + _local_4)].slotData = _petList[_local_3];
                this[("pet" + _local_4)].stackNum = 1;
                this[("pet" + _local_4)].giid = _petList[_local_3].id;
                _local_4++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get loadWarn():Label
        {
            return (this._1845684364loadWarn);
        }

        override public function initialize():void
        {
            var target:MCZDPetFightConf;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MCZDPetFightConf_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MCZDPetFightConfWatcherSetupUtil");
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

        public function saveConfData(_arg_1:Object):void
        {
            var _local_2:Number = _arg_1.pid;
            if (((_local_2) && (_local_2 > 0)))
            {
                _confDataList[_local_2] = _arg_1;
            };
        }

        public function __okBtn_click(_arg_1:MouseEvent):void
        {
            subPetConfigure();
        }

        public function duplicatedPet(_arg_1:Object, _arg_2:Number):Boolean
        {
            var _local_4:*;
            var _local_3:int = 5;
            while (_local_3 < 10)
            {
                _local_4 = this[("pf" + _local_3)];
                if ((((this[("pf" + _local_3)].visible) && (!(_local_3 == _arg_2))) && ((this[("pf" + _local_3)].pid == _arg_1.pid) || (this[("pf" + _local_3)].tid == _arg_1.tid))))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        private function _subPetConfigure():void
        {
            var _local_3:MCZDPetConfigCanvas;
            var _local_4:Number;
            _dataForServer = {};
            var _local_1:* = 0;
            var _local_2:int = 5;
            while (_local_2 < 10)
            {
                _local_3 = this[("pf" + _local_2)];
                if (((_local_3.visible) && (_local_3.hasSetted())))
                {
                    _local_4 = _local_3.pid;
                    if (((_local_4) && (_confDataList[_local_4])))
                    {
                        _confDataList[_local_4].pos = 6;
                        _dataForServer[_local_2] = _confDataList[_local_4];
                        _local_1++;
                    };
                };
                _local_2++;
            };
            if (_local_1 != 5)
            {
                Alert.show(Language.MCZDPETFIGHT_PANEL_U[56]);
                return;
            };
            if (!ToolKit.isEmptyObject(_dataForServer))
            {
                _core.remote.call("updateMCZDConf", null, _dataForServer);
                if (!_petArenaData)
                {
                    _petArenaData = {};
                };
                _petArenaData.conf1 = _dataForServer;
                _petArenaData.cid = _core.cid;
            }
            else
            {
                _core.sysMidNote(Language.MCZDPETFIGHT_PANEL_U[26]);
            };
        }

        public function set pTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1007683640pTitle;
            if (_local_2 !== _arg_1)
            {
                this._1007683640pTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pTitle", _local_2, _arg_1));
            };
        }

        private function removeLoadWarnLabel():void
        {
            loadWarn.visible = false;
        }

        public function ___MCZDPetFightConf_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get pTitle():BasicTitleCanvas
        {
            return (this._1007683640pTitle);
        }

        private function onPsPageClear():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 6)
            {
                this[("pet" + _local_1)].clean();
                _local_1++;
            };
        }

        public function set okBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._105765600okBtn;
            if (_local_2 !== _arg_1)
            {
                this._105765600okBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "okBtn", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (((_arg_1) && (initialized)))
            {
                initPetView();
            };
            super.visible = _arg_1;
        }

        public function set pet2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437299pet2;
            if (_local_2 !== _arg_1)
            {
                this._3437299pet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet2", _local_2, _arg_1));
            };
        }

        private function subPetConfigure():void
        {
            var elite:* = undefined;
            var func:Function;
            var view:Object = _core.view.getUI(ViewManager.PANEL_MCZD);
            if (view)
            {
                elite = view.elite;
                if (elite == true)
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _subPetConfigure();
                        };
                    };
                    Alert.show(Language.MCZDPETFIGHT_PANEL_U[69].toString(), "", (Alert.YES | Alert.NO), null, func);
                }
                else
                {
                    _subPetConfigure();
                };
            };
        }

        public function set pet3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437300pet3;
            if (_local_2 !== _arg_1)
            {
                this._3437300pet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet3", _local_2, _arg_1));
            };
        }

        public function getCacheConfData(_arg_1:Number):Object
        {
            if (_confDataList[_arg_1])
            {
                return (_confDataList[_arg_1]);
            };
            return (null);
        }

        public function set pet6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437303pet6;
            if (_local_2 !== _arg_1)
            {
                this._3437303pet6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get okBtn():BasicDelayButton
        {
            return (this._105765600okBtn);
        }

        public function set pet4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437301pet4;
            if (_local_2 !== _arg_1)
            {
                this._3437301pet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet1():ItemSlot
        {
            return (this._3437298pet1);
        }

        public function set pet1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437298pet1;
            if (_local_2 !== _arg_1)
            {
                this._3437298pet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet3():ItemSlot
        {
            return (this._3437300pet3);
        }

        [Bindable(event="propertyChange")]
        public function get pet6():ItemSlot
        {
            return (this._3437303pet6);
        }

        [Bindable(event="propertyChange")]
        public function get pet2():ItemSlot
        {
            return (this._3437299pet2);
        }

        public function set pet5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437302pet5;
            if (_local_2 !== _arg_1)
            {
                this._3437302pet5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet5():ItemSlot
        {
            return (this._3437302pet5);
        }

        public function set pf5(_arg_1:MCZDPetConfigCanvas):void
        {
            var _local_2:Object = this._110847pf5;
            if (_local_2 !== _arg_1)
            {
                this._110847pf5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pf5():MCZDPetConfigCanvas
        {
            return (this._110847pf5);
        }


    }
}//package com.qeedoo.ui.view.compDragable

