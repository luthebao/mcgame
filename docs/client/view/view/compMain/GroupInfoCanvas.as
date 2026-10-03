// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.GroupInfoCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.Repeater;
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.GroupMemberCanvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.binding.RepeatableBinding;
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

    public class GroupInfoCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _GroupInfoCanvas_GroupMemberCanvas1:Array;
        private var _3646rp:Repeater;
        private var _1174397725_GroupInfoCanvas_VBox1:VBox;
        private var _1482965868groupVBox:VBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"groupVBox",
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 3;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Repeater,
                                    "id":"rp",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":GroupMemberCanvas,
                                                "id":"_GroupInfoCanvas_GroupMemberCanvas1",
                                                "events":{"click":"___GroupInfoCanvas_GroupMemberCanvas1_click"}
                                            })]});
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        private var _90794110_core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GroupInfoCanvas()
        {
            mx_internal::_document = this;
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GroupInfoCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get groupVBox():VBox
        {
            return (this._1482965868groupVBox);
        }

        private function set _core(_arg_1:Core):void
        {
            var _local_2:Object = this._90794110_core;
            if (_local_2 !== _arg_1)
            {
                this._90794110_core = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_core", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _core():Core
        {
            return (this._90794110_core);
        }

        public function set _GroupInfoCanvas_VBox1(_arg_1:VBox):void
        {
            var _local_2:Object = this._1174397725_GroupInfoCanvas_VBox1;
            if (_local_2 !== _arg_1)
            {
                this._1174397725_GroupInfoCanvas_VBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_GroupInfoCanvas_VBox1", _local_2, _arg_1));
            };
        }

        private function _GroupInfoCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _core.player.groupAC;
            _local_1 = rp.currentItem;
        }

        override public function initialize():void
        {
            var target:GroupInfoCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GroupInfoCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_GroupInfoCanvasWatcherSetupUtil");
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

        public function refresh():void
        {
            rp.dataProvider = _core.player.groupAC;
        }

        private function onClickHandler(_arg_1:MouseEvent):void
        {
            var _local_2:Object;
            if (!_core.player.isLeader)
            {
                if (_core.player.groupAfk)
                {
                    menuPop([{
                        "id":3,
                        "label":Language.GROUPPANEL_U[11]
                    }, {
                        "id":0,
                        "label":GamePredef.SELF_MENU_LEAVE_G
                    }]);
                }
                else
                {
                    menuPop([{
                        "id":3,
                        "label":Language.GROUPPANEL_U[12]
                    }, {
                        "id":0,
                        "label":GamePredef.SELF_MENU_LEAVE_G
                    }]);
                };
            }
            else
            {
                _local_2 = _arg_1.currentTarget;
                if (_local_2.isLeader)
                {
                    menuPop([{
                        "id":0,
                        "label":GamePredef.SELF_MENU_LEAVE_G
                    }]);
                }
                else
                {
                    if (_core.groupMemberListArr)
                    {
                        if (((_core.groupMemberListArr[_local_2.cid]) && (!(_core.groupMemberListArr[_local_2.cid].groupAfk))))
                        {
                            menuPop([{
                                "id":2,
                                "cid":_local_2.cid,
                                "label":Language.GROUPPANEL_U[0]
                            }, {
                                "id":1,
                                "cid":_local_2.cid,
                                "label":GamePredef.CHAR_MENU_KICK
                            }]);
                        };
                        if (((_core.groupMemberListArr[_local_2.cid]) && (_core.groupMemberListArr[_local_2.cid].groupAfk)))
                        {
                            menuPop([{
                                "id":1,
                                "cid":_local_2.cid,
                                "label":GamePredef.CHAR_MENU_KICK
                            }]);
                        };
                    }
                    else
                    {
                        menuPop([{
                            "id":2,
                            "cid":_local_2.cid,
                            "label":Language.GROUPPANEL_U[0]
                        }, {
                            "id":1,
                            "cid":_local_2.cid,
                            "label":GamePredef.CHAR_MENU_KICK
                        }]);
                    };
                };
            };
        }

        public function ___GroupInfoCanvas_GroupMemberCanvas1_click(_arg_1:MouseEvent):void
        {
            onClickHandler(_arg_1);
        }

        private function groupAfk():void
        {
            var groupAc:ArrayCollection;
            var leader:Charactor;
            var i:* = undefined;
            var can_back:Boolean;
            var dis:Number;
            var func:Function;
            if (!_core.player.groupAfk)
            {
                _core.remote.call("groupAFK", null);
            }
            else
            {
                groupAc = _core.player.groupAC;
                for (i in groupAc)
                {
                    if (((groupAc[i]) && (groupAc[i].isLeader)))
                    {
                        if (groupAc[i].id)
                        {
                            leader = _core.getCharactor(groupAc[i].id);
                        }
                        else
                        {
                            leader = Charactor(groupAc[i]);
                        };
                    };
                };
                can_back = false;
                if (leader)
                {
                    if (leader.posMapId == _core.player.posMapId)
                    {
                        dis = ToolKit.getDisByXY(_core.player.posX, _core.player.posY, leader.posX, leader.posY);
                        if (dis < GamePredef.AFK_CAN_BACK_DIS)
                        {
                            can_back = true;
                        };
                    };
                };
                if (!can_back)
                {
                    if ((((_core.groupMemberListArr) && (_core.groupMemberListArr[_core.cid])) && (_core.groupMemberListArr[_core.cid].groupAfk)))
                    {
                        _core.player.groupAfk = _core.groupMemberListArr[_core.cid].groupAfk;
                    };
                    if (!_core.player.groupAfk)
                    {
                        _core.sysMidNote(Language.GROUPPANEL_U[15]);
                        return;
                    };
                    if (((_core.player.state) && ((_core.player.state == GamePredef.ST_BATTLE) || (_core.player.state == GamePredef.ST_WATCH))))
                    {
                        _core.sysMidNote(Language.GROUPPANEL_U[17]);
                        return;
                    };
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.call("unGroupAFK", null, false);
                        };
                    };
                    Alert.show(Language.GROUPPANEL_U[13], "", (Alert.YES | Alert.NO), null, func);
                }
                else
                {
                    _core.remote.call("unGroupAFK", null, true);
                };
            };
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            var _local_2:Object = _arg_1.target.selectedItem;
            switch (_local_2.id)
            {
                case 0:
                    _core.remote.call("groupLeave", null);
                    break;
                case 1:
                    if (_local_2.cid > 0)
                    {
                        _core.remote.call("groupKick", null, _local_2.cid);
                    };
                    break;
                case 2:
                    if (_local_2.cid > 0)
                    {
                        _core.remote.call("groupGiveLeader", null, _local_2.cid);
                    };
                    break;
                case 3:
                    groupAfk();
                    break;
            };
            Menu(_arg_1.target).removeEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        [Bindable(event="propertyChange")]
        public function get _GroupInfoCanvas_VBox1():VBox
        {
            return (this._1174397725_GroupInfoCanvas_VBox1);
        }

        public function set groupVBox(_arg_1:VBox):void
        {
            var _local_2:Object = this._1482965868groupVBox;
            if (_local_2 !== _arg_1)
            {
                this._1482965868groupVBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupVBox", _local_2, _arg_1));
            };
        }

        private function menuPop(_arg_1:Object):void
        {
            var _local_2:Menu = CustomMenu.createMenu(null, _arg_1);
            _local_2.show(stage.mouseX, stage.mouseY);
            _local_2.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        private function _GroupInfoCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (_core.player.groupAC);
            }, function (_arg_1:Object):void
            {
                rp.dataProvider = _arg_1;
            }, "rp.dataProvider");
            result[0] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Charactor
            {
                return (rp.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Charactor, _arg_2:Array):void
            {
                _GroupInfoCanvas_GroupMemberCanvas1[_arg_2[0]].player = _arg_1;
            }, "_GroupInfoCanvas_GroupMemberCanvas1.player");
            result[1] = binding;
            return (result);
        }

        public function set rp(_arg_1:Repeater):void
        {
            var _local_2:Object = this._3646rp;
            if (_local_2 !== _arg_1)
            {
                this._3646rp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rp():Repeater
        {
            return (this._3646rp);
        }


    }
}//package com.qeedoo.ui.view.compMain

