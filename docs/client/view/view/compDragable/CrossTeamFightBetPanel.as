// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossTeamFightBetPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Alert;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Image;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.CrossFightPlayerInfo;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.utils.TimeUtil;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.getDefinitionByName;
    import mx.managers.PopUpManager;
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

    public class CrossTeamFightBetPanel extends DragableCanvas implements IBindingClient 
    {

        public static const BET_PARAM:int = 100;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _191981911teamName1:Label;
        private var _helpAlert:Alert;
        public var _CrossTeamFightBetPanel_LinkButton1:LinkButton;
        private var cBet:Object;
        private var _869408038toBet0:BasicDelayButton;
        public var _CrossTeamFightBetPanel_Image1:Image;
        private var _1132101925myTotleBet0:Label;
        private var team1Data:Object;
        private var _25573781timeStart:Label;
        public var _CrossTeamFightBetPanel_Label10:Label;
        private var _1060576884myBet1:TextInput;
        private var tBet:Object;
        private var _649440709member12:CrossFightPlayerInfo;
        private var _649440708member13:CrossFightPlayerInfo;
        private var _1313943351timeNow:Label;
        private var _269365902totleBet1:Label;
        private var _649440711member10:CrossFightPlayerInfo;
        private var _1132101926myTotleBet1:Label;
        private var _649440710member11:CrossFightPlayerInfo;
        private var _1060576885myBet0:TextInput;
        private var _269365903totleBet0:Label;
        public var _CrossTeamFightBetPanel_Label7:Label;
        private var team2Data:Object;
        private var _649440739member03:CrossFightPlayerInfo;
        private var _649440741member01:CrossFightPlayerInfo;
        public var _CrossTeamFightBetPanel_TextArea1:TextArea;
        private var _649440740member02:CrossFightPlayerInfo;
        public var _CrossTeamFightBetPanel_TextArea2:TextArea;
        private var _649440742member00:CrossFightPlayerInfo;
        private var _869408037toBet1:BasicDelayButton;
        private var _191981910teamName2:Label;
        private var _110371416title:BasicTitleCanvas;
        private var bid:int = -1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":560,
                    "height":517,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"title"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":220,
                                "height":302,
                                "x":10,
                                "y":45,
                                "styleName":"CanvasBorder",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"teamName1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "5";
                                        this.textAlign = "center";
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                        this.fontSize = 18;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"percentWidth":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossFightPlayerInfo,
                                    "id":"member00",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":15,
                                            "x":5,
                                            "width":222,
                                            "height":72
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossFightPlayerInfo,
                                    "id":"member01",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":80,
                                            "x":5,
                                            "width":222,
                                            "height":72
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossFightPlayerInfo,
                                    "id":"member02",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":145,
                                            "x":5,
                                            "width":222,
                                            "height":72
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossFightPlayerInfo,
                                    "id":"member03",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":210,
                                            "x":5,
                                            "width":222,
                                            "height":72
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_CrossTeamFightBetPanel_Image1",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":110});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"timeNow",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":105,
                                "y":160
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"timeStart",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":105,
                                "y":180
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":220,
                                "height":302,
                                "y":45,
                                "styleName":"CanvasBorder",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"teamName2",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "5";
                                        this.textAlign = "center";
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                        this.fontSize = 18;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"percentWidth":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossFightPlayerInfo,
                                    "id":"member10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":15,
                                            "x":5,
                                            "width":222,
                                            "height":72
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossFightPlayerInfo,
                                    "id":"member11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":80,
                                            "x":5,
                                            "width":222,
                                            "height":72
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossFightPlayerInfo,
                                    "id":"member12",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":145,
                                            "x":5,
                                            "width":222,
                                            "height":72
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossFightPlayerInfo,
                                    "id":"member13",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":210,
                                            "x":5,
                                            "width":222,
                                            "height":72
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":220,
                                "height":130,
                                "x":10,
                                "styleName":"CanvasBorder",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"totleBet0",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "8";
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"percentWidth":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"myTotleBet0",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "25";
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"percentWidth":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextInput,
                                    "id":"myBet0",
                                    "events":{"change":"__myBet0_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "width":80,
                                            "y":50,
                                            "restrict":"0-9",
                                            "maxChars":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossTeamFightBetPanel_Label7",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                        this.fontWeight = "bold";
                                        this.fontSize = 16;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":45,
                                            "x":120,
                                            "y":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"toBet0",
                                    "events":{"click":"__toBet0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnNormalBlue",
                                            "x":165,
                                            "y":50,
                                            "width":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextArea,
                                    "id":"_CrossTeamFightBetPanel_TextArea1",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFF00;
                                        this.borderThickness = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":175,
                                            "height":45,
                                            "x":15,
                                            "y":75
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_CrossTeamFightBetPanel_LinkButton1",
                        "events":{"click":"___CrossTeamFightBetPanel_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.textDecoration = "underline";
                            this.horizontalCenter = "0";
                            this.bottom = "60";
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "height":17
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":220,
                                "height":130,
                                "styleName":"CanvasBorder",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"totleBet1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "8";
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"percentWidth":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"myTotleBet1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "25";
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"percentWidth":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextInput,
                                    "id":"myBet1",
                                    "events":{"change":"__myBet1_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "width":80,
                                            "y":50,
                                            "restrict":"0-9",
                                            "maxChars":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossTeamFightBetPanel_Label10",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                        this.fontWeight = "bold";
                                        this.fontSize = 16;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":45,
                                            "x":120,
                                            "y":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"toBet1",
                                    "events":{"click":"__toBet1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnNormalBlue",
                                            "x":165,
                                            "y":50,
                                            "width":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextArea,
                                    "id":"_CrossTeamFightBetPanel_TextArea2",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFF00;
                                        this.borderThickness = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":175,
                                            "height":45,
                                            "x":15,
                                            "y":75
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

        public function CrossTeamFightBetPanel()
        {
            mx_internal::_document = this;
            this.width = 560;
            this.height = 517;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossTeamFightBetPanel._watcherSetupUtil = _arg_1;
        }


        public function __myBet0_change(_arg_1:Event):void
        {
            inputChange1();
        }

        [Bindable(event="propertyChange")]
        public function get toBet1():BasicDelayButton
        {
            return (this._869408037toBet1);
        }

        public function __toBet1_click(_arg_1:MouseEvent):void
        {
            toBet(1);
        }

        private function toBet(index:int):void
        {
            var num:int;
            var tcid:Number;
            var teamData:Object = ((index == 0) ? team1Data : team2Data);
            if (!teamData)
            {
                return;
            };
            num = BET_PARAM;
            num = (int(this[("myBet" + index)].text) * BET_PARAM);
            if (num <= 0)
            {
                return;
            };
            tcid = teamData.leaderId;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("teamCrossPKBetOne", new Responder(onTeamCrossPKBet), bid, num, tcid);
                };
            };
            var str:String = Language.CROSS_FIGHT_PANEL_U[165];
            str = str.replace("{num}", num);
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get member00():CrossFightPlayerInfo
        {
            return (this._649440742member00);
        }

        [Bindable(event="propertyChange")]
        public function get member01():CrossFightPlayerInfo
        {
            return (this._649440741member01);
        }

        [Bindable(event="propertyChange")]
        public function get member03():CrossFightPlayerInfo
        {
            return (this._649440739member03);
        }

        public function set myBet1(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1060576884myBet1;
            if (_local_2 !== _arg_1)
            {
                this._1060576884myBet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myBet1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get member02():CrossFightPlayerInfo
        {
            return (this._649440740member02);
        }

        public function set myBet0(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1060576885myBet0;
            if (_local_2 !== _arg_1)
            {
                this._1060576885myBet0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myBet0", _local_2, _arg_1));
            };
        }

        public function set timeStart(_arg_1:Label):void
        {
            var _local_2:Object = this._25573781timeStart;
            if (_local_2 !== _arg_1)
            {
                this._25573781timeStart = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeStart", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myTotleBet1():Label
        {
            return (this._1132101926myTotleBet1);
        }

        public function set member00(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._649440742member00;
            if (_local_2 !== _arg_1)
            {
                this._649440742member00 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member00", _local_2, _arg_1));
            };
        }

        public function set member01(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._649440741member01;
            if (_local_2 !== _arg_1)
            {
                this._649440741member01 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member01", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get member10():CrossFightPlayerInfo
        {
            return (this._649440711member10);
        }

        [Bindable(event="propertyChange")]
        public function get member12():CrossFightPlayerInfo
        {
            return (this._649440709member12);
        }

        [Bindable(event="propertyChange")]
        public function get member13():CrossFightPlayerInfo
        {
            return (this._649440708member13);
        }

        public function set member03(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._649440739member03;
            if (_local_2 !== _arg_1)
            {
                this._649440739member03 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member03", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get member11():CrossFightPlayerInfo
        {
            return (this._649440710member11);
        }

        public function open(_arg_1:Object, _arg_2:int, _arg_3:int):void
        {
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            reset();
            bid = _arg_1.bid;
            team1Data = _arg_1.team1;
            var _local_4:int;
            if (team1Data)
            {
                teamName1.text = team1Data.teamName;
                _local_5 = team1Data.members;
                for (_local_6 in _local_5)
                {
                    this[("member0" + _local_4++)].refresh({
                        "cname":_local_5[_local_6].cname,
                        "level":_local_5[_local_6].level,
                        "ccode":_local_5[_local_6].iconCode
                    }, {"tarea":team1Data.area});
                };
            };
            team2Data = _arg_1.team2;
            _local_4 = 0;
            if (team2Data)
            {
                teamName2.text = team2Data.teamName;
                _local_7 = team2Data.members;
                for (_local_6 in _local_7)
                {
                    this[("member1" + _local_4++)].refresh({
                        "cname":_local_7[_local_6].cname,
                        "level":_local_7[_local_6].level,
                        "ccode":_local_7[_local_6].iconCode
                    }, {"tarea":team2Data.area});
                };
            };
            timeNow.text = (Language.CROSS_FIGHT_PANEL_U[133] + getSetverTime());
            if (_arg_2 == 0)
            {
                if (_arg_3 >= 5)
                {
                    timeStart.text = (Language.CROSS_FIGHT_PANEL_U[134] + "20:08");
                }
                else
                {
                    timeStart.text = (Language.CROSS_FIGHT_PANEL_U[134] + "20:05");
                };
            }
            else
            {
                timeStart.text = (Language.CROSS_FIGHT_PANEL_U[134] + getNextBattleTime(_arg_2));
            };
            _core.remote.call("teamCrossPKGetTeamBetData", null);
            visible = true;
        }

        public function set myTotleBet1(_arg_1:Label):void
        {
            var _local_2:Object = this._1132101926myTotleBet1;
            if (_local_2 !== _arg_1)
            {
                this._1132101926myTotleBet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myTotleBet1", _local_2, _arg_1));
            };
        }

        private function reset():void
        {
            bid = -1;
            timeNow.text = "";
            timeStart.text = "";
            member00.init();
            member01.init();
            member02.init();
            member10.init();
            member11.init();
            member12.init();
            totleBet0.text = (Language.CROSS_FIGHT_PANEL_U[139] + "0");
            myTotleBet0.text = (Language.CROSS_FIGHT_PANEL_U[140] + "0");
            totleBet1.text = (Language.CROSS_FIGHT_PANEL_U[139] + "0");
            myTotleBet1.text = (Language.CROSS_FIGHT_PANEL_U[140] + "0");
        }

        public function set member02(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._649440740member02;
            if (_local_2 !== _arg_1)
            {
                this._649440740member02 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member02", _local_2, _arg_1));
            };
        }

        public function onTeamCrossPKBet(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[164]);
                refreshTeamData({"data":{
                        "tBet":_arg_1.nObj.tBet,
                        "cBet":_arg_1.nObj.cBet
                    }});
            }
            else
            {
                if (_arg_1.data)
                {
                    _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[_arg_1.data]);
                };
            };
        }

        private function inputChange1():void
        {
            var _local_1:String = myBet0.text;
            _local_1 = (((("<font color='" + GamePredef.TEXTINPUT_COLOR[_local_1.length]) + "'>") + _local_1) + "</font>");
            myBet0.htmlText = _local_1;
        }

        private function inputChange2():void
        {
            var _local_1:String = myBet1.text;
            _local_1 = (((("<font color='" + GamePredef.TEXTINPUT_COLOR[_local_1.length]) + "'>") + _local_1) + "</font>");
            myBet1.htmlText = _local_1;
        }

        public function set teamName2(_arg_1:Label):void
        {
            var _local_2:Object = this._191981910teamName2;
            if (_local_2 !== _arg_1)
            {
                this._191981910teamName2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "teamName2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get title():BasicTitleCanvas
        {
            return (this._110371416title);
        }

        public function set teamName1(_arg_1:Label):void
        {
            var _local_2:Object = this._191981911teamName1;
            if (_local_2 !== _arg_1)
            {
                this._191981911teamName1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "teamName1", _local_2, _arg_1));
            };
        }

        private function getSetverTime():String
        {
            var _local_1:Date = new Date();
            _local_1.setTime(((new Date().getTime() + _core.timeLag) + TimeUtil.timeOSOffSet));
            return (TimeUtil.dateFormatter.format(_local_1));
        }

        public function set myTotleBet0(_arg_1:Label):void
        {
            var _local_2:Object = this._1132101925myTotleBet0;
            if (_local_2 !== _arg_1)
            {
                this._1132101925myTotleBet0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myTotleBet0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get totleBet0():Label
        {
            return (this._269365903totleBet0);
        }

        public function set member10(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._649440711member10;
            if (_local_2 !== _arg_1)
            {
                this._649440711member10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member10", _local_2, _arg_1));
            };
        }

        public function set member11(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._649440710member11;
            if (_local_2 !== _arg_1)
            {
                this._649440710member11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member11", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightBetPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[166];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000243));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightBetPanel_Image1.source = _arg_1;
            }, "_CrossTeamFightBetPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ("*" + BET_PARAM);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightBetPanel_Label7.text = _arg_1;
            }, "_CrossTeamFightBetPanel_Label7.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[137];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                toBet0.label = _arg_1;
            }, "toBet0.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[138];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightBetPanel_TextArea1.htmlText = _arg_1;
            }, "_CrossTeamFightBetPanel_TextArea1.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossTeamFightBetPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_CrossTeamFightBetPanel_LinkButton1.overSkin");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossTeamFightBetPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_CrossTeamFightBetPanel_LinkButton1.upSkin");
            result[6] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossTeamFightBetPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_CrossTeamFightBetPanel_LinkButton1.downSkin");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[135];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightBetPanel_LinkButton1.label = _arg_1;
            }, "_CrossTeamFightBetPanel_LinkButton1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ("*" + BET_PARAM);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightBetPanel_Label10.text = _arg_1;
            }, "_CrossTeamFightBetPanel_Label10.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[137];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                toBet1.label = _arg_1;
            }, "toBet1.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[138];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightBetPanel_TextArea2.htmlText = _arg_1;
            }, "_CrossTeamFightBetPanel_TextArea2.htmlText");
            result[11] = binding;
            return (result);
        }

        public function set member12(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._649440709member12;
            if (_local_2 !== _arg_1)
            {
                this._649440709member12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member12", _local_2, _arg_1));
            };
        }

        public function set member13(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._649440708member13;
            if (_local_2 !== _arg_1)
            {
                this._649440708member13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myTotleBet0():Label
        {
            return (this._1132101925myTotleBet0);
        }

        [Bindable(event="propertyChange")]
        public function get totleBet1():Label
        {
            return (this._269365902totleBet1);
        }

        [Bindable(event="propertyChange")]
        public function get myBet0():TextInput
        {
            return (this._1060576885myBet0);
        }

        override public function initialize():void
        {
            var target:CrossTeamFightBetPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossTeamFightBetPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossTeamFightBetPanelWatcherSetupUtil");
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

        public function set timeNow(_arg_1:Label):void
        {
            var _local_2:Object = this._1313943351timeNow;
            if (_local_2 !== _arg_1)
            {
                this._1313943351timeNow = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeNow", _local_2, _arg_1));
            };
        }

        public function ___CrossTeamFightBetPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        [Bindable(event="propertyChange")]
        public function get timeStart():Label
        {
            return (this._25573781timeStart);
        }

        public function refreshTeamData(_arg_1:Object):void
        {
            tBet = _arg_1.data.tBet;
            cBet = _arg_1.data.cBet;
            if (tBet)
            {
                if (tBet[team1Data.leaderId])
                {
                    totleBet0.text = (Language.CROSS_FIGHT_PANEL_U[139] + tBet[team1Data.leaderId].num);
                };
                if (tBet[team2Data.leaderId])
                {
                    totleBet1.text = (Language.CROSS_FIGHT_PANEL_U[139] + tBet[team2Data.leaderId].num);
                };
            };
            if (cBet)
            {
                if (cBet[team1Data.leaderId])
                {
                    myTotleBet0.text = (Language.CROSS_FIGHT_PANEL_U[140] + cBet[team1Data.leaderId].bet);
                };
                if (cBet[team2Data.leaderId])
                {
                    myTotleBet1.text = (Language.CROSS_FIGHT_PANEL_U[140] + cBet[team2Data.leaderId].bet);
                };
            }
            else
            {
                cBet = {};
            };
        }

        [Bindable(event="propertyChange")]
        public function get teamName1():Label
        {
            return (this._191981911teamName1);
        }

        [Bindable(event="propertyChange")]
        public function get teamName2():Label
        {
            return (this._191981910teamName2);
        }

        [Bindable(event="propertyChange")]
        public function get myBet1():TextInput
        {
            return (this._1060576884myBet1);
        }

        public function set title(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function set toBet0(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._869408038toBet0;
            if (_local_2 !== _arg_1)
            {
                this._869408038toBet0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "toBet0", _local_2, _arg_1));
            };
        }

        public function __toBet0_click(_arg_1:MouseEvent):void
        {
            toBet(0);
        }

        [Bindable(event="propertyChange")]
        public function get timeNow():Label
        {
            return (this._1313943351timeNow);
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CROSS_FIGHT_PANEL_U[136].toString();
            _helpAlert = Alert.show(_local_1, Language.ASTROLOGIC_PANEL_U[38].toString(), Alert.YES, null, null);
        }

        public function set toBet1(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._869408037toBet1;
            if (_local_2 !== _arg_1)
            {
                this._869408037toBet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "toBet1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get toBet0():BasicDelayButton
        {
            return (this._869408038toBet0);
        }

        public function __myBet1_change(_arg_1:Event):void
        {
            inputChange2();
        }

        public function set totleBet1(_arg_1:Label):void
        {
            var _local_2:Object = this._269365902totleBet1;
            if (_local_2 !== _arg_1)
            {
                this._269365902totleBet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totleBet1", _local_2, _arg_1));
            };
        }

        public function set totleBet0(_arg_1:Label):void
        {
            var _local_2:Object = this._269365903totleBet0;
            if (_local_2 !== _arg_1)
            {
                this._269365903totleBet0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totleBet0", _local_2, _arg_1));
            };
        }

        private function getNextBattleTime(_arg_1:int):String
        {
            if (isNaN(_arg_1))
            {
                return ("");
            };
            var _local_2:Date = new Date();
            _local_2.setTime(_arg_1);
            return (TimeUtil.dateFormatter.format(_local_2));
        }

        private function _CrossTeamFightBetPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[166];
            _local_1 = ResManager.getIconUrl(4130220000243);
            _local_1 = ("*" + BET_PARAM);
            _local_1 = Language.CROSS_FIGHT_PANEL_U[137];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[138];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[135];
            _local_1 = ("*" + BET_PARAM);
            _local_1 = Language.CROSS_FIGHT_PANEL_U[137];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[138];
        }


    }
}//package com.qeedoo.ui.view.compDragable

