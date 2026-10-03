// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossFightTeamInfo

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.CrossFightPlayerInfo;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.controls.Alert;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.view.comp.Slot;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
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

    public class CrossFightTeamInfo extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _CrossFightTeamInfo_Label2:Label;
        public var _CrossFightTeamInfo_Label3:Label;
        public var _CrossFightTeamInfo_Label4:Label;
        private var _112396936vote2:BasicDelayButton;
        private var _948881626member4:CrossFightPlayerInfo;
        private var teamData:Object;
        private var _112396937vote3:BasicDelayButton;
        private var PK_MOBAI_AWARD3_ID:int = 3982;
        private var _948881625member3:CrossFightPlayerInfo;
        private var _33585252protectSlot1:ItemSlot;
        private var _33585253protectSlot2:ItemSlot;
        private var _33585254protectSlot3:ItemSlot;
        private var PK_MOBAI_COST2:int = 10;
        private var PK_MOBAI_COST3:int = 100;
        private var PK_MOBAI_COST1_ID:int = 3983;
        private var _948881624member2:CrossFightPlayerInfo;
        private var _1668760952teamName:Label;
        private var PK_MOBAI_AWARD2_ID:int = 3981;
        private var memberData:Object;
        private var _112396935vote1:BasicDelayButton;
        private var PK_MOBAI_AWARD1_ID:int = 3980;
        private var _948881623member1:CrossFightPlayerInfo;
        private var _948881627member5:CrossFightPlayerInfo;
        private var _110371416title:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"title"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"teamName",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.top = "34";
                            this.fontSize = 18;
                            this.textAlign = "center";
                            this.color = 0xFFFF00;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":0xFF,
                                "height":32
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CrossFightPlayerInfo,
                        "id":"member1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":59,
                                "x":55,
                                "width":222,
                                "height":72
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CrossFightPlayerInfo,
                        "id":"member2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":149,
                                "x":55,
                                "width":222,
                                "height":72
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CrossFightPlayerInfo,
                        "id":"member3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":239,
                                "x":55,
                                "width":222,
                                "height":72
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CrossFightPlayerInfo,
                        "id":"member4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":59,
                                "x":280,
                                "width":222,
                                "height":72
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CrossFightPlayerInfo,
                        "id":"member5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":149,
                                "x":280,
                                "width":222,
                                "height":72
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"protectSlot1",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "-100";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":330,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"protectSlot2",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":330,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"protectSlot3",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "100";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":330,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"vote1",
                        "events":{"click":"__vote1_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "-100";
                            this.bottom = "50";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalRed",
                                "width":90
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"vote2",
                        "events":{"click":"__vote2_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "50";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalRed",
                                "width":90
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"vote3",
                        "events":{"click":"__vote3_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "100";
                            this.bottom = "50";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalRed",
                                "width":90
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_CrossFightTeamInfo_Label2",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "-100";
                            this.bottom = "20";
                            this.textAlign = "center";
                            this.color = 0xFFFF00;
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_CrossFightTeamInfo_Label3",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "20";
                            this.textAlign = "center";
                            this.color = 0xFFFF00;
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_CrossFightTeamInfo_Label4",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "100";
                            this.bottom = "20";
                            this.textAlign = "center";
                            this.color = 0xFFFF00;
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

        public function CrossFightTeamInfo()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 450;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossFightTeamInfo_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossFightTeamInfo._watcherSetupUtil = _arg_1;
        }


        private function toVote(index:int):void
        {
            var cost:int;
            if (((!(teamData)) || (teamData.tid == null)))
            {
                return;
            };
            cost = 0;
            if (index == 0)
            {
                cost = 1;
            }
            else
            {
                if (index == 1)
                {
                    cost = PK_MOBAI_COST2;
                }
                else
                {
                    if (index == 2)
                    {
                        cost = PK_MOBAI_COST3;
                    }
                    else
                    {
                        return;
                    };
                };
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:Object;
                if (_arg_1.detail == Alert.YES)
                {
                    if (index == 0)
                    {
                        _local_2 = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, PK_MOBAI_COST1_ID);
                        if ((((!(_local_2)) || (!(_local_2.slot))) || (_local_2.num < 1)))
                        {
                            ViewManager.getInstance().getUI(ViewManager.MAIN_CHAT).showSystemMsg(Language.CROSS_FIGHT_PANEL_U[35]);
                            return;
                        };
                    }
                    else
                    {
                        if (_core.player.gold < cost)
                        {
                            Alert.show(Language.GUILDCONTRIBPANEL_U[1]);
                        };
                    };
                    _core.remote.call("crossPKMobai", new Responder(onBuy), index, teamData.tid);
                };
            };
            var str:String = Language.CROSS_FIGHT_PANEL_U[36];
            var name:String = Language.CROSS_FIGHT_PANEL_U[37];
            if (index > 0)
            {
                name = Language.GAMEPREDEF_S[49];
            };
            str = str.replace("{num}", cost).replace("{name}", name);
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        private function _CrossFightTeamInfo_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[44];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[29];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[30];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[31];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[49];
            _local_1 = (10 + Language.GAMEPREDEF_S[49]);
            _local_1 = (100 + Language.GAMEPREDEF_S[49]);
        }

        [Bindable(event="propertyChange")]
        public function get vote1():BasicDelayButton
        {
            return (this._112396935vote1);
        }

        override public function initialize():void
        {
            var target:CrossFightTeamInfo;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossFightTeamInfo_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossFightTeamInfoWatcherSetupUtil");
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
        public function get protectSlot1():ItemSlot
        {
            return (this._33585252protectSlot1);
        }

        public function set vote1(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._112396935vote1;
            if (_local_2 !== _arg_1)
            {
                this._112396935vote1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vote1", _local_2, _arg_1));
            };
        }

        public function set vote3(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._112396937vote3;
            if (_local_2 !== _arg_1)
            {
                this._112396937vote3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vote3", _local_2, _arg_1));
            };
        }

        public function set protectSlot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._33585253protectSlot2;
            if (_local_2 !== _arg_1)
            {
                this._33585253protectSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "protectSlot2", _local_2, _arg_1));
            };
        }

        private function _CrossFightTeamInfo_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                protectSlot1.slotType = _arg_1;
            }, "protectSlot1.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                protectSlot2.slotType = _arg_1;
            }, "protectSlot2.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                protectSlot3.slotType = _arg_1;
            }, "protectSlot3.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vote1.label = _arg_1;
            }, "vote1.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vote2.label = _arg_1;
            }, "vote2.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vote3.label = _arg_1;
            }, "vote3.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightTeamInfo_Label2.text = _arg_1;
            }, "_CrossFightTeamInfo_Label2.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (10 + Language.GAMEPREDEF_S[49]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightTeamInfo_Label3.text = _arg_1;
            }, "_CrossFightTeamInfo_Label3.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (100 + Language.GAMEPREDEF_S[49]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightTeamInfo_Label4.text = _arg_1;
            }, "_CrossFightTeamInfo_Label4.text");
            result[9] = binding;
            return (result);
        }

        private function init():void
        {
            if (((teamData) && (memberData)))
            {
                open(teamData, memberData);
            };
            refreshItems();
        }

        [Bindable(event="propertyChange")]
        public function get member4():CrossFightPlayerInfo
        {
            return (this._948881626member4);
        }

        [Bindable(event="propertyChange")]
        public function get vote3():BasicDelayButton
        {
            return (this._112396937vote3);
        }

        private function refreshItems():void
        {
            this["protectSlot1"].type = GamePredef.TBL_ITEM_TEMPLATE;
            this["protectSlot1"].giid = PK_MOBAI_AWARD1_ID;
            this["protectSlot1"].enabled = true;
            this["protectSlot1"].acceptable = false;
            this["protectSlot2"].type = GamePredef.TBL_ITEM_TEMPLATE;
            this["protectSlot2"].giid = PK_MOBAI_AWARD2_ID;
            this["protectSlot2"].enabled = true;
            this["protectSlot2"].acceptable = false;
            this["protectSlot3"].type = GamePredef.TBL_ITEM_TEMPLATE;
            this["protectSlot3"].giid = PK_MOBAI_AWARD3_ID;
            this["protectSlot3"].enabled = true;
            this["protectSlot3"].acceptable = false;
        }

        public function set teamName(_arg_1:Label):void
        {
            var _local_2:Object = this._1668760952teamName;
            if (_local_2 !== _arg_1)
            {
                this._1668760952teamName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "teamName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get teamName():Label
        {
            return (this._1668760952teamName);
        }

        private function onBuy(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:String = Language.CROSS_FIGHT_PANEL_U[(38 + _arg_1)];
            Alert.show(_local_2, "", Alert.YES, null, null);
        }

        public function __vote2_click(_arg_1:MouseEvent):void
        {
            toVote(1);
        }

        public function set member3(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._948881625member3;
            if (_local_2 !== _arg_1)
            {
                this._948881625member3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member3", _local_2, _arg_1));
            };
        }

        public function set member4(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._948881626member4;
            if (_local_2 !== _arg_1)
            {
                this._948881626member4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member4", _local_2, _arg_1));
            };
        }

        public function set member5(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._948881627member5;
            if (_local_2 !== _arg_1)
            {
                this._948881627member5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member5", _local_2, _arg_1));
            };
        }

        public function set member2(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._948881624member2;
            if (_local_2 !== _arg_1)
            {
                this._948881624member2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member2", _local_2, _arg_1));
            };
        }

        public function set vote2(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._112396936vote2;
            if (_local_2 !== _arg_1)
            {
                this._112396936vote2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vote2", _local_2, _arg_1));
            };
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

        [Bindable(event="propertyChange")]
        public function get vote2():BasicDelayButton
        {
            return (this._112396936vote2);
        }

        public function set member1(_arg_1:CrossFightPlayerInfo):void
        {
            var _local_2:Object = this._948881623member1;
            if (_local_2 !== _arg_1)
            {
                this._948881623member1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get protectSlot3():ItemSlot
        {
            return (this._33585254protectSlot3);
        }

        public function set protectSlot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._33585252protectSlot1;
            if (_local_2 !== _arg_1)
            {
                this._33585252protectSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "protectSlot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get member1():CrossFightPlayerInfo
        {
            return (this._948881623member1);
        }

        [Bindable(event="propertyChange")]
        public function get member2():CrossFightPlayerInfo
        {
            return (this._948881624member2);
        }

        private function refresh():void
        {
            teamName.text = teamData.tname;
            member1.refresh(memberData[1], teamData);
            member2.refresh(memberData[2], teamData);
            member3.refresh(memberData[3], teamData);
            member4.refresh(memberData[4], teamData);
            member5.refresh(memberData[5], teamData);
        }

        [Bindable(event="propertyChange")]
        public function get title():BasicTitleCanvas
        {
            return (this._110371416title);
        }

        [Bindable(event="propertyChange")]
        public function get member3():CrossFightPlayerInfo
        {
            return (this._948881625member3);
        }

        [Bindable(event="propertyChange")]
        public function get protectSlot2():ItemSlot
        {
            return (this._33585253protectSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get member5():CrossFightPlayerInfo
        {
            return (this._948881627member5);
        }

        public function set protectSlot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._33585254protectSlot3;
            if (_local_2 !== _arg_1)
            {
                this._33585254protectSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "protectSlot3", _local_2, _arg_1));
            };
        }

        public function __vote1_click(_arg_1:MouseEvent):void
        {
            toVote(0);
        }

        public function ___CrossFightTeamInfo_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __vote3_click(_arg_1:MouseEvent):void
        {
            toVote(2);
        }

        public function open(_arg_1:Object, _arg_2:Object):void
        {
            if (!member1)
            {
                return;
            };
            if (_arg_1)
            {
                teamData = _arg_1;
                memberData = _arg_2;
                refresh();
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

