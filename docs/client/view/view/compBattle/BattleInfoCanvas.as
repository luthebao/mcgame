// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.BattleInfoCanvas

package com.qeedoo.ui.view.compBattle
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
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

    public class BattleInfoCanvas extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1100041769lline7:BattleInfoSinglePlayer;
        private var _928266867rline3:BattleInfoSinglePlayer;
        private var _1100041772lline4:BattleInfoSinglePlayer;
        private var _928266863rline7:BattleInfoSinglePlayer;
        private var _3773vs:ViewStack;
        private var _1100041776lline0:BattleInfoSinglePlayer;
        private var _928266870rline0:BattleInfoSinglePlayer;
        private var _928266864rline6:BattleInfoSinglePlayer;
        private var _1100041773lline3:BattleInfoSinglePlayer;
        private var _928266868rline2:BattleInfoSinglePlayer;
        private var _1100041767lline9:BattleInfoSinglePlayer;
        private var _928266869rline1:BattleInfoSinglePlayer;
        private var _1100041774lline2:BattleInfoSinglePlayer;
        private var _928266865rline5:BattleInfoSinglePlayer;
        private var _1100041770lline6:BattleInfoSinglePlayer;
        private var _1237460573groupB:BasicGlowButton;
        private var _928266861rline9:BattleInfoSinglePlayer;
        private var _1100041768lline8:BattleInfoSinglePlayer;
        private var _928266862rline8:BattleInfoSinglePlayer;
        private var _1100041775lline1:BattleInfoSinglePlayer;
        public var _BattleInfoCanvas_Image2:Image;
        public var _BattleInfoCanvas_Image5:Image;
        public var _BattleInfoCanvas_Image6:Image;
        private var _1100041771lline5:BattleInfoSinglePlayer;
        public var _BattleInfoCanvas_Image3:Image;
        public var _BattleInfoCanvas_Image4:Image;
        private var _928266866rline4:BattleInfoSinglePlayer;
        private var _2053377414battleInfo:BasicTitleCanvas;
        public var _BattleInfoCanvas_Image1:Image;
        private var _1237460574groupA:BasicGlowButton;
        private var _321863295refreshBtn:BasicDelayButton;
        private var checkMove:Boolean = true;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":550,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"battleInfo"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"groupA",
                        "events":{"click":"__groupA_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "width":70,
                                "y":33
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"groupB",
                        "events":{"click":"__groupB_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "85";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "styleName":"HorizontalTab",
                                "width":70,
                                "y":33
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"refreshBtn",
                        "events":{"click":"__refreshBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "45";
                            this.top = "33";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnNormalBlue"});
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vs",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":540,
                                "height":375,
                                "x":5,
                                "y":55,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_BattleInfoCanvas_Image1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "54";
                                                    this.top = "25";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_BattleInfoCanvas_Image2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "185";
                                                    this.top = "25";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_BattleInfoCanvas_Image3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.verticalCenter = "0";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":25,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":85,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":145,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":205,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":265,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":25,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":85,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":145,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":205,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"lline9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":265,
                                                        "width":215
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
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_BattleInfoCanvas_Image4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "54";
                                                    this.top = "25";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_BattleInfoCanvas_Image5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "185";
                                                    this.top = "25";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_BattleInfoCanvas_Image6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.verticalCenter = "0";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":25,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":85,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":145,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":205,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":265,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":25,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":85,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":145,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":205,
                                                        "width":215
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BattleInfoSinglePlayer,
                                                "id":"rline9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":290,
                                                        "y":265,
                                                        "width":215
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
        private var _core:Core = Core.getInstance();
        private var leftData:Object = {};
        private var rightData:Object = {};
        private var yArr:Array = [175, 115, 235, 55, 295];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function BattleInfoCanvas()
        {
            mx_internal::_document = this;
            this.width = 550;
            this.height = 450;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BattleInfoCanvas._watcherSetupUtil = _arg_1;
        }


        public function set lline6(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041770lline6;
            if (_local_2 !== _arg_1)
            {
                this._1100041770lline6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lline4():BattleInfoSinglePlayer
        {
            return (this._1100041772lline4);
        }

        public function set refreshBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._321863295refreshBtn;
            if (_local_2 !== _arg_1)
            {
                this._321863295refreshBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshBtn", _local_2, _arg_1));
            };
        }

        public function set lline8(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041768lline8;
            if (_local_2 !== _arg_1)
            {
                this._1100041768lline8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline8", _local_2, _arg_1));
            };
        }

        public function set lline4(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041772lline4;
            if (_local_2 !== _arg_1)
            {
                this._1100041772lline4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline4", _local_2, _arg_1));
            };
        }

        public function set battleInfo(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._2053377414battleInfo;
            if (_local_2 !== _arg_1)
            {
                this._2053377414battleInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleInfo", _local_2, _arg_1));
            };
        }

        public function init():void
        {
            var _local_1:int;
            while (_local_1 < 10)
            {
                this[("lline" + _local_1)].init();
                this[("rline" + _local_1)].init();
                _local_1++;
            };
            checkMove = true;
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        public function set rline1(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266869rline1;
            if (_local_2 !== _arg_1)
            {
                this._928266869rline1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline1", _local_2, _arg_1));
            };
        }

        public function set rline3(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266867rline3;
            if (_local_2 !== _arg_1)
            {
                this._928266867rline3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline3", _local_2, _arg_1));
            };
        }

        public function set rline5(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266865rline5;
            if (_local_2 !== _arg_1)
            {
                this._928266865rline5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline5", _local_2, _arg_1));
            };
        }

        public function set rline6(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266864rline6;
            if (_local_2 !== _arg_1)
            {
                this._928266864rline6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline6", _local_2, _arg_1));
            };
        }

        public function set rline7(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266863rline7;
            if (_local_2 !== _arg_1)
            {
                this._928266863rline7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline7", _local_2, _arg_1));
            };
        }

        public function set rline0(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266870rline0;
            if (_local_2 !== _arg_1)
            {
                this._928266870rline0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline0", _local_2, _arg_1));
            };
        }

        private function refreshPosition(_arg_1:Object):void
        {
            var _local_6:int;
            if (((!(checkMove)) || (!(_arg_1))))
            {
                return;
            };
            var _local_2:Number = 60;
            var _local_3:int;
            var _local_4:int;
            if (((!(_arg_1[3])) && (!(_arg_1[8]))))
            {
                _local_3++;
                if (((!(_arg_1[1])) && (!(_arg_1[6]))))
                {
                    _local_3++;
                };
            };
            if (((!(_arg_1[18])) && (!(_arg_1[13]))))
            {
                _local_4++;
                if (((!(_arg_1[11])) && (!(_arg_1[16]))))
                {
                    _local_4++;
                };
            };
            var _local_5:int;
            while (_local_5 < 10)
            {
                _local_6 = ((_local_5 + 5) % 10);
                this[("lline" + _local_5)].y = (yArr[(_local_5 % 5)] - (_local_2 * _local_3));
                this[("rline" + _local_5)].y = (yArr[(_local_5 % 5)] - (_local_2 * _local_4));
                _local_5++;
            };
            checkMove = false;
        }

        private function refreshData(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_5:Object;
            leftData = {};
            rightData = {};
            var _local_2:* = _core.view.getUI(ViewManager.STAGE_BATTLE);
            if (!_local_2)
            {
                return;
            };
            var _local_3:Object = _local_2.cList;
            if (!_local_3)
            {
                return;
            };
            for each (_local_4 in _local_3)
            {
                _local_5 = _arg_1[_local_4.battleId];
                if (_local_5)
                {
                    if (_local_4.leftSide)
                    {
                        leftData[(_local_4.battleId % 10)] = {
                            "battleBuff":_local_5.keepRound,
                            "data":_local_4,
                            "color":_local_4.getNameTextColor()
                        };
                    }
                    else
                    {
                        rightData[(_local_4.battleId % 10)] = {
                            "battleBuff":_local_5.keepRound,
                            "data":_local_4,
                            "color":_local_4.getNameTextColor()
                        };
                    };
                };
            };
        }

        public function set rline9(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266861rline9;
            if (_local_2 !== _arg_1)
            {
                this._928266861rline9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline9", _local_2, _arg_1));
            };
        }

        public function set rline2(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266868rline2;
            if (_local_2 !== _arg_1)
            {
                this._928266868rline2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline2", _local_2, _arg_1));
            };
        }

        public function __refreshBtn_click(_arg_1:MouseEvent):void
        {
            askBattleInfo();
        }

        public function set rline4(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266866rline4;
            if (_local_2 !== _arg_1)
            {
                this._928266866rline4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline4", _local_2, _arg_1));
            };
        }

        private function refreshGroupData():void
        {
            var _local_4:int;
            var _local_1:Object = leftData;
            var _local_2:Object = rightData;
            var _local_3:int;
            while (_local_3 < 10)
            {
                _local_4 = ((_local_3 + 5) % 10);
                this[("lline" + _local_3)].refresh(_local_1[_local_4]);
                this[("rline" + _local_3)].refresh(_local_2[_local_4]);
                _local_3++;
            };
        }

        public function set rline8(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._928266862rline8;
            if (_local_2 !== _arg_1)
            {
                this._928266862rline8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rline8", _local_2, _arg_1));
            };
        }

        private function onAskBattleInfo(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            refreshData(_arg_1);
            refreshGroupData();
        }

        public function set groupA(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1237460574groupA;
            if (_local_2 !== _arg_1)
            {
                this._1237460574groupA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupA", _local_2, _arg_1));
            };
        }

        public function set groupB(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1237460573groupB;
            if (_local_2 !== _arg_1)
            {
                this._1237460573groupB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupB", _local_2, _arg_1));
            };
        }

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get refreshBtn():BasicDelayButton
        {
            return (this._321863295refreshBtn);
        }

        [Bindable(event="propertyChange")]
        public function get battleInfo():BasicTitleCanvas
        {
            return (this._2053377414battleInfo);
        }

        [Bindable(event="propertyChange")]
        public function get rline0():BattleInfoSinglePlayer
        {
            return (this._928266870rline0);
        }

        public function __groupA_click(_arg_1:MouseEvent):void
        {
            changeGroup(0);
        }

        [Bindable(event="propertyChange")]
        public function get rline2():BattleInfoSinglePlayer
        {
            return (this._928266868rline2);
        }

        [Bindable(event="propertyChange")]
        public function get rline4():BattleInfoSinglePlayer
        {
            return (this._928266866rline4);
        }

        [Bindable(event="propertyChange")]
        public function get rline5():BattleInfoSinglePlayer
        {
            return (this._928266865rline5);
        }

        override public function initialize():void
        {
            var target:BattleInfoCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BattleInfoCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_BattleInfoCanvasWatcherSetupUtil");
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
        public function get rline7():BattleInfoSinglePlayer
        {
            return (this._928266863rline7);
        }

        [Bindable(event="propertyChange")]
        public function get rline1():BattleInfoSinglePlayer
        {
            return (this._928266869rline1);
        }

        [Bindable(event="propertyChange")]
        public function get rline9():BattleInfoSinglePlayer
        {
            return (this._928266861rline9);
        }

        [Bindable(event="propertyChange")]
        public function get rline8():BattleInfoSinglePlayer
        {
            return (this._928266862rline8);
        }

        [Bindable(event="propertyChange")]
        public function get rline3():BattleInfoSinglePlayer
        {
            return (this._928266867rline3);
        }

        public function set lline0(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041776lline0;
            if (_local_2 !== _arg_1)
            {
                this._1100041776lline0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline0", _local_2, _arg_1));
            };
        }

        public function set lline2(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041774lline2;
            if (_local_2 !== _arg_1)
            {
                this._1100041774lline2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline2", _local_2, _arg_1));
            };
        }

        public function set lline3(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041773lline3;
            if (_local_2 !== _arg_1)
            {
                this._1100041773lline3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline3", _local_2, _arg_1));
            };
        }

        public function changeVisible():void
        {
            if (!_core.player.inBattle)
            {
                visible = false;
                return;
            };
            if (visible)
            {
                visible = false;
            }
            else
            {
                askBattleInfo();
            };
        }

        public function set lline7(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041769lline7;
            if (_local_2 !== _arg_1)
            {
                this._1100041769lline7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get groupA():BasicGlowButton
        {
            return (this._1237460574groupA);
        }

        private function _BattleInfoCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.BATTLESTAGE_S[17];
            _local_1 = Language.BATTLESTAGE_S[18];
            _local_1 = Language.BATTLESTAGE_S[19];
            _local_1 = Language.BATTLESTAGE_S[22];
            _local_1 = ResManager.getIconUrl(4130220000285);
            _local_1 = ResManager.getIconUrl(4130220000284);
            _local_1 = ResManager.getIconUrl(4130220000286);
            _local_1 = ResManager.getIconUrl(4130220000285);
            _local_1 = ResManager.getIconUrl(4130220000284);
            _local_1 = ResManager.getIconUrl(4130220000286);
        }

        public function set lline5(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041771lline5;
            if (_local_2 !== _arg_1)
            {
                this._1100041771lline5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get groupB():BasicGlowButton
        {
            return (this._1237460573groupB);
        }

        [Bindable(event="propertyChange")]
        public function get rline6():BattleInfoSinglePlayer
        {
            return (this._928266864rline6);
        }

        private function changeGroup(_arg_1:int):void
        {
            groupA.selected = (_arg_1 == 0);
            groupB.selected = (_arg_1 == 1);
            vs.selectedIndex = _arg_1;
        }

        public function set lline9(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041767lline9;
            if (_local_2 !== _arg_1)
            {
                this._1100041767lline9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline9", _local_2, _arg_1));
            };
        }

        public function set lline1(_arg_1:BattleInfoSinglePlayer):void
        {
            var _local_2:Object = this._1100041775lline1;
            if (_local_2 !== _arg_1)
            {
                this._1100041775lline1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lline1", _local_2, _arg_1));
            };
        }

        private function _BattleInfoCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESTAGE_S[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                battleInfo.text = _arg_1;
            }, "battleInfo.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESTAGE_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                groupA.label = _arg_1;
            }, "groupA.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESTAGE_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                groupB.label = _arg_1;
            }, "groupB.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESTAGE_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                refreshBtn.label = _arg_1;
            }, "refreshBtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000285));
            }, function (_arg_1:Object):void
            {
                _BattleInfoCanvas_Image1.source = _arg_1;
            }, "_BattleInfoCanvas_Image1.source");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000284));
            }, function (_arg_1:Object):void
            {
                _BattleInfoCanvas_Image2.source = _arg_1;
            }, "_BattleInfoCanvas_Image2.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000286));
            }, function (_arg_1:Object):void
            {
                _BattleInfoCanvas_Image3.source = _arg_1;
            }, "_BattleInfoCanvas_Image3.source");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000285));
            }, function (_arg_1:Object):void
            {
                _BattleInfoCanvas_Image4.source = _arg_1;
            }, "_BattleInfoCanvas_Image4.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000284));
            }, function (_arg_1:Object):void
            {
                _BattleInfoCanvas_Image5.source = _arg_1;
            }, "_BattleInfoCanvas_Image5.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000286));
            }, function (_arg_1:Object):void
            {
                _BattleInfoCanvas_Image6.source = _arg_1;
            }, "_BattleInfoCanvas_Image6.source");
            result[9] = binding;
            return (result);
        }

        public function initList(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_2:Object = {};
            for (_local_3 in _arg_1.cList)
            {
                _local_4 = _arg_1.cList[_local_3];
                if (_local_4)
                {
                    _local_2[_local_3] = {
                        "battleBuff":[],
                        "battleId":_local_4.battleId
                    };
                };
            };
            refreshData(_local_2);
            refreshPosition(_arg_1.cList);
            refreshGroupData();
        }

        [Bindable(event="propertyChange")]
        public function get lline0():BattleInfoSinglePlayer
        {
            return (this._1100041776lline0);
        }

        [Bindable(event="propertyChange")]
        public function get lline1():BattleInfoSinglePlayer
        {
            return (this._1100041775lline1);
        }

        [Bindable(event="propertyChange")]
        public function get lline2():BattleInfoSinglePlayer
        {
            return (this._1100041774lline2);
        }

        public function __groupB_click(_arg_1:MouseEvent):void
        {
            changeGroup(1);
        }

        [Bindable(event="propertyChange")]
        public function get lline6():BattleInfoSinglePlayer
        {
            return (this._1100041770lline6);
        }

        [Bindable(event="propertyChange")]
        public function get lline7():BattleInfoSinglePlayer
        {
            return (this._1100041769lline7);
        }

        [Bindable(event="propertyChange")]
        public function get lline9():BattleInfoSinglePlayer
        {
            return (this._1100041767lline9);
        }

        [Bindable(event="propertyChange")]
        public function get lline3():BattleInfoSinglePlayer
        {
            return (this._1100041773lline3);
        }

        private function askBattleInfo():void
        {
            _core.remote.call("battleFieldGetInfo", new Responder(onAskBattleInfo));
            if (!visible)
            {
                visible = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get lline8():BattleInfoSinglePlayer
        {
            return (this._1100041768lline8);
        }

        [Bindable(event="propertyChange")]
        public function get lline5():BattleInfoSinglePlayer
        {
            return (this._1100041771lline5);
        }


    }
}//package com.qeedoo.ui.view.compBattle

