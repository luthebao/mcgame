// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NpcFuncOther

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.game.object.Npc;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.collections.ArrayCollection;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ListEvent;
    import com.qeedoo.game.object.Player;
    import mx.controls.Alert;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.MouseEvent;
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

    public class NpcFuncOther extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2141324026npcIcon:Image;
        private var _1379747202funcList:List;
        private var _3237038info:IntroText;
        private var moneyNum:int;
        private var _241352511button1:BasicGlowButton;
        private var _2141470988npcName:RoundedLabel;
        private var _1791483012titleLabel:BasicTitleCanvas;
        private var _177764720funcLabel:BasicTxtButton;
        public var npc:Npc;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":278,
                    "height":398,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"titleLabel"
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"npcIcon",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":26,
                                "y":37,
                                "width":50.2,
                                "height":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"npcName",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":84.2,
                                "y":35,
                                "text":"Label",
                                "width":172.8
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"info",
                        "events":{"mouseDown":"__info_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":117,
                                "width":0xFF,
                                "x":11,
                                "y":93
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"funcLabel",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":22,
                                "y":215,
                                "width":120,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":List,
                        "id":"funcList",
                        "events":{
                            "mouseDown":"__funcList_mouseDown",
                            "itemClick":"__funcList_itemClick"
                        },
                        "stylesFactory":function ():void
                        {
                            this.verticalAlign = "middle";
                            this.backgroundAlpha = 0;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "width":213,
                                "horizontalScrollPolicy":"off",
                                "height":120,
                                "x":32,
                                "y":241
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"button1",
                        "events":{"click":"__button1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":364.5,
                                "styleName":"BtnStdRed",
                                "x":113.75,
                                "width":50
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

        public function NpcFuncOther()
        {
            mx_internal::_document = this;
            this.width = 278;
            this.height = 398;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NpcFuncOther._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get funcList():List
        {
            return (this._1379747202funcList);
        }

        [Bindable(event="propertyChange")]
        public function get titleLabel():BasicTitleCanvas
        {
            return (this._1791483012titleLabel);
        }

        public function set funcList(_arg_1:List):void
        {
            var _local_2:Object = this._1379747202funcList;
            if (_local_2 !== _arg_1)
            {
                this._1379747202funcList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "funcList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get npcName():RoundedLabel
        {
            return (this._2141470988npcName);
        }

        private function updateView():void
        {
            var _local_1:ArrayCollection;
            var _local_2:Array;
            var _local_3:String;
            var _local_4:Array;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            clearView();
            if (npc)
            {
                npcIcon.source = ResManager.getIconUrl(npc.iconCode);
                npcName.text = npc.name;
                info.htmlText = npc.onServiceText;
                _local_1 = new ArrayCollection();
                if (npc.npcType == GamePredef.NPC_TYPE_HEAL)
                {
                    funcLabel.label = Language.NPCFUNCOTHER_S[0];
                    titleLabel.text = Language.NPCFUNCOTHER_S[1];
                    _local_1.source = [{
                        "type":GamePredef.NPC_TYPE_HEAL,
                        "id":1,
                        "label":Language.NPCFUNCOTHER_S[2]
                    }, {
                        "type":GamePredef.NPC_TYPE_HEAL,
                        "id":2,
                        "label":Language.NPCFUNCOTHER_S[3]
                    }, {
                        "type":GamePredef.NPC_TYPE_HEAL,
                        "id":3,
                        "label":Language.NPCFUNCOTHER_S[4]
                    }];
                }
                else
                {
                    if (((npc.npcType == GamePredef.NPC_TYPE_TRANSPORT) && (String(npc.funcInfo).length > 5)))
                    {
                        funcLabel.label = Language.NPCFUNCOTHER_S[5];
                        titleLabel.text = Language.NPCFUNCOTHER_S[6];
                        _local_2 = String(npc.funcInfo).split("|", 50);
                        if (_local_2)
                        {
                            for (_local_3 in _local_2)
                            {
                                if (((_local_2[_local_3]) && (_local_2[_local_3].length > 5)))
                                {
                                    _local_4 = _local_2[_local_3].split(",");
                                    if (_local_4)
                                    {
                                        _local_1.source.push({
                                            "type":GamePredef.NPC_TYPE_TRANSPORT,
                                            "id":_local_3,
                                            "label":(((_local_4[1] + Language.NPCFUNCOTHER_S[7]) + _local_4[2]) + Language.NPCFUNCOTHER_S[8]),
                                            "money":_local_4[2]
                                        });
                                    };
                                };
                            };
                        };
                    }
                    else
                    {
                        if (npc.npcType == GamePredef.NPC_TYPE_TUTOR)
                        {
                            funcLabel.label = Language.NPCFUNCOTHER_S[23];
                            titleLabel.text = Language.NPCFUNCOTHER_S[24];
                            _local_1.source = [{
                                "type":GamePredef.NPC_TYPE_TUTOR,
                                "id":1,
                                "label":Language.NPCFUNCOTHER_S[25]
                            }];
                        };
                    };
                };
                funcList.dataProvider = _local_1;
            };
        }

        override public function initialize():void
        {
            var target:NpcFuncOther;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NpcFuncOther_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_NpcFuncOtherWatcherSetupUtil");
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

        private function clearView():void
        {
            info.text = "";
            info.htmlText = "";
            funcLabel.label = "";
            npcName.text = "";
            funcList.dataProvider = null;
            npcIcon.source = null;
        }

        public function __funcList_itemClick(_arg_1:ListEvent):void
        {
            funcClick();
        }

        public function set funcLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._177764720funcLabel;
            if (_local_2 !== _arg_1)
            {
                this._177764720funcLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "funcLabel", _local_2, _arg_1));
            };
        }

        private function funcClick():void
        {
            var _local_2:Object;
            var _local_3:Player;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Number;
            var _local_1:* = "";
            if (funcList.selectedItem)
            {
                if (funcList.selectedItem.type == GamePredef.NPC_TYPE_HEAL)
                {
                    _local_2 = _core.battlePet;
                    _local_3 = _core.player;
                    _local_4 = (((GamePredef.BASIC_GET_MONEY[_local_3.level] / 70000) > 1) ? 1 : (GamePredef.BASIC_GET_MONEY[_local_3.level] / 70000));
                    _local_5 = Math.ceil((((_local_3.property.finalHp - _local_3.currentHp) + ((_local_3.property.finalMp - _local_3.currentMp) * 1.3)) * _local_4));
                    if (_local_2)
                    {
                        _local_7 = (((GamePredef.BASIC_GET_MONEY[_local_2.level] / 70000) > 1) ? 1 : (GamePredef.BASIC_GET_MONEY[_local_2.level] / 70000));
                        _local_6 = Math.ceil((((_local_2.property.finalHp - _local_2.currentHp) + ((_local_2.property.finalMp - _local_2.currentMp) * 1.3)) * _local_7));
                    }
                    else
                    {
                        _local_6 = 0;
                    };
                    switch (funcList.selectedItem.id)
                    {
                        case 1:
                            moneyNum = _local_5;
                            if (moneyNum <= 0)
                            {
                                _core.sysMidNote(Language.NPCFUNCOTHER_S[9]);
                                visible = false;
                                return;
                            };
                            _local_1 = Language.NPCFUNCOTHER_S[10];
                            _local_1 = _local_1.replace("{moneyNum}", moneyNum.toString());
                            Alert.show(_local_1, "", 3, this, funcHandler);
                            funcList.enabled = false;
                            break;
                        case 2:
                            if (_core.battlePet)
                            {
                                moneyNum = _local_6;
                            }
                            else
                            {
                                _core.sysMidNote(Language.NPCFUNCOTHER_S[12]);
                                return;
                            };
                            if (moneyNum <= 0)
                            {
                                _core.sysMidNote(Language.NPCFUNCOTHER_S[13]);
                                visible = false;
                                return;
                            };
                            _local_1 = Language.NPCFUNCOTHER_S[14];
                            _local_1 = _local_1.replace("{moneyNum}", moneyNum.toString());
                            Alert.show(_local_1, "", 3, this, funcHandler);
                            funcList.enabled = false;
                            break;
                        case 3:
                            moneyNum = _local_5;
                            if (_core.battlePet)
                            {
                                moneyNum = (moneyNum + _local_6);
                            };
                            if (moneyNum <= 0)
                            {
                                _core.sysMidNote(Language.NPCFUNCOTHER_S[16]);
                                visible = false;
                                return;
                            };
                            _local_1 = Language.NPCFUNCOTHER_S[17];
                            _local_1 = _local_1.replace("{moneyNum}", moneyNum.toString());
                            Alert.show(_local_1, "", 3, this, funcHandler);
                            funcList.enabled = false;
                            break;
                    };
                }
                else
                {
                    if (funcList.selectedItem.type == GamePredef.NPC_TYPE_TRANSPORT)
                    {
                        moneyNum = Number(funcList.selectedItem.money);
                        if (moneyNum > 0)
                        {
                            if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultMoney, 1))
                            {
                                if (moneyNum > _core.player.moneyBind)
                                {
                                    _local_1 = Language.NPCFUNCOTHER_S[19];
                                    _local_1 = _local_1.replace("{money}", GamePredef.CURRENCY_TIP[2]);
                                    _core.sysMidNote(_local_1);
                                    return;
                                };
                            };
                            if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultMoney, 2))
                            {
                                if (moneyNum > _core.player.money)
                                {
                                    _local_1 = Language.NPCFUNCOTHER_S[20];
                                    _local_1 = _local_1.replace("{money}", GamePredef.CURRENCY_TIP[0]);
                                    _core.sysMidNote(_local_1);
                                    return;
                                };
                            };
                        };
                        _core.remote.npcFuncOther(npc.id, funcList.selectedItem.id);
                    }
                    else
                    {
                        if (funcList.selectedItem.type == GamePredef.NPC_TYPE_TUTOR)
                        {
                            _core.remote.npcFuncOther(npc.id, funcList.selectedItem.id);
                            this.visible = false;
                        };
                    };
                };
            };
        }

        public function __button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        public function setNpc(_arg_1:Npc):void
        {
            if (!_arg_1)
            {
                return;
            };
            npc = _arg_1;
            visible = true;
            updateView();
        }

        public function set npcName(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2141470988npcName;
            if (_local_2 !== _arg_1)
            {
                this._2141470988npcName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npcName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get funcLabel():BasicTxtButton
        {
            return (this._177764720funcLabel);
        }

        [Bindable(event="propertyChange")]
        public function get info():IntroText
        {
            return (this._3237038info);
        }

        [Bindable(event="propertyChange")]
        public function get button1():BasicGlowButton
        {
            return (this._241352511button1);
        }

        private function tutorConfirmHandler(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.confirmTutor();
            };
        }

        public function __funcList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            updateView();
        }

        private function _NpcFuncOther_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NPCFUNCOTHER_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button1.label = _arg_1;
            }, "button1.label");
            result[0] = binding;
            return (result);
        }

        public function set info(_arg_1:IntroText):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        public function tutorFuncAlert():void
        {
            Alert.show(Language.NPCFUNCOTHER_S[26], "", 3, null, tutorConfirmHandler);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (visible == false)
            {
                initView();
            };
        }

        private function funcHandler(_arg_1:CloseEvent):void
        {
            funcList.enabled = true;
            var _local_2:* = "";
            if (_arg_1.detail == Alert.YES)
            {
                if (funcList.selectedItem)
                {
                    if (funcList.selectedItem.type == GamePredef.NPC_TYPE_HEAL)
                    {
                        if (moneyNum > 0)
                        {
                            if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultMoney, 1))
                            {
                                if (moneyNum > _core.player.moneyBind)
                                {
                                    _local_2 = Language.NPCFUNCOTHER_S[21];
                                    _local_2 = _local_2.replace("{money}", GamePredef.CURRENCY_TIP[2]);
                                    _core.sysMidNote(_local_2);
                                    return;
                                };
                            };
                            if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultMoney, 2))
                            {
                                if (moneyNum > _core.player.money)
                                {
                                    _local_2 = Language.NPCFUNCOTHER_S[22];
                                    _local_2 = _local_2.replace("{money}", GamePredef.CURRENCY_TIP[0]);
                                    _core.sysMidNote(_local_2);
                                    return;
                                };
                            };
                            _core.remote.npcFuncOther(npc.id, funcList.selectedItem.id);
                        };
                    }
                    else
                    {
                        if (funcList.selectedItem.type == GamePredef.NPC_TYPE_TUTOR)
                        {
                            _core.remote.confirmTutor();
                        };
                    };
                };
            };
        }

        private function _NpcFuncOther_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.NPCFUNCOTHER_U[0];
        }

        public function set npcIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._2141324026npcIcon;
            if (_local_2 !== _arg_1)
            {
                this._2141324026npcIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npcIcon", _local_2, _arg_1));
            };
        }

        public function __info_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        public function set titleLabel(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1791483012titleLabel;
            if (_local_2 !== _arg_1)
            {
                this._1791483012titleLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get npcIcon():Image
        {
            return (this._2141324026npcIcon);
        }

        public function set button1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._241352511button1;
            if (_local_2 !== _arg_1)
            {
                this._241352511button1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button1", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

