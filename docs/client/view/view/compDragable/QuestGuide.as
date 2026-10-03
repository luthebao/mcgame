// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.QuestGuide

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.states.SetStyle;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.states.SetProperty;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.game.data.GameData;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.states.State;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.styles.IStyleClient;
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

    public class QuestGuide extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var num:int = 5;
        private var questArr:Array;
        private var _241352511button1:Button;
        private var guideList:Array;
        public var _QuestGuide_SetStyle3:SetStyle;
        public var _QuestGuide_SetStyle4:SetStyle;
        public var _QuestGuide_SetStyle5:SetStyle;
        public var _QuestGuide_SetStyle6:SetStyle;
        public var _QuestGuide_SetStyle7:SetStyle;
        private var _2076756534guideInfo:LinkTextArea;
        public var _QuestGuide_SetProperty2:SetProperty;
        public var _QuestGuide_SetProperty3:SetProperty;
        public var _QuestGuide_SetProperty4:SetProperty;
        public var _QuestGuide_SetProperty6:SetProperty;
        public var _QuestGuide_SetProperty7:SetProperty;
        public var _QuestGuide_SetProperty8:SetProperty;
        public var _QuestGuide_SetProperty5:SetProperty;
        private var _577985790changeButton:Button;
        private var _1221167690infoTitle:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":144,
                    "height":200,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"infoTitle",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.color = 16774324;
                            this.fontSize = 14;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "width":144,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkTextArea,
                        "id":"guideInfo",
                        "stylesFactory":function ():void
                        {
                            this.leading = 5;
                            this.backgroundAlpha = 0;
                            this.borderStyle = "none";
                            this.color = 16774324;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":134,
                                "x":5,
                                "mouseEnabled":false,
                                "mouseChildren":false,
                                "editable":false,
                                "height":175,
                                "y":20,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"changeButton",
                        "events":{
                            "mouseDown":"__changeButton_mouseDown",
                            "click":"__changeButton_click"
                        },
                        "stylesFactory":function ():void
                        {
                            this.paddingBottom = 0;
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                            this.paddingTop = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":true,
                                "y":3,
                                "width":10,
                                "height":10,
                                "styleName":"QuestGuideChange",
                                "x":25,
                                "selected":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"button1",
                        "events":{
                            "mouseDown":"__button1_mouseDown",
                            "click":"__button1_click"
                        },
                        "stylesFactory":function ():void
                        {
                            this.paddingBottom = 0;
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                            this.paddingTop = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":3,
                                "width":10,
                                "height":10,
                                "styleName":"QuestGuideClose",
                                "x":109
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

        public function QuestGuide()
        {
            mx_internal::_document = this;
            this.width = 144;
            this.height = 200;
            this.mouseEnabled = false;
            this.styleName = "CanvasChatOutput";
            this.currentState = "enabled";
            this.states = [_QuestGuide_State1_c(), _QuestGuide_State2_c()];
            this.addEventListener("creationComplete", ___QuestGuide_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            QuestGuide._watcherSetupUtil = _arg_1;
        }


        public function __button1_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        [Bindable(event="propertyChange")]
        public function get changeButton():Button
        {
            return (this._577985790changeButton);
        }

        private function _QuestGuide_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _QuestGuide_SetProperty2 = _local_1;
            _local_1.name = "width";
            BindingManager.executeBindings(this, "_QuestGuide_SetProperty2", _QuestGuide_SetProperty2);
            return (_local_1);
        }

        private function _QuestGuide_SetProperty4_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _QuestGuide_SetProperty4 = _local_1;
            _local_1.name = "x";
            BindingManager.executeBindings(this, "_QuestGuide_SetProperty4", _QuestGuide_SetProperty4);
            return (_local_1);
        }

        public function updateView(_arg_1:Boolean=false):void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:Array;
            var _local_5:Array;
            var _local_6:*;
            var _local_7:int;
            var _local_8:String;
            var _local_9:String;
            var _local_10:String;
            var _local_11:Boolean;
            var _local_12:int;
            var _local_13:String;
            var _local_14:String;
            var _local_15:*;
            var _local_16:String;
            var _local_17:int;
            var _local_18:Object;
            var _local_19:Number;
            var _local_20:Number;
            var _local_21:String;
            var _local_22:String;
            var _local_23:Object;
            var _local_24:String;
            var _local_25:int;
            var _local_26:Number;
            var _local_27:String;
            var _local_28:*;
            var _local_29:Object;
            var _local_30:*;
            var _local_31:int;
            var _local_32:String;
            var _local_33:uint;
            var _local_34:*;
            if (questArr)
            {
                guideInfo.htmlText = "";
                _local_2 = 0;
                guideList = new Array();
                for each (_local_3 in _core.questGuideList)
                {
                    if (_local_3)
                    {
                        guideList.push(_local_3);
                    };
                };
                if (guideList.length <= 0)
                {
                    return;
                };
                _local_4 = guideList.sortOn("taketime", (Array.NUMERIC | Array.DESCENDING));
                _core.lastQuestTime = _local_4[0].taketime;
                _local_5 = new Array();
                for (_local_6 in _local_4)
                {
                    if (((_core.player) && (_core.player.questList)))
                    {
                        _local_5.push(_core.player.questList[_local_4[_local_6].qid]);
                    };
                };
                _local_7 = 0;
                while (_local_7 < _local_5.length)
                {
                    if (_local_5[_local_7])
                    {
                        if (_core.questGuideList[_local_5[_local_7].qid] != null)
                        {
                            if (_core.questGuideList[_local_5[_local_7].qid].guideAble != false)
                            {
                                if (_local_2 >= num)
                                {
                                    return;
                                };
                                _local_2++;
                                _local_8 = "";
                                _local_9 = "";
                                _local_10 = "";
                                _local_11 = true;
                                if (_local_5[_local_7].require)
                                {
                                    for each (_local_15 in _local_5[_local_7].require)
                                    {
                                        if (ToolKit.isEqual(_local_15.kind, GamePredef.QUEST_REQUIRE_ITEM))
                                        {
                                            _local_16 = ((" (0/" + _local_15.num) + ")");
                                            _local_17 = 0;
                                            if (ToolKit.isBigThan(_local_5[_local_7].state, 0))
                                            {
                                                _local_18 = _core.getTemplateData(_local_15.type, _local_15.itemId);
                                                _local_19 = 0;
                                                if (_local_15.q < 0)
                                                {
                                                    _local_19 = _core.getItemNum(_local_15.type, _local_15.itemId).num;
                                                }
                                                else
                                                {
                                                    _local_17 = _core.basic.getColorByQuality(_local_15.q);
                                                    if (_local_17 < 0)
                                                    {
                                                        _local_17 = 0;
                                                    }
                                                    else
                                                    {
                                                        if (_local_17 > 5)
                                                        {
                                                            _local_17 = 5;
                                                        };
                                                    };
                                                    _local_19 = _core.getItemNumByColor(_local_15.type, _local_15.itemId, _local_17).num;
                                                };
                                                if (ToolKit.isBigOrEqual(_local_19, _local_15.num))
                                                {
                                                    _local_16 = Language.QUESTCANVAS_S[4];
                                                }
                                                else
                                                {
                                                    _local_16 = ((((" (" + _local_19) + "/") + _local_15.num) + ")");
                                                    _local_11 = false;
                                                };
                                            };
                                            _local_9 = (_local_9 + (((((((((((("<br> • " + "<font color='") + GamePredef.MSG_ITEM_COLOR[_local_17]) + "'><a href='event:L_") + GamePredef.LINK_TYPE_ARRAY[_local_15.type]) + "|") + _local_15.itemId) + "|") + _local_15.name) + "' >") + _local_15.name) + "</a></font>") + _local_16));
                                        }
                                        else
                                        {
                                            if (ToolKit.isEqual(_local_15.kind, GamePredef.QUEST_REQUIRE_CREATUR))
                                            {
                                                _local_20 = 0;
                                                _local_21 = ((" (0/" + _local_15.num) + ")");
                                                if (_local_5[_local_7].questKill)
                                                {
                                                    for each (_local_23 in _local_5[_local_7].questKill)
                                                    {
                                                        if (((_local_23) && (ToolKit.isEqual(_local_23.creatureId, _local_15.itemId))))
                                                        {
                                                            if (ToolKit.isSmallOrEqual(_local_23.num, 0))
                                                            {
                                                                _local_21 = Language.QUESTCANVAS_S[4];
                                                            }
                                                            else
                                                            {
                                                                _local_20 = ToolKit.minus(_local_15.num, _local_23.num);
                                                                _local_21 = ((((" (" + _local_20) + "/") + _local_15.num) + ")");
                                                                _local_11 = false;
                                                            };
                                                        };
                                                    };
                                                };
                                                if (((_local_5[_local_7].pos) && (_local_5[_local_7].pos.name)))
                                                {
                                                    _local_22 = _local_5[_local_7].pos.name;
                                                }
                                                else
                                                {
                                                    _local_22 = _local_15.creature.name;
                                                };
                                                _local_10 = (_local_10 + (((((((((((("<br> • " + "<font color='") + GamePredef.MSG_EVENTTEXT_COLOR[3]) + "'><a href='event:L_") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CREATURE]) + "|") + _local_15.creature.id) + "|") + _local_22.split("【")[0]) + "' >") + _local_22.split("【")[0]) + "</a></font>") + _local_21));
                                            }
                                            else
                                            {
                                                if (ToolKit.isEqual(_local_15.kind, GamePredef.QUEST_REQUIRE_PET))
                                                {
                                                    _local_24 = ((" (" + _local_15.num) + ")");
                                                    _local_25 = int(_core.basic.colorByGrowRate((_local_15.q / 10)));
                                                    _local_26 = _core.getPetNumByColor(_local_15.itemId, _local_15.name, _local_25);
                                                    _local_27 = GamePredef.MSG_ITEM_COLOR[_local_25];
                                                    if (_local_26 < _local_15.num)
                                                    {
                                                        _local_11 = false;
                                                    };
                                                    _local_21 = ((((" (" + _local_26) + "/") + _local_15.num) + ")");
                                                    _local_10 = (_local_10 + ((((((((((((("<br> • " + "<font color='") + _local_27) + "'>") + "<a href='event:L_") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CREATURE]) + "|") + _local_15.itemId) + "|") + String(_local_15.name).split("【")[0]) + "' >") + String(_local_15.name).split("【")[0]) + "</a></font>") + _local_21));
                                                };
                                            };
                                        };
                                    };
                                    _local_8 = (_local_8 + (_local_9 + _local_10));
                                };
                                if (((!(_local_5[_local_7].require)) || (_local_11)))
                                {
                                    _local_28 = "";
                                    if (ToolKit.isBigThan(_local_5[_local_7].data.finishNpc, 0))
                                    {
                                        _local_28 = (_local_28 + TextUtil.decode((((((((" • " + Language.QUESTCANVAS_S[19]) + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_NPC]) + "|") + _local_5[_local_7].data.finishNpc) + "|") + _local_5[_local_7].fName) + "|0|0|0]")));
                                    }
                                    else
                                    {
                                        if (_local_5[_local_7].data.type == GamePredef.QUEST_TYPE_CLASS)
                                        {
                                            _local_29 = _core.data.gameDataIndex3[GamePredef.TBL_NPC][_core.player.classId];
                                            for (_local_30 in _local_29)
                                            {
                                                _local_31 = _local_30;
                                                _local_32 = _local_29[_local_30].name;
                                                _local_28 = (_local_28 + TextUtil.decode((((((((" • " + Language.QUESTCANVAS_S[19]) + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_NPC]) + "|") + _local_31) + "|") + _local_32) + "|0|0|0]")));
                                                break;
                                            };
                                        };
                                    };
                                    _local_8 = ("<br>" + _local_28);
                                };
                                _local_12 = _local_5[_local_7].data.color;
                                if (ToolKit.isEqual(_local_5[_local_7].data.type, GamePredef.QUEST_TYPE_CALLBOARD))
                                {
                                    _local_12 = _local_5[_local_7].c;
                                };
                                if ((_local_5[_local_7].data.name as String).length > 9)
                                {
                                    _local_13 = (_local_5[_local_7].data.name as String).substr(0, 7);
                                    _local_13 = (_local_13 + "...");
                                }
                                else
                                {
                                    _local_13 = (_local_5[_local_7].data.name as String);
                                };
                                if (_local_5[_local_7].lastTime > 0)
                                {
                                    _local_13 = (_local_13 + Language.QUESTGUIDE_S[1]);
                                };
                                _local_14 = (((((((("<font size='12' color='" + GamePredef.MSG_ITEM_COLOR[_local_12]) + "'><B><a href='event:L_Q|") + _local_5[_local_7].data.id) + "|") + _local_5[_local_7].data.name) + "'>") + _local_13) + "</a></B></font>");
                                guideInfo.htmlText = (guideInfo.htmlText + ((_local_14 + _local_8) + "<br>"));
                                if (((_local_11) && (_arg_1)))
                                {
                                    _local_33 = _local_5[_local_7].data.finishNpc;
                                    _local_34 = GameData.d[GamePredef.TBL_NPC][_local_33];
                                    if (_local_34)
                                    {
                                        if (_local_34.posMapId == _core.player.posMapId)
                                        {
                                            _core.remote.call("setNpcState", null, _local_33);
                                        };
                                    };
                                };
                            };
                        };
                    };
                    _local_7++;
                };
            };
        }

        private function _QuestGuide_SetProperty6_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _QuestGuide_SetProperty6 = _local_1;
            _local_1.name = "y";
            _local_1.value = 2;
            BindingManager.executeBindings(this, "_QuestGuide_SetProperty6", _QuestGuide_SetProperty6);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:QuestGuide;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _QuestGuide_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_QuestGuideWatcherSetupUtil");
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

        private function _QuestGuide_SetProperty8_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _QuestGuide_SetProperty8 = _local_1;
            _local_1.name = "y";
            _local_1.value = 2;
            BindingManager.executeBindings(this, "_QuestGuide_SetProperty8", _QuestGuide_SetProperty8);
            return (_local_1);
        }

        private function _QuestGuide_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "disabled";
            return (_local_1);
        }

        public function set changeButton(_arg_1:Button):void
        {
            var _local_2:Object = this._577985790changeButton;
            if (_local_2 !== _arg_1)
            {
                this._577985790changeButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeButton", _local_2, _arg_1));
            };
        }

        public function ___QuestGuide_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set guideInfo(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._2076756534guideInfo;
            if (_local_2 !== _arg_1)
            {
                this._2076756534guideInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guideInfo", _local_2, _arg_1));
            };
        }

        private function _QuestGuide_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "enabled";
            _local_1.overrides = [_QuestGuide_SetStyle1_c(), _QuestGuide_SetStyle2_c(), _QuestGuide_SetProperty1_c(), _QuestGuide_SetProperty2_i(), _QuestGuide_SetProperty3_i(), _QuestGuide_SetStyle3_i(), _QuestGuide_SetStyle4_i(), _QuestGuide_SetProperty4_i(), _QuestGuide_SetStyle5_i(), _QuestGuide_SetProperty5_i(), _QuestGuide_SetProperty6_i(), _QuestGuide_SetProperty7_i(), _QuestGuide_SetProperty8_i(), _QuestGuide_SetStyle6_i(), _QuestGuide_SetStyle7_i()];
            return (_local_1);
        }

        public function set infoTitle(_arg_1:Label):void
        {
            var _local_2:Object = this._1221167690infoTitle;
            if (_local_2 !== _arg_1)
            {
                this._1221167690infoTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoTitle():Label
        {
            return (this._1221167690infoTitle);
        }

        private function _QuestGuide_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = guideInfo;
            _local_1 = guideInfo;
            _local_1 = guideInfo;
            _local_1 = guideInfo;
            _local_1 = infoTitle;
            _local_1 = infoTitle;
            _local_1 = button1;
            _local_1 = button1;
            _local_1 = changeButton;
            _local_1 = changeButton;
            _local_1 = button1;
            _local_1 = changeButton;
            _local_1 = Language.QUESTGUIDE_S[0];
        }

        private function _QuestGuide_SetStyle1_c():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _local_1.name = "backgroundColor";
            _local_1.value = 0;
            return (_local_1);
        }

        private function init():void
        {
            viewType = ViewManager.TYPE_MAIN;
            guideInfo.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            infoTitle.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            changeButton.toolTip = Language.QUESTMANAGER_S[5];
        }

        public function set button1(_arg_1:Button):void
        {
            var _local_2:Object = this._241352511button1;
            if (_local_2 !== _arg_1)
            {
                this._241352511button1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button1", _local_2, _arg_1));
            };
        }

        private function _QuestGuide_SetStyle7_i():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _QuestGuide_SetStyle7 = _local_1;
            _local_1.name = "horizontalCenter";
            _local_1.value = -45;
            BindingManager.executeBindings(this, "_QuestGuide_SetStyle7", _QuestGuide_SetStyle7);
            return (_local_1);
        }

        public function __changeButton_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        private function viewClear():void
        {
            guideInfo.htmlText = "";
        }

        private function _QuestGuide_SetStyle5_i():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _QuestGuide_SetStyle5 = _local_1;
            _local_1.name = "horizontalCenter";
            _local_1.value = 0;
            BindingManager.executeBindings(this, "_QuestGuide_SetStyle5", _QuestGuide_SetStyle5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get guideInfo():LinkTextArea
        {
            return (this._2076756534guideInfo);
        }

        private function _QuestGuide_SetStyle3_i():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _QuestGuide_SetStyle3 = _local_1;
            _local_1.name = "left";
            _local_1.value = 5;
            BindingManager.executeBindings(this, "_QuestGuide_SetStyle3", _QuestGuide_SetStyle3);
            return (_local_1);
        }

        public function creatureKill(_arg_1:Number, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Array;
            var _local_7:int;
            var _local_8:*;
            var _local_3:Boolean;
            if (_core.player.questList)
            {
                for each (_local_4 in _core.player.questList)
                {
                    if (((_local_4) && (_local_4.questKill)))
                    {
                        for each (_local_5 in _local_4.questKill)
                        {
                            if (((_local_5) && (ToolKit.isEqual(_local_5.creatureId, _arg_1))))
                            {
                                _local_5.num = (_local_5.num - _arg_2);
                                _local_6 = guideList.sortOn("taketime", (Array.NUMERIC | Array.DESCENDING));
                                for (_local_8 in _local_6)
                                {
                                    if (_local_6[_local_8].qid == _local_4.qid)
                                    {
                                        _local_7 = _local_8;
                                        break;
                                    };
                                };
                                if (_local_8 <= (num - 1))
                                {
                                    _local_3 = true;
                                };
                            };
                        };
                    };
                };
            };
            if (_local_3)
            {
                updateView(true);
            };
        }

        private function _QuestGuide_SetProperty1_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "width";
            _local_1.value = 160;
            return (_local_1);
        }

        public function reset():void
        {
            viewClear();
        }

        override public function hide():void
        {
            super.hide();
            _core.player.questGuideAble = false;
            _core.view.getUI(ViewManager.PANEL_QUESTMANAGER).questGuideClose();
        }

        private function _QuestGuide_SetProperty3_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _QuestGuide_SetProperty3 = _local_1;
            _local_1.name = "x";
            BindingManager.executeBindings(this, "_QuestGuide_SetProperty3", _QuestGuide_SetProperty3);
            return (_local_1);
        }

        private function _QuestGuide_SetProperty5_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _QuestGuide_SetProperty5 = _local_1;
            _local_1.name = "x";
            BindingManager.executeBindings(this, "_QuestGuide_SetProperty5", _QuestGuide_SetProperty5);
            return (_local_1);
        }

        private function _QuestGuide_SetProperty7_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _QuestGuide_SetProperty7 = _local_1;
            _local_1.name = "x";
            BindingManager.executeBindings(this, "_QuestGuide_SetProperty7", _QuestGuide_SetProperty7);
            return (_local_1);
        }

        private function _QuestGuide_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (guideInfo);
            }, function (_arg_1:Object):void
            {
                _QuestGuide_SetProperty2.target = _arg_1;
            }, "_QuestGuide_SetProperty2.target");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (guideInfo);
            }, function (_arg_1:Object):void
            {
                _QuestGuide_SetProperty3.target = _arg_1;
            }, "_QuestGuide_SetProperty3.target");
            result[1] = binding;
            binding = new Binding(this, function ():IStyleClient
            {
                return (guideInfo);
            }, function (_arg_1:IStyleClient):void
            {
                _QuestGuide_SetStyle3.target = _arg_1;
            }, "_QuestGuide_SetStyle3.target");
            result[2] = binding;
            binding = new Binding(this, function ():IStyleClient
            {
                return (guideInfo);
            }, function (_arg_1:IStyleClient):void
            {
                _QuestGuide_SetStyle4.target = _arg_1;
            }, "_QuestGuide_SetStyle4.target");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (infoTitle);
            }, function (_arg_1:Object):void
            {
                _QuestGuide_SetProperty4.target = _arg_1;
            }, "_QuestGuide_SetProperty4.target");
            result[4] = binding;
            binding = new Binding(this, function ():IStyleClient
            {
                return (infoTitle);
            }, function (_arg_1:IStyleClient):void
            {
                _QuestGuide_SetStyle5.target = _arg_1;
            }, "_QuestGuide_SetStyle5.target");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (button1);
            }, function (_arg_1:Object):void
            {
                _QuestGuide_SetProperty5.target = _arg_1;
            }, "_QuestGuide_SetProperty5.target");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (button1);
            }, function (_arg_1:Object):void
            {
                _QuestGuide_SetProperty6.target = _arg_1;
            }, "_QuestGuide_SetProperty6.target");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (changeButton);
            }, function (_arg_1:Object):void
            {
                _QuestGuide_SetProperty7.target = _arg_1;
            }, "_QuestGuide_SetProperty7.target");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (changeButton);
            }, function (_arg_1:Object):void
            {
                _QuestGuide_SetProperty8.target = _arg_1;
            }, "_QuestGuide_SetProperty8.target");
            result[9] = binding;
            binding = new Binding(this, function ():IStyleClient
            {
                return (button1);
            }, function (_arg_1:IStyleClient):void
            {
                _QuestGuide_SetStyle6.target = _arg_1;
            }, "_QuestGuide_SetStyle6.target");
            result[10] = binding;
            binding = new Binding(this, function ():IStyleClient
            {
                return (changeButton);
            }, function (_arg_1:IStyleClient):void
            {
                _QuestGuide_SetStyle7.target = _arg_1;
            }, "_QuestGuide_SetStyle7.target");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTGUIDE_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                infoTitle.text = _arg_1;
            }, "infoTitle.text");
            result[12] = binding;
            return (result);
        }

        private function changeState():void
        {
            if (currentState == "enabled")
            {
                currentState = "disabled";
                changeButton.selected = false;
                guideInfo.height = 0;
                changeButton.toolTip = Language.QUESTMANAGER_S[6];
            }
            else
            {
                currentState = "enabled";
                changeButton.selected = true;
                guideInfo.height = 175;
                changeButton.toolTip = Language.QUESTMANAGER_S[5];
            };
        }

        public function checkPoint(_arg_1:int, _arg_2:int):Boolean
        {
            if (this.visible == false)
            {
                return (false);
            };
            return (guideInfo.checkPoint(_arg_1, _arg_2));
        }

        private function _QuestGuide_SetStyle4_i():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _QuestGuide_SetStyle4 = _local_1;
            _local_1.name = "right";
            _local_1.value = 5;
            BindingManager.executeBindings(this, "_QuestGuide_SetStyle4", _QuestGuide_SetStyle4);
            return (_local_1);
        }

        public function updateQuestGuide():void
        {
            var _local_1:Object;
            var _local_2:Array;
            if (_core.player.questList)
            {
                questArr = new Array();
                for each (_local_1 in _core.player.questList)
                {
                    if (_local_1)
                    {
                        _local_1.takeDate = Number(_local_1.takeDate);
                        questArr.push(_local_1);
                    };
                };
                _local_2 = questArr.sortOn("takeDate", (Array.NUMERIC | Array.DESCENDING));
                updateView();
            }
            else
            {
                viewClear();
            };
        }

        public function __button1_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        private function _QuestGuide_SetStyle6_i():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _QuestGuide_SetStyle6 = _local_1;
            _local_1.name = "horizontalCenter";
            _local_1.value = 45;
            BindingManager.executeBindings(this, "_QuestGuide_SetStyle6", _QuestGuide_SetStyle6);
            return (_local_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                if (((_core.player) && (_core.player.questGuideAble)))
                {
                    super.visible = _arg_1;
                };
            }
            else
            {
                super.visible = _arg_1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get button1():Button
        {
            return (this._241352511button1);
        }

        private function _QuestGuide_SetStyle2_c():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _local_1.name = "backgroundAlpha";
            _local_1.value = 0.1;
            return (_local_1);
        }

        public function __changeButton_click(_arg_1:MouseEvent):void
        {
            changeState();
        }

        override public function show():void
        {
            visible = true;
        }


    }
}//package com.qeedoo.ui.view.compDragable

