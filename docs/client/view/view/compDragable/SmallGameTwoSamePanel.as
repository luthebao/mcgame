// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SmallGameTwoSamePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.ItemSlotCreature;
    import mx.controls.Image;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.containers.Tile;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.resource.ResManager;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.clearTimeout;
    import flash.utils.setTimeout;
    import flash.net.Responder;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.ui.utils.SmallGame;
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

    public class SmallGameTwoSamePanel extends DragableCanvas implements IBindingClient 
    {

        private static const SMALL_GAME_MAX_TIMES:int = 8;
        private static const SMALL_GAME_ADD_TIME_COST:int = 5;
        private static const SMALL_GAME_PET_TOTAL_NUM:int = 8;
        private static const SMALL_GAME_PET_DISPLAY_NUM:int = 16;
        private static const SMALL_GAME_MAX_WIN:int = 8;
        private static const SMALL_GAME_PET_DISPLAY_TIMES:int = 2;
        private static var SMALL_GAME_ENEMY_ICON:Number = 3060090000015;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _896883712idTodayTimes:BasicTxtButton;
        private var _isPlaying:Boolean = false;
        private var _winTimes:int = 0;
        private var _succFlag:Boolean = false;
        private var _463521703idLostTimes:BasicTxtButton;
        private var _displaySlot1:String = "";
        private var _1194070353idPet3:ItemSlotCreature;
        private var _displaySlot2:String = "";
        private var _actionType:String = "player";
        private var _1194070347idPet9:ItemSlotCreature;
        private var _1191676748selfHead:Image;
        private var _1194070350idPet6:ItemSlotCreature;
        private var _1638524712idPet15:ItemSlotCreature;
        private var _1859304919idCurrWinTimes:BasicTxtButton;
        private var _297977609_iconUrl:String = "";
        private var winOrLost:Boolean = false;
        private var _1194070355idPet1:ItemSlotCreature;
        private var _1638524708idPet11:ItemSlotCreature;
        private var _1638524710idPet13:ItemSlotCreature;
        private var _playTotalTimes:int = 3;
        private var _430998102idCurrPcWinTimes:BasicTxtButton;
        private var _307382965showCanvas:Image;
        private var _1194070349idPet7:ItemSlotCreature;
        private var _1194070352idPet4:ItemSlotCreature;
        private var _playTimes:int = 0;
        private var _lostTimes:int = 0;
        private var _581600507idWinTimes:BasicTxtButton;
        private var handler:int = 0;
        public var _SmallGameTwoSamePanel_Button1:Button;
        private var _985338109idStartGameBtn:Button;
        private var _1638524713idPet16:ItemSlotCreature;
        private var _1194070354idPet2:ItemSlotCreature;
        public var _SmallGameTwoSamePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1404615706idGetAwardBtn:Button;
        private var _1638524709idPet12:ItemSlotCreature;
        private var _1194070348idPet8:ItemSlotCreature;
        private var _1638524711idPet14:ItemSlotCreature;
        private var _1194070351idPet5:ItemSlotCreature;
        private var _1638524707idPet10:ItemSlotCreature;
        private var _1638434973idPcSay:LinkTextArea;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":320,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SmallGameTwoSamePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":40,
                                "width":130,
                                "height":170,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"selfHead",
                                    "events":{"click":"__selfHead_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "useHandCursor":true,
                                            "buttonMode":true,
                                            "width":49,
                                            "x":10,
                                            "height":47,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idCurrWinTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":65
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idTodayTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idWinTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":115
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idLostTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":140
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
                                "x":155,
                                "y":73,
                                "width":180,
                                "height":176,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":7,
                                            "y":10,
                                            "width":162,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet1",
                                                "events":{"click":"__idPet1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet2",
                                                "events":{"click":"__idPet2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet3",
                                                "events":{"click":"__idPet3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet4",
                                                "events":{"click":"__idPet4_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            })]
                                        });
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
                                            "x":7,
                                            "y":50,
                                            "width":162,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet5",
                                                "events":{"click":"__idPet5_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet6",
                                                "events":{"click":"__idPet6_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet7",
                                                "events":{"click":"__idPet7_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet8",
                                                "events":{"click":"__idPet8_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            })]
                                        });
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
                                            "x":7,
                                            "y":90,
                                            "width":162,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet9",
                                                "events":{"click":"__idPet9_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet10",
                                                "events":{"click":"__idPet10_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet11",
                                                "events":{"click":"__idPet11_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet12",
                                                "events":{"click":"__idPet12_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            })]
                                        });
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
                                            "x":7,
                                            "y":130,
                                            "width":162,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet13",
                                                "events":{"click":"__idPet13_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet14",
                                                "events":{"click":"__idPet14_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet15",
                                                "events":{"click":"__idPet15_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idPet16",
                                                "events":{"click":"__idPet16_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"movable":false});
                                                }
                                            })]
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
                                "x":360,
                                "y":150,
                                "width":130,
                                "height":150,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"idPcSay",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                        this.top = "10";
                                        this.backgroundAlpha = 0;
                                        this.horizontalCenter = "0";
                                        this.fontSize = 12;
                                        this.fontWeight = "normal";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "htmlText":"",
                                            "width":100,
                                            "height":47,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idCurrPcWinTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "65";
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"showCanvas",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":38,
                                            "height":38,
                                            "useHandCursor":true,
                                            "buttonMode":true
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_SmallGameTwoSamePanel_Button1",
                        "events":{"click":"___SmallGameTwoSamePanel_Button1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "x":30,
                                "y":220,
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"idStartGameBtn",
                        "events":{"click":"__idStartGameBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "x":160,
                                "y":280,
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"idGetAwardBtn",
                        "events":{"click":"__idGetAwardBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "x":260,
                                "y":280
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _defaultPetUrl:Object = ResManager.PET_DEFAULT_ICON;
        private var _currWinTimes:Object = {
            "player":0,
            "pc":0
        };
        private var _petIcons:ArrayCollection = new ArrayCollection();
        private var _petLists:ArrayCollection = new ArrayCollection();
        private var _displayPetLists:ArrayCollection = new ArrayCollection();
        private var _displayedSlotList:Array = new Array();
        private var _pcMsg:Array = [Language.SMALL_GAME_P[31], Language.SMALL_GAME_P[32], Language.SMALL_GAME_P[33], Language.SMALL_GAME_P[34]];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SmallGameTwoSamePanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 320;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___SmallGameTwoSamePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SmallGameTwoSamePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get idTodayTimes():BasicTxtButton
        {
            return (this._896883712idTodayTimes);
        }

        public function set idTodayTimes(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._896883712idTodayTimes;
            if (_local_2 !== _arg_1)
            {
                this._896883712idTodayTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTodayTimes", _local_2, _arg_1));
            };
        }

        public function set idWinTimes(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._581600507idWinTimes;
            if (_local_2 !== _arg_1)
            {
                this._581600507idWinTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idWinTimes", _local_2, _arg_1));
            };
        }

        public function set idStartGameBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._985338109idStartGameBtn;
            if (_local_2 !== _arg_1)
            {
                this._985338109idStartGameBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idStartGameBtn", _local_2, _arg_1));
            };
        }

        private function resetPetList(_arg_1:Boolean):void
        {
            var _local_2:int = 1;
            while (_local_2 <= SMALL_GAME_PET_DISPLAY_NUM)
            {
                if (_arg_1)
                {
                    this[("idPet" + _local_2)].enabled = true;
                }
                else
                {
                    this[("idPet" + _local_2)].clean();
                    this[("idPet" + _local_2)].enabled = false;
                };
                _local_2++;
            };
        }

        public function onSaveGame(_arg_1:Object):void
        {
            var _local_2:String = ((_arg_1.flag) ? Language.SMALL_GAME_P[13] : Language.SMALL_GAME_P[14]);
            winOrLost = ((_arg_1.flag) ? true : false);
            if (_arg_1.flag)
            {
                _winTimes++;
                idGetAwardBtn.enabled = true;
            }
            else
            {
                _lostTimes++;
                onGetAwardAndReset(true);
                idStartGameBtn.enabled = true;
            };
            _core.sysMsg(_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get idGetAwardBtn():Button
        {
            return (this._1404615706idGetAwardBtn);
        }

        public function __idPet8_click(_arg_1:MouseEvent):void
        {
            openSlot(8);
        }

        public function __idPet12_click(_arg_1:MouseEvent):void
        {
            openSlot(12);
        }

        public function set idGetAwardBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1404615706idGetAwardBtn;
            if (_local_2 !== _arg_1)
            {
                this._1404615706idGetAwardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idGetAwardBtn", _local_2, _arg_1));
            };
        }

        public function ___SmallGameTwoSamePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set idPet10(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1638524707idPet10;
            if (_local_2 !== _arg_1)
            {
                this._1638524707idPet10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet10", _local_2, _arg_1));
            };
        }

        public function set idPet11(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1638524708idPet11;
            if (_local_2 !== _arg_1)
            {
                this._1638524708idPet11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet11", _local_2, _arg_1));
            };
        }

        public function set idPet13(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1638524710idPet13;
            if (_local_2 !== _arg_1)
            {
                this._1638524710idPet13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet13", _local_2, _arg_1));
            };
        }

        public function set idPet14(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1638524711idPet14;
            if (_local_2 !== _arg_1)
            {
                this._1638524711idPet14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet14", _local_2, _arg_1));
            };
        }

        public function set idPet15(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1638524712idPet15;
            if (_local_2 !== _arg_1)
            {
                this._1638524712idPet15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet15", _local_2, _arg_1));
            };
        }

        private function getPetDataFromPetLists(_arg_1:Number):Object
        {
            var _local_2:String;
            for (_local_2 in _petLists)
            {
                if (Number(_local_2) == _arg_1)
                {
                    return (_petLists[_local_2]);
                };
            };
            return (null);
        }

        public function __idPet5_click(_arg_1:MouseEvent):void
        {
            openSlot(5);
        }

        public function set idPet16(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1638524713idPet16;
            if (_local_2 !== _arg_1)
            {
                this._1638524713idPet16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet16", _local_2, _arg_1));
            };
        }

        public function set idPet12(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1638524709idPet12;
            if (_local_2 !== _arg_1)
            {
                this._1638524709idPet12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet12", _local_2, _arg_1));
            };
        }

        private function pcOpenSlot():void
        {
            var _local_3:int;
            var _local_1:String = _pcMsg[Math.round(ToolKit.genRangeRandom(0, (_pcMsg.length - 1)))];
            idPcSay.htmlText = ((_local_1) ? _local_1 : _pcMsg[1]);
            var _local_2:int = 1;
            while (_local_2 <= SMALL_GAME_PET_DISPLAY_TIMES)
            {
                _local_3 = getMaskSlotByRand();
                _openSlot(_local_3);
                _local_2++;
            };
        }

        public function onAddPlayTime(_arg_1:Boolean):void
        {
            if (!_arg_1)
            {
                _playTotalTimes--;
            };
            resetPlayData();
            checkGameStartBtn();
        }

        public function __idPet14_click(_arg_1:MouseEvent):void
        {
            openSlot(14);
        }

        public function __idPet2_click(_arg_1:MouseEvent):void
        {
            openSlot(2);
        }

        private function cleanPetSlotValue(_arg_1:Number):void
        {
            this[("idPet" + _arg_1)].clean();
        }

        public function set selfHead(_arg_1:Image):void
        {
            var _local_2:Object = this._1191676748selfHead;
            if (_local_2 !== _arg_1)
            {
                this._1191676748selfHead = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selfHead", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idPcSay():LinkTextArea
        {
            return (this._1638434973idPcSay);
        }

        [Bindable(event="propertyChange")]
        public function get idPet1():ItemSlotCreature
        {
            return (this._1194070355idPet1);
        }

        [Bindable(event="propertyChange")]
        public function get idPet2():ItemSlotCreature
        {
            return (this._1194070354idPet2);
        }

        [Bindable(event="propertyChange")]
        public function get idPet3():ItemSlotCreature
        {
            return (this._1194070353idPet3);
        }

        [Bindable(event="propertyChange")]
        public function get idPet4():ItemSlotCreature
        {
            return (this._1194070352idPet4);
        }

        [Bindable(event="propertyChange")]
        public function get idPet8():ItemSlotCreature
        {
            return (this._1194070348idPet8);
        }

        [Bindable(event="propertyChange")]
        public function get idPet9():ItemSlotCreature
        {
            return (this._1194070347idPet9);
        }

        [Bindable(event="propertyChange")]
        public function get idPet6():ItemSlotCreature
        {
            return (this._1194070350idPet6);
        }

        [Bindable(event="propertyChange")]
        public function get idPet7():ItemSlotCreature
        {
            return (this._1194070349idPet7);
        }

        public function __selfHead_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_CHARACTOR);
        }

        [Bindable(event="propertyChange")]
        public function get idPet5():ItemSlotCreature
        {
            return (this._1194070351idPet5);
        }

        public function ___SmallGameTwoSamePanel_Button1_click(_arg_1:MouseEvent):void
        {
            addPlayTime();
        }

        private function _openSlot(_arg_1:int):void
        {
            var _local_3:Number;
            if (this[("idPet" + _arg_1)].giid > 0)
            {
                return;
            };
            if (((_currWinTimes["player"] >= (SMALL_GAME_MAX_WIN / 2)) || (_currWinTimes["pc"] >= (SMALL_GAME_MAX_WIN / 2))))
            {
                return;
            };
            if (((_displaySlot1) && (_displaySlot2)))
            {
                return;
            };
            var _local_2:Object = _displayPetLists[(_arg_1 - 1)];
            setPetSlotValue(_arg_1, _local_2);
            if (handler)
            {
                clearTimeout(handler);
                handler = 0;
            };
            if (!_displaySlot1)
            {
                _displaySlot1 = ("idPet" + _arg_1);
            }
            else
            {
                _displaySlot2 = ("idPet" + _arg_1);
                _succFlag = compareSlotPet();
                if (_succFlag)
                {
                    _currWinTimes[_actionType] = (Number(_currWinTimes[_actionType]) + 1);
                    resetPlayData();
                    _local_3 = Number(_displaySlot1.substr(5));
                    _displayedSlotList.push(_local_3);
                    _displayedSlotList.push(_arg_1);
                    _displaySlot1 = "";
                    _displaySlot2 = "";
                    if (_currWinTimes[_actionType] >= (SMALL_GAME_MAX_WIN / 2))
                    {
                        decideWinner();
                    }
                    else
                    {
                        _displaySlot1 = "";
                        _displaySlot2 = "";
                        idPcSay.htmlText = "";
                        _actionType = ((_actionType == "player") ? "pc" : "player");
                        if (_actionType == "pc")
                        {
                            pcOpenSlot();
                        };
                    };
                }
                else
                {
                    handler = setTimeout(cleanPetSlotDisplay, 1000);
                };
            };
        }

        public function __idPet11_click(_arg_1:MouseEvent):void
        {
            openSlot(11);
        }

        public function initPanel():void
        {
            if (!initialized)
            {
                _core.player.normalView.pause();
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            callLater(_core.player.normalView.resume);
            getMyIconCode();
            resetPetList(false);
            winOrLost = false;
            _isPlaying = false;
            _core.remote.call("getSmallGameStatus", new Responder(onGetSmallGameStatus), "TwoSame");
        }

        public function __idPet7_click(_arg_1:MouseEvent):void
        {
            openSlot(7);
        }

        private function cleanPetSlotDisplay():void
        {
            if (handler)
            {
                clearTimeout(handler);
                handler = 0;
            };
            var _local_1:Number = Number(_displaySlot1.substr(5));
            var _local_2:Number = Number(_displaySlot2.substr(5));
            cleanPetSlotValue(_local_1);
            cleanPetSlotValue(_local_2);
            _displaySlot1 = "";
            _displaySlot2 = "";
            idPcSay.htmlText = "";
            _actionType = ((_actionType == "player") ? "pc" : "player");
            if (_actionType == "pc")
            {
                pcOpenSlot();
            };
        }

        private function getDisplayPet():Object
        {
            var _local_3:Object;
            var _local_1:Number = Math.round(ToolKit.genRangeRandom(0, SMALL_GAME_PET_TOTAL_NUM));
            var _local_2:Object = getPetDataFromPetLists(_local_1);
            if (((ToolKit.isEmptyObject(_local_2)) || (!(_local_2))))
            {
                return (getDisplayPet());
            };
            if (!_local_2.displayTimes)
            {
                _local_2.displayTimes = 0;
            };
            for each (_local_3 in _displayPetLists)
            {
                if (((_local_3.iconCode == _local_2.iconCode) && (_local_2.displayTimes >= SMALL_GAME_PET_DISPLAY_TIMES)))
                {
                    return (getDisplayPet());
                };
            };
            _local_2.displayTimes++;
            _petLists[_local_1] = _local_2;
            return (_local_2);
        }

        private function onGetSmallGameStatus(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1.state)
            {
                _playTimes = _arg_1.playTimes;
                _playTotalTimes = _arg_1.playTotalTimes;
                _winTimes = _arg_1.winTimes;
                _lostTimes = _arg_1.lostTimes;
                _local_2 = _arg_1.awardFlag;
                resetPlayData();
                checkGameStartBtn();
                if (((_winTimes) && (_winTimes > _local_2)))
                {
                    idStartGameBtn.enabled = false;
                    idGetAwardBtn.enabled = true;
                    winOrLost = true;
                    _isPlaying = true;
                };
                if (idStartGameBtn.enabled)
                {
                    idGetAwardBtn.enabled = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        private function get _iconUrl():String
        {
            return (this._297977609_iconUrl);
        }

        private function refreshPetList():void
        {
            var _local_1:int;
            var _local_2:Object;
            var _local_3:int;
            _local_1 = 1;
            while (_local_1 <= SMALL_GAME_PET_DISPLAY_NUM)
            {
                _local_2 = getDisplayPet();
                _displayPetLists.addItem(_local_2);
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < SMALL_GAME_PET_DISPLAY_NUM)
            {
                _local_2 = _displayPetLists[_local_1];
                _local_3 = (_local_1 + 1);
                this[("idPet" + _local_3)].enabled = true;
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get idWinTimes():BasicTxtButton
        {
            return (this._581600507idWinTimes);
        }

        [Bindable(event="propertyChange")]
        public function get showCanvas():Image
        {
            return (this._307382965showCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get idStartGameBtn():Button
        {
            return (this._985338109idStartGameBtn);
        }

        private function _SmallGameTwoSamePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SmallGameTwoSamePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SmallGameTwoSamePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_iconUrl);
            }, function (_arg_1:Object):void
            {
                selfHead.source = _arg_1;
            }, "selfHead.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PORTRAITCANVAS_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                selfHead.toolTip = _arg_1;
            }, "selfHead.toolTip");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idCurrWinTimes.text = _arg_1;
            }, "idCurrWinTimes.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTodayTimes.text = _arg_1;
            }, "idTodayTimes.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idWinTimes.text = _arg_1;
            }, "idWinTimes.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idLostTimes.text = _arg_1;
            }, "idLostTimes.text");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet1.slotType = _arg_1;
            }, "idPet1.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet2.slotType = _arg_1;
            }, "idPet2.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet3.slotType = _arg_1;
            }, "idPet3.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet4.slotType = _arg_1;
            }, "idPet4.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet5.slotType = _arg_1;
            }, "idPet5.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet6.slotType = _arg_1;
            }, "idPet6.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet7.slotType = _arg_1;
            }, "idPet7.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet8.slotType = _arg_1;
            }, "idPet8.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet9.slotType = _arg_1;
            }, "idPet9.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet10.slotType = _arg_1;
            }, "idPet10.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet11.slotType = _arg_1;
            }, "idPet11.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet12.slotType = _arg_1;
            }, "idPet12.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet13.slotType = _arg_1;
            }, "idPet13.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet14.slotType = _arg_1;
            }, "idPet14.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet15.slotType = _arg_1;
            }, "idPet15.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_CREATURE);
            }, function (_arg_1:int):void
            {
                idPet16.slotType = _arg_1;
            }, "idPet16.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idCurrPcWinTimes.text = _arg_1;
            }, "idCurrPcWinTimes.text");
            result[23] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(SMALL_GAME_ENEMY_ICON)));
            }, function (_arg_1:Object):void
            {
                showCanvas.source = _arg_1;
            }, "showCanvas.source");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showCanvas.toolTip = _arg_1;
            }, "showCanvas.toolTip");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SmallGameTwoSamePanel_Button1.label = _arg_1;
            }, "_SmallGameTwoSamePanel_Button1.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idStartGameBtn.label = _arg_1;
            }, "idStartGameBtn.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idGetAwardBtn.label = _arg_1;
            }, "idGetAwardBtn.label");
            result[28] = binding;
            return (result);
        }

        private function init():void
        {
        }

        public function __idPet16_click(_arg_1:MouseEvent):void
        {
            openSlot(16);
        }

        public function __idPet4_click(_arg_1:MouseEvent):void
        {
            openSlot(4);
        }

        [Bindable(event="propertyChange")]
        public function get idPet10():ItemSlotCreature
        {
            return (this._1638524707idPet10);
        }

        [Bindable(event="propertyChange")]
        public function get idPet11():ItemSlotCreature
        {
            return (this._1638524708idPet11);
        }

        [Bindable(event="propertyChange")]
        public function get idPet12():ItemSlotCreature
        {
            return (this._1638524709idPet12);
        }

        [Bindable(event="propertyChange")]
        public function get idPet14():ItemSlotCreature
        {
            return (this._1638524711idPet14);
        }

        [Bindable(event="propertyChange")]
        public function get idPet15():ItemSlotCreature
        {
            return (this._1638524712idPet15);
        }

        [Bindable(event="propertyChange")]
        public function get idPet16():ItemSlotCreature
        {
            return (this._1638524713idPet16);
        }

        public function __idStartGameBtn_click(_arg_1:MouseEvent):void
        {
            startGame();
        }

        [Bindable(event="propertyChange")]
        public function get idPet13():ItemSlotCreature
        {
            return (this._1638524710idPet13);
        }

        private function setPetSlotValue(_arg_1:Number, _arg_2:Object):void
        {
            this[("idPet" + _arg_1)].type = GamePredef.TBL_CREATURE;
            this[("idPet" + _arg_1)].giid = _arg_2.id;
            this[("idPet" + _arg_1)].slotData = _arg_2;
            this[("idPet" + _arg_1)].stackNum = 1;
        }

        public function set idPcSay(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1638434973idPcSay;
            if (_local_2 !== _arg_1)
            {
                this._1638434973idPcSay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPcSay", _local_2, _arg_1));
            };
        }

        public function __idGetAwardBtn_click(_arg_1:MouseEvent):void
        {
            getAwardAndReset();
        }

        public function set idLostTimes(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._463521703idLostTimes;
            if (_local_2 !== _arg_1)
            {
                this._463521703idLostTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idLostTimes", _local_2, _arg_1));
            };
        }

        public function __idPet13_click(_arg_1:MouseEvent):void
        {
            openSlot(13);
        }

        [Bindable(event="propertyChange")]
        public function get selfHead():Image
        {
            return (this._1191676748selfHead);
        }

        public function set idCurrPcWinTimes(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._430998102idCurrPcWinTimes;
            if (_local_2 !== _arg_1)
            {
                this._430998102idCurrPcWinTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idCurrPcWinTimes", _local_2, _arg_1));
            };
        }

        public function __idPet1_click(_arg_1:MouseEvent):void
        {
            openSlot(1);
        }

        public function set idPet1(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1194070355idPet1;
            if (_local_2 !== _arg_1)
            {
                this._1194070355idPet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet1", _local_2, _arg_1));
            };
        }

        public function set idPet3(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1194070353idPet3;
            if (_local_2 !== _arg_1)
            {
                this._1194070353idPet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet3", _local_2, _arg_1));
            };
        }

        public function set idPet4(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1194070352idPet4;
            if (_local_2 !== _arg_1)
            {
                this._1194070352idPet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet4", _local_2, _arg_1));
            };
        }

        public function set idPet2(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1194070354idPet2;
            if (_local_2 !== _arg_1)
            {
                this._1194070354idPet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet2", _local_2, _arg_1));
            };
        }

        public function set idPet6(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1194070350idPet6;
            if (_local_2 !== _arg_1)
            {
                this._1194070350idPet6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet6", _local_2, _arg_1));
            };
        }

        private function openSlot(_arg_1:int):void
        {
            if (_actionType == "player")
            {
                _openSlot(_arg_1);
            };
        }

        public function set idPet9(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1194070347idPet9;
            if (_local_2 !== _arg_1)
            {
                this._1194070347idPet9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet9", _local_2, _arg_1));
            };
        }

        public function set idPet7(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1194070349idPet7;
            if (_local_2 !== _arg_1)
            {
                this._1194070349idPet7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet7", _local_2, _arg_1));
            };
        }

        public function set idPet8(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1194070348idPet8;
            if (_local_2 !== _arg_1)
            {
                this._1194070348idPet8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet8", _local_2, _arg_1));
            };
        }

        private function startGame():void
        {
            idStartGameBtn.enabled = false;
            if (((_playTimes < _playTotalTimes) && (!(_isPlaying))))
            {
                trace("startGame");
                (_actionType == "player");
                resetPetList(false);
                setPetList();
                _isPlaying = true;
                _currWinTimes = {
                    "player":0,
                    "pc":0
                };
                _displaySlot1 = "";
                _displaySlot2 = "";
                resetPlayData();
                refreshPetList();
            }
            else
            {
                _core.sysMsg(Language.SMALL_GAME_P[24]);
            };
        }

        public function __idPet9_click(_arg_1:MouseEvent):void
        {
            openSlot(9);
        }

        public function set showCanvas(_arg_1:Image):void
        {
            var _local_2:Object = this._307382965showCanvas;
            if (_local_2 !== _arg_1)
            {
                this._307382965showCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCanvas", _local_2, _arg_1));
            };
        }

        public function set idPet5(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1194070351idPet5;
            if (_local_2 !== _arg_1)
            {
                this._1194070351idPet5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPet5", _local_2, _arg_1));
            };
        }

        private function onGetAwardAndReset(_arg_1:Boolean):void
        {
            _isPlaying = false;
            idGetAwardBtn.enabled = false;
            idStartGameBtn.enabled = true;
            _actionType = "player";
            if (!_arg_1)
            {
                _playTimes = (_winTimes + _lostTimes);
            };
            resetPlayData();
            resetPetList(false);
        }

        private function getAwardAndReset():void
        {
            if (winOrLost)
            {
                _core.remote.call("getSmallGameAward", new Responder(onGetAwardAndReset), "TwoSame");
            }
            else
            {
                onGetAwardAndReset(true);
            };
        }

        private function resetPlayData():void
        {
            idTodayTimes.text = (((Language.SMALL_GAME_P[4] + _playTimes) + "/") + _playTotalTimes);
            idWinTimes.text = (Language.SMALL_GAME_P[5] + _winTimes);
            idLostTimes.text = (Language.SMALL_GAME_P[6] + _lostTimes);
            idCurrWinTimes.text = (((Language.SMALL_GAME_P[30] + _currWinTimes["player"]) + "/") + SMALL_GAME_MAX_WIN);
            idCurrPcWinTimes.text = (((Language.SMALL_GAME_P[30] + _currWinTimes["pc"]) + "/") + SMALL_GAME_MAX_WIN);
        }

        public function __idPet10_click(_arg_1:MouseEvent):void
        {
            openSlot(10);
        }

        override public function initialize():void
        {
            var target:SmallGameTwoSamePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SmallGameTwoSamePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SmallGameTwoSamePanelWatcherSetupUtil");
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

        private function setPetList():void
        {
            _petIcons = new ArrayCollection();
            _petLists = new ArrayCollection();
            _displayPetLists = new ArrayCollection();
            _displayedSlotList = new Array();
            var _local_1:Object = new Object();
            var _local_2:int = 1;
            while (_local_2 <= SMALL_GAME_PET_TOTAL_NUM)
            {
                _local_1 = SmallGame.getUniqueCreatureByIcon(_petIcons);
                _local_1.type = GamePredef.TBL_CREATURE;
                _local_1.itemId = _local_1.id;
                _local_1.displayTimes = 0;
                _petIcons.addItem({"icon":_local_1.iconCode});
                _petLists.addItem(_local_1);
                _local_2++;
            };
        }

        public function __idPet6_click(_arg_1:MouseEvent):void
        {
            openSlot(6);
        }

        private function compareSlotPet():Boolean
        {
            return ((this[_displaySlot1].giid == this[_displaySlot2].giid) ? true : false);
        }

        private function _SmallGameTwoSamePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SMALL_GAME_P[2];
            _local_1 = _iconUrl;
            _local_1 = Language.PORTRAITCANVAS_S[4];
            _local_1 = Language.SMALL_GAME_P[30];
            _local_1 = Language.SMALL_GAME_P[4];
            _local_1 = Language.SMALL_GAME_P[5];
            _local_1 = Language.SMALL_GAME_P[6];
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Slot.SLOT_CREATURE;
            _local_1 = Language.SMALL_GAME_P[30];
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(SMALL_GAME_ENEMY_ICON));
            _local_1 = Language.SMALL_GAME_P[29];
            _local_1 = Language.SMALL_GAME_P[7];
            _local_1 = Language.SMALL_GAME_P[8];
            _local_1 = Language.SMALL_GAME_P[10];
        }

        [Bindable(event="propertyChange")]
        public function get idLostTimes():BasicTxtButton
        {
            return (this._463521703idLostTimes);
        }

        [Bindable(event="propertyChange")]
        public function get idCurrPcWinTimes():BasicTxtButton
        {
            return (this._430998102idCurrPcWinTimes);
        }

        public function set idCurrWinTimes(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1859304919idCurrWinTimes;
            if (_local_2 !== _arg_1)
            {
                this._1859304919idCurrWinTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idCurrWinTimes", _local_2, _arg_1));
            };
        }

        private function getMaskSlotByRand():int
        {
            var _local_3:*;
            var _local_1:Number = Math.round(ToolKit.genRangeRandom(1, SMALL_GAME_PET_DISPLAY_NUM));
            if (((!(_local_1)) || (_local_1 > SMALL_GAME_PET_DISPLAY_NUM)))
            {
                return (getMaskSlotByRand());
            };
            var _local_2:String = ("idPet" + _local_1);
            if (((!(this.hasOwnProperty(_local_2))) || (this[_local_2].giid > 0)))
            {
                return (getMaskSlotByRand());
            };
            if (_displayedSlotList.length)
            {
                for (_local_3 in _displayedSlotList)
                {
                    if (_local_1 == _displayedSlotList[_local_3])
                    {
                        return (getMaskSlotByRand());
                    };
                };
            };
            return (_local_1);
        }

        private function decideWinner():void
        {
            _playTimes++;
            resetPetList(true);
            var _local_1:Boolean = ((_currWinTimes["player"] > _currWinTimes["pc"]) ? true : false);
            _core.remote.call("saveSmallGame", new Responder(onSaveGame), "TwoSame", _local_1);
        }

        private function getMyIconCode():String
        {
            var _local_1:Number = _core.player.iconCode;
            if (_local_1)
            {
                _iconUrl = ResManager.hash(ResManager.getIconUrlNoHash(_local_1));
            };
            return (_iconUrl);
        }

        public function __idPet15_click(_arg_1:MouseEvent):void
        {
            openSlot(15);
        }

        private function checkGameStartBtn():void
        {
            idStartGameBtn.enabled = (((_playTimes < _playTotalTimes) && (!(_isPlaying))) ? true : false);
        }

        [Bindable(event="propertyChange")]
        public function get idCurrWinTimes():BasicTxtButton
        {
            return (this._1859304919idCurrWinTimes);
        }

        public function __idPet3_click(_arg_1:MouseEvent):void
        {
            openSlot(3);
        }

        private function addPlayTime():void
        {
            if (_playTotalTimes >= SMALL_GAME_MAX_TIMES)
            {
                Alert.show(Language.SMALL_GAME_P[15]);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _playTotalTimes++;
                    _core.remote.call("addSmallGameTime", new Responder(onAddPlayTime), "TwoSame");
                };
            };
            var showString:String = Language.SMALL_GAME_P[16];
            showString = showString.replace("{gold}", SMALL_GAME_ADD_TIME_COST);
            Alert.show(showString, "", (Alert.YES | Alert.NO), this, func);
        }

        private function set _iconUrl(_arg_1:String):void
        {
            var _local_2:Object = this._297977609_iconUrl;
            if (_local_2 !== _arg_1)
            {
                this._297977609_iconUrl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_iconUrl", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

