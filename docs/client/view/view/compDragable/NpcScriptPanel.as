// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NpcScriptPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.object.Npc;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ListEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
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

    public class NpcScriptPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2141324026npcIcon:Image;
        private var _info:String;
        private var _1379747202funcList:List;
        private var _241352511button1:BasicGlowButton;
        private var _2141470988npcName:RoundedLabel;
        private var _nid:Number;
        private var _title:String;
        private var _1791483012titleLabel:BasicTitleCanvas;
        private var _177381979infoArea:IntroText;
        private var _177764720funcLabel:RoundedLabel;
        private var _hulaData:Object;
        private var _list:Array;

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
                        "type":BasicGlowButton,
                        "id":"button1",
                        "events":{"click":"__button1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":357.5,
                                "styleName":"BtnStdRed",
                                "x":113.75,
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"npcIcon",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":26,
                                "y":37,
                                "width":50.2,
                                "height":50.2
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
                        "id":"infoArea",
                        "events":{"mouseDown":"__infoArea_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":110,
                                "width":248,
                                "x":14,
                                "y":98
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"funcLabel",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":209
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
                                "y":233
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

        public function NpcScriptPanel()
        {
            mx_internal::_document = this;
            this.width = 278;
            this.height = 398;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NpcScriptPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get npcIcon():Image
        {
            return (this._2141324026npcIcon);
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
            var _local_1:Npc;
            _local_1 = _core.getNpc(_nid);
            if (_local_1)
            {
                npcIcon.source = ResManager.getIconUrl(_local_1.iconCode);
                npcName.text = _local_1.name;
            };
            infoArea.htmlText = _info;
            titleLabel.text = _title;
            funcLabel.text = _title;
            funcList.dataProvider = _list;
        }

        override public function initialize():void
        {
            var target:NpcScriptPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NpcScriptPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_NpcScriptPanelWatcherSetupUtil");
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

        public function __funcList_itemClick(_arg_1:ListEvent):void
        {
            funcClick();
        }

        public function set funcLabel(_arg_1:RoundedLabel):void
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
            var _local_1:Object;
            var _local_2:Array;
            var _local_3:Npc;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            if (!funcList.selectedItem)
            {
                return;
            };
            if (_hulaData)
            {
                _local_1 = _core.getNpc(_hulaData.index);
                if (((_local_1) && (_local_1.npcType == GamePredef.NPC_TYPE_HULA)))
                {
                    if (_local_1.npcType == GamePredef.NPC_TYPE_HULA)
                    {
                        if (funcList.selectedItem.func == HulaPanel.HULA_NPC_SCRIPT_AWARD)
                        {
                            _core.remote.call("hulaNpcAward", null, _local_1.hulaData.index);
                            hide();
                        }
                        else
                        {
                            if (funcList.selectedItem.func == HulaPanel.HULA_NPC_SCRIPT_BATTLE)
                            {
                                _core.remote.call("hulaAskBattle", null, _local_1.hulaData.index);
                                hide();
                            }
                            else
                            {
                                if (funcList.selectedItem.func == HulaPanel.HULA_NPC_SCRIPT_CHANGE)
                                {
                                    _local_2 = [];
                                    _local_2.push({
                                        "func":HulaPanel.HULA_NPC_SCRIPT_CHANGE_RED,
                                        "label":Language.HULA_PANEL[7]
                                    });
                                    _local_2.push({
                                        "func":HulaPanel.HULA_NPC_SCRIPT_CHANGE_YELLOW,
                                        "label":Language.HULA_PANEL[8]
                                    });
                                    _local_2.push({
                                        "func":HulaPanel.HULA_NPC_SCRIPT_CHANGE_GREEN,
                                        "label":Language.HULA_PANEL[10]
                                    });
                                    _local_2.push({
                                        "func":HulaPanel.HULA_NPC_SCRIPT_CHANGE_BLUE,
                                        "label":Language.HULA_PANEL[9]
                                    });
                                    setInfo(_nid, _title, _info, _local_2, _hulaData);
                                }
                                else
                                {
                                    if (funcList.selectedItem.func == HulaPanel.HULA_NPC_SCRIPT_CANCEL)
                                    {
                                        hide();
                                    }
                                    else
                                    {
                                        if (funcList.selectedItem.func == HulaPanel.HULA_NPC_SCRIPT_CHANGE_RED)
                                        {
                                            _core.remote.call("hulaChangeColor", null, _local_1.hulaData.index, 0);
                                            hide();
                                        }
                                        else
                                        {
                                            if (funcList.selectedItem.func == HulaPanel.HULA_NPC_SCRIPT_CHANGE_YELLOW)
                                            {
                                                _core.remote.call("hulaChangeColor", null, _local_1.hulaData.index, 1);
                                                hide();
                                            }
                                            else
                                            {
                                                if (funcList.selectedItem.func == HulaPanel.HULA_NPC_SCRIPT_CHANGE_GREEN)
                                                {
                                                    _core.remote.call("hulaChangeColor", null, _local_1.hulaData.index, 3);
                                                    hide();
                                                }
                                                else
                                                {
                                                    if (funcList.selectedItem.func == HulaPanel.HULA_NPC_SCRIPT_CHANGE_BLUE)
                                                    {
                                                        _core.remote.call("hulaChangeColor", null, _local_1.hulaData.index, 2);
                                                        hide();
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            }
            else
            {
                _local_3 = _core.getNpc(_nid);
                if (((_local_3) && (_local_3.npcType == GamePredef.NPC_TYPE_TRIPLE_TOWN)))
                {
                    _local_4 = _local_3.tripleNpc;
                    _local_5 = funcList.selectedItem;
                    hide();
                    if (((_local_4) && (_local_5.hasOwnProperty("func"))))
                    {
                        _local_6 = _core.view.getUI(ViewManager.PANEL_TRIPLE_TOWN);
                        ((_local_6) && (_local_6.tripleNpcScript(_local_4.instId, _local_5)));
                    };
                }
                else
                {
                    _core.remote.npcScript(funcList.selectedItem.func);
                    hide();
                };
            };
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

        public function __button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        public function setInfo(_arg_1:Number, _arg_2:String, _arg_3:String, _arg_4:Array, _arg_5:Object=null):void
        {
            _nid = _arg_1;
            _title = _arg_2;
            _info = _arg_3;
            _list = _arg_4;
            _hulaData = _arg_5;
            visible = true;
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get funcLabel():RoundedLabel
        {
            return (this._177764720funcLabel);
        }

        [Bindable(event="propertyChange")]
        public function get button1():BasicGlowButton
        {
            return (this._241352511button1);
        }

        private function _NpcScriptPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.NPCFUNCOTHER_U[0];
        }

        public function set infoArea(_arg_1:IntroText):void
        {
            var _local_2:Object = this._177381979infoArea;
            if (_local_2 !== _arg_1)
            {
                this._177381979infoArea = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoArea", _local_2, _arg_1));
            };
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

        public function __funcList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function __infoArea_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        private function _NpcScriptPanel_bindingsSetup():Array
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

        [Bindable(event="propertyChange")]
        public function get infoArea():IntroText
        {
            return (this._177381979infoArea);
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

        public function set titleLabel(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1791483012titleLabel;
            if (_local_2 !== _arg_1)
            {
                this._1791483012titleLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleLabel", _local_2, _arg_1));
            };
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

