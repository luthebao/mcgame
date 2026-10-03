// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CrossTeamFightAwardRect

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.ui.view.compDragable.CrossTeamFightPanel;
    import flash.net.Responder;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
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

    public class CrossTeamFightAwardRect extends Canvas implements IBindingClient 
    {

        private static var groupTypeKey:Array = ["A", "B", "C", "D"];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _455921717getAwardBtn:BasicDelayButton;
        private var _33585252protectSlot1:ItemSlot;
        private var _33585253protectSlot2:ItemSlot;
        private var _33585254protectSlot3:ItemSlot;
        private var _33585255protectSlot4:ItemSlot;
        private var _33585256protectSlot5:ItemSlot;
        private var _index:int = -1;
        private var _1870010120titleTxt:String = "";
        private var _116t:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":260,
                    "height":70,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":45,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"t",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "width":60
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"protectSlot1",
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"protectSlot2",
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":115,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"protectSlot3",
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":150,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"protectSlot4",
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":185,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"protectSlot5",
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":220,
                                            "movable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"getAwardBtn",
                        "events":{"click":"__getAwardBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "2";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "visible":true,
                                "y":45,
                                "width":75,
                                "height":20
                            });
                        }
                    })]
                });
            }
        });
        private var members:Object = {};
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossTeamFightAwardRect()
        {
            mx_internal::_document = this;
            this.width = 260;
            this.height = 70;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossTeamFightAwardRect._watcherSetupUtil = _arg_1;
        }


        private function getAllChampionMembers(_arg_1:Object):Object
        {
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:String;
            var _local_7:Object;
            if ((((!(_arg_1)) || (!(_arg_1.team))) || (!(_arg_1.list))))
            {
                return ({});
            };
            var _local_2:Object = {};
            for each (_local_3 in _arg_1.list)
            {
                if ((((_local_3) && (_local_3[2])) && (_local_3[2][0])))
                {
                    _local_4 = _local_3[2][0].win;
                    _local_5 = 0;
                    while (_local_5 < groupTypeKey.length)
                    {
                        _local_6 = groupTypeKey[_local_5];
                        if (_arg_1.team[_local_6])
                        {
                            _local_7 = _arg_1.team[_local_6][_local_4];
                            if (!((!(_local_7)) || (!(_local_7.members))))
                            {
                                if (!((!(_local_7.members[_core.player.id])) || (!(_local_7.members[_core.player.id].getAward))))
                                {
                                    objJoin(_local_2, _local_7.members);
                                    break;
                                };
                            };
                        };
                        _local_5++;
                    };
                };
            };
            return (_local_2);
        }

        private function getFinalChampionMembers(_arg_1:String, _arg_2:Object):Object
        {
            if (((((((!(_arg_2)) || (!(_arg_2.team))) || (!(_arg_2.list))) || (!(_arg_2.list[_arg_1]))) || (!(_arg_2.list[_arg_1][2]))) || (!(_arg_2.list[_arg_1][2][0]))))
            {
                return ({});
            };
            var _local_3:Number = _arg_2.list[_arg_1][2][0].win;
            var _local_4:Object = _arg_2.team[_arg_1][_local_3];
            if (!_local_4)
            {
                return ({});
            };
            return (_local_4.members);
        }

        private function getAllFinalFour(_arg_1:Object):Object
        {
            var _local_4:Object;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Object;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Object;
            var _local_11:String;
            var _local_12:int;
            if ((((!(_arg_1)) || (!(_arg_1.team))) || (!(_arg_1.list))))
            {
                return ({});
            };
            var _local_2:Object = {};
            var _local_3:Number = ((CrossTeamFightPanel.original_server_id * 1000000000000) + _core.player.id);
            for each (_local_4 in _arg_1.list)
            {
                if (!(((!(_local_4)) || (!(_local_4[2]))) || (!(_local_4[3]))))
                {
                    _local_5 = _local_4[2][0][1];
                    _local_6 = _local_4[2][0][2];
                    for each (_local_7 in _local_4[3])
                    {
                        _local_8 = _local_7[1];
                        _local_9 = _local_7[2];
                        _local_12 = 0;
                        while (_local_12 < groupTypeKey.length)
                        {
                            _local_11 = groupTypeKey[_local_12];
                            if (((!(_local_8 == _local_5)) && (!(_local_8 == _local_6))))
                            {
                                if (_arg_1.team[_local_11])
                                {
                                    _local_10 = _arg_1.team[_local_11][_local_8];
                                    if (!((!(_local_10)) || (!(_local_10.members))))
                                    {
                                        if (!((!(_local_10.members[_local_3])) || (!(_local_10.members[_local_3].getAward))))
                                        {
                                            if (_local_10)
                                            {
                                                objJoin(_local_2, _local_10.members);
                                                break;
                                            };
                                        };
                                    };
                                };
                            };
                            _local_12++;
                        };
                        _local_12 = 0;
                        while (_local_12 < groupTypeKey.length)
                        {
                            _local_11 = groupTypeKey[_local_12];
                            if (((!(_local_9 == _local_5)) && (!(_local_9 == _local_6))))
                            {
                                if (_arg_1.team[_local_11])
                                {
                                    _local_10 = _arg_1.team[_local_11][_local_9];
                                    if (!((!(_local_10)) || (!(_local_10.members))))
                                    {
                                        if (!((!(_local_10.members[_local_3])) || (!(_local_10.members[_local_3].getAward))))
                                        {
                                            if (_local_10)
                                            {
                                                objJoin(_local_2, _local_10.members);
                                                break;
                                            };
                                        };
                                    };
                                };
                            };
                            _local_12++;
                        };
                    };
                };
            };
            return (_local_2);
        }

        private function getOid(_arg_1:Object):void
        {
        }

        private function getFinalAward():void
        {
            _core.remote.call("teamCrossPKGetAward", new Responder(onGetFinalAward), (_index + 1));
        }

        public function __getAwardBtn_click(_arg_1:MouseEvent):void
        {
            getFinalAward();
        }

        override public function initialize():void
        {
            var target:CrossTeamFightAwardRect;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossTeamFightAwardRect_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_CrossTeamFightAwardRectWatcherSetupUtil");
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

        public function set index(_arg_1:int):void
        {
            _index = _arg_1;
        }

        public function refreshItems(_arg_1:Object, _arg_2:Object=null, _arg_3:Object=null):void
        {
            var _local_6:Object;
            var _local_7:int;
            reset();
            if (!_arg_1)
            {
                _arg_1 = {};
            };
            var _local_4:Object = ((_arg_1[_index]) || ({}));
            var _local_5:int = 1;
            for (_local_6 in _local_4)
            {
                if (_local_5 > 5) break;
                _local_7 = _local_4[_local_6];
                if (_local_7)
                {
                    this[("protectSlot" + _local_5)].type = GamePredef.TBL_ITEM_TEMPLATE;
                    this[("protectSlot" + _local_5)].giid = int(_local_6);
                    this[("protectSlot" + _local_5)].enabled = true;
                    this[("protectSlot" + _local_5)].acceptable = false;
                    this[("protectSlot" + _local_5)].visible = true;
                };
                _local_5++;
            };
            refreshWinner(_arg_2, _arg_3);
        }

        private function init():void
        {
            refreshItems({});
        }

        [Bindable(event="propertyChange")]
        public function get getAwardBtn():BasicDelayButton
        {
            return (this._455921717getAwardBtn);
        }

        private function _CrossTeamFightAwardRect_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = titleTxt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t.text = _arg_1;
            }, "t.text");
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
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                protectSlot4.slotType = _arg_1;
            }, "protectSlot4.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                protectSlot5.slotType = _arg_1;
            }, "protectSlot5.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[96];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getAwardBtn.label = _arg_1;
            }, "getAwardBtn.label");
            result[6] = binding;
            return (result);
        }

        private function objJoin(_arg_1:Object, _arg_2:Object):void
        {
            var _local_3:Object;
            if (((!(_arg_1)) || (!(_arg_2))))
            {
                return;
            };
            for (_local_3 in _arg_2)
            {
                _arg_1[_local_3] = _arg_2[_local_3];
            };
        }

        public function set protectSlot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._33585255protectSlot4;
            if (_local_2 !== _arg_1)
            {
                this._33585255protectSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "protectSlot4", _local_2, _arg_1));
            };
        }

        private function reset():void
        {
            var _local_1:int = 1;
            while (_local_1 < 6)
            {
                this[("protectSlot" + _local_1)].type = GamePredef.TBL_ITEM_TEMPLATE;
                this[("protectSlot" + _local_1)].giid = -1;
                this[("protectSlot" + _local_1)].enabled = true;
                this[("protectSlot" + _local_1)].acceptable = false;
                this[("protectSlot" + _local_1)].visible = false;
                _local_1++;
            };
            getAwardBtn.enabled = false;
        }

        public function set protectSlot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._33585256protectSlot5;
            if (_local_2 !== _arg_1)
            {
                this._33585256protectSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "protectSlot5", _local_2, _arg_1));
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

        private function getAllSecondMembers(_arg_1:Object, _arg_2:Boolean):Object
        {
            var _local_5:Object;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:int;
            var _local_10:String;
            var _local_11:Object;
            if ((((!(_arg_1)) || (!(_arg_1.team))) || (!(_arg_1.list))))
            {
                return ({});
            };
            var _local_3:Number = ((CrossTeamFightPanel.original_server_id * 1000000000000) + _core.player.id);
            if (!_arg_2)
            {
                _local_3 = _core.player.id;
            };
            var _local_4:Object = {};
            for each (_local_5 in _arg_1.list)
            {
                if ((((_local_5) && (_local_5[2])) && (_local_5[2][0])))
                {
                    _local_6 = _local_5[2][0][1];
                    _local_7 = _local_5[2][0][2];
                    _local_8 = ((_local_5[2][0].win == _local_6) ? _local_7 : _local_6);
                    _local_9 = 0;
                    while (_local_9 < groupTypeKey.length)
                    {
                        _local_10 = groupTypeKey[_local_9];
                        if (_arg_1.team[_local_10])
                        {
                            _local_11 = _arg_1.team[_local_10][_local_8];
                            if (!((!(_local_11)) || (!(_local_11.members))))
                            {
                                if (!((!(_local_11.members[_local_3])) || (!(_local_11.members[_local_3].getAward))))
                                {
                                    objJoin(_local_4, _local_11.members);
                                    break;
                                };
                            };
                        };
                        _local_9++;
                    };
                };
            };
            return (_local_4);
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

        public function onGetFinalAward(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag)))
            {
                getAwardBtn.enabled = false;
            };
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
        public function get protectSlot1():ItemSlot
        {
            return (this._33585252protectSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get protectSlot2():ItemSlot
        {
            return (this._33585253protectSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get protectSlot3():ItemSlot
        {
            return (this._33585254protectSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get protectSlot4():ItemSlot
        {
            return (this._33585255protectSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get protectSlot5():ItemSlot
        {
            return (this._33585256protectSlot5);
        }

        private function _CrossTeamFightAwardRect_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = titleTxt;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[96];
        }

        public function set getAwardBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._455921717getAwardBtn;
            if (_local_2 !== _arg_1)
            {
                this._455921717getAwardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getAwardBtn", _local_2, _arg_1));
            };
        }

        public function set t(_arg_1:Label):void
        {
            var _local_2:Object = this._116t;
            if (_local_2 !== _arg_1)
            {
                this._116t = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t", _local_2, _arg_1));
            };
        }

        public function set titleTxt(_arg_1:String):void
        {
            var _local_2:Object = this._1870010120titleTxt;
            if (_local_2 !== _arg_1)
            {
                this._1870010120titleTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t():Label
        {
            return (this._116t);
        }

        [Bindable(event="propertyChange")]
        public function get titleTxt():String
        {
            return (this._1870010120titleTxt);
        }

        private function refreshWinner(_arg_1:Object, _arg_2:Object):void
        {
            if (!_arg_2)
            {
                _arg_2 = {};
            };
            if (!_arg_1)
            {
                _arg_1 = {};
            };
            getAwardBtn.enabled = false;
            var _local_3:int = -1;
            var _local_4:Number = _core.player.id;
            if (((_index >= 0) && (_index <= 3)))
            {
                members = getFinalChampionMembers(groupTypeKey[_index], _arg_2);
                _local_3 = 1;
                _local_4 = ((CrossTeamFightPanel.original_server_id * 1000000000000) + _local_4);
            }
            else
            {
                if (_index == 4)
                {
                    members = getAllSecondMembers(_arg_2, true);
                    _local_3 = 2;
                    _local_4 = ((CrossTeamFightPanel.original_server_id * 1000000000000) + _local_4);
                }
                else
                {
                    if (_index == 6)
                    {
                        members = getAllFinalFour(_arg_2);
                        _local_3 = 4;
                        _local_4 = ((CrossTeamFightPanel.original_server_id * 1000000000000) + _local_4);
                    }
                    else
                    {
                        if (_index == 5)
                        {
                            members = getAllChampionMembers(_arg_1);
                            _local_3 = 1;
                        }
                        else
                        {
                            if (_index == 7)
                            {
                                members = getAllSecondMembers(_arg_1, false);
                                _local_3 = 2;
                            };
                        };
                    };
                };
            };
            if ((((members[_local_4]) && (!(members[_local_4].getAward == null))) && (members[_local_4].getAward == _local_3)))
            {
                getAwardBtn.enabled = true;
            }
            else
            {
                getAwardBtn.enabled = false;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

