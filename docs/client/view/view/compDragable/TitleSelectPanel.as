// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TitleSelectPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.ViewStack;
    import mx.collections.ArrayCollection;
    import mx.controls.TextArea;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.ui.resource.ResManager;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.BuffParser;
    import com.qeedoo.game.data.GameData;
    import mx.events.ListEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class TitleSelectPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _103710260setButton:BasicGlowButton;
        private var _3773vs:ViewStack;
        private var ac:ArrayCollection;
        private var _861039529actUnSetButton:BasicGlowButton;
        private var actTitlesAc:ArrayCollection;
        private var _2118849637unSetButton:BasicGlowButton;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _titleList:Object;
        private var _3237038info:TextArea;
        private var firstTimeFlag:Boolean = true;
        private var _673810084actTitleList:List;
        public var _TitleSelectPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2135991530titleList:List;
        private var _1381455422actSetButton:BasicGlowButton;
        private var _1162758048actInfo:TextArea;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":260,
                    "height":385,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_TitleSelectPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "39";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19.35,
                                "width":65,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "39";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":86.35,
                                "width":65,
                                "selected":false,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vs",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "60";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":305,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"titleList",
                                                "events":{
                                                    "click":"__titleList_click",
                                                    "itemClick":"__titleList_itemClick"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.top = "10";
                                                    this.left = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":140});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"info",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.color = 0xFFFFFF;
                                                    this.top = "160";
                                                    this.left = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "editable":false,
                                                        "selectable":false,
                                                        "height":96
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"setButton",
                                                "events":{"click":"__setButton_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.bottom = "10";
                                                    this.right = "125";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":95
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"unSetButton",
                                                "events":{"click":"__unSetButton_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.bottom = "10";
                                                    this.left = "125";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":95
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"creationComplete":"___TitleSelectPanel_Canvas2_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"actTitleList",
                                                "events":{
                                                    "click":"__actTitleList_click",
                                                    "itemClick":"__actTitleList_itemClick"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.top = "10";
                                                    this.left = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":140,
                                                        "labelField":"n"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"actInfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.color = 0xFFFFFF;
                                                    this.top = "160";
                                                    this.left = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "editable":false,
                                                        "selectable":false,
                                                        "height":96
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"actSetButton",
                                                "events":{"click":"__actSetButton_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.bottom = "10";
                                                    this.right = "125";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"actUnSetButton",
                                                "events":{"click":"__actUnSetButton_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.bottom = "10";
                                                    this.left = "125";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":80
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TitleSelectPanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundColor = 0xC9C9C9;
            };
            this.width = 260;
            this.height = 385;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TitleSelectPanel._watcherSetupUtil = _arg_1;
        }


        private function getStyleDescription(_arg_1:String, _arg_2:String):String
        {
            var _local_3:String;
            _local_3 = (((('<font color="#EEEE00">' + Language.TITLESELECTPANEL_S[10]) + "</font><br/>") + _arg_1) + "<br/><br/>");
            if (((_arg_2) && (_arg_2.length > 0)))
            {
                _local_3 = (_local_3 + ((('<font color="#EEEE00">' + Language.TITLESELECTPANEL_S[11]) + "</font><br/>") + _arg_2));
            }
            else
            {
                _local_3 = (_local_3 + ((('<font color="#EEEE00">' + Language.TITLESELECTPANEL_S[11]) + "</font><br/>") + Language.TITLESELECTPANEL_S[12]));
            };
            return (_local_3);
        }

        public function __unSetButton_click(_arg_1:MouseEvent):void
        {
            unSetTitle();
        }

        public function __actTitleList_click(_arg_1:MouseEvent):void
        {
            onActTitleClick(_arg_1);
        }

        private function updateView():void
        {
            var _local_1:Array;
            var _local_2:String;
            var _local_3:Object;
            var _local_4:Class;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:String;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _titleList = {};
            if (((_core.player.ct) && (_core.player.ct.length > 1)))
            {
                _local_1 = _core.player.ct.split("|");
                for each (_local_2 in _local_1)
                {
                    if (((_local_2) && (_local_2.length > 0)))
                    {
                        _local_3 = _core.data.getData(GamePredef.TBL_TITLE, Number(_local_2));
                        if (_local_3)
                        {
                            _titleList[_local_2] = _local_3;
                        };
                    };
                };
            };
            if (_titleList)
            {
                ac = new ArrayCollection();
                for each (_local_5 in _titleList)
                {
                    if (_local_5)
                    {
                        if (ToolKit.isEqual(_local_5.id, _core.player.t))
                        {
                            _local_4 = ResManager.ICON_TITLE_YES;
                        }
                        else
                        {
                            _local_4 = ResManager.ICON_TITLE_NO;
                        };
                        ac.addItem({
                            "label":_local_5.n,
                            "icon":_local_4,
                            "titleData":_local_5
                        });
                    };
                };
                titleList.dataProvider = ac;
                _local_6 = -1;
                for (_local_7 in ac)
                {
                    if (((ac[_local_7]) && (ToolKit.isEqual(ac[_local_7].titleData.id, _core.player.t))))
                    {
                        _local_6 = Number(_local_7);
                    };
                };
                if (_local_6 >= 0)
                {
                    titleList.selectedIndex = _local_6;
                };
            };
            updateActTitleView();
        }

        private function unSetActTitle():void
        {
            if (!actTitleList.selectedItem)
            {
                Alert.show(Language.TITLESELECTPANEL_S[8]);
                return;
            };
            if (actTitleList.selectedItem.id != _core.player.actT)
            {
                return;
            };
            _core.remote.call("setActTitle", new Responder(onSetActTitle), -1);
            actSetButton.selected = false;
            actUnSetButton.selected = false;
        }

        public function onSetActTitle(_arg_1:Object):void
        {
            setButton.enabled = true;
            unSetButton.enabled = true;
            if (((_arg_1) && (_arg_1.f)))
            {
                if (_arg_1.t)
                {
                    _core.player.actT = _arg_1.t;
                };
                updateView();
            };
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        private function onSetTitle(_arg_1:Object):void
        {
            setButton.enabled = true;
            unSetButton.enabled = true;
            if (((_arg_1) && (_arg_1.f)))
            {
                _core.player.t = _arg_1.t;
                if (ToolKit.isBigThan(_arg_1.t, 0))
                {
                    if (_arg_1.bd)
                    {
                        _core.view.getUI(ViewManager.MAIN_LONGBUFF).upLongBuff(_arg_1.bd);
                    }
                    else
                    {
                        _core.view.getUI(ViewManager.MAIN_LONGBUFF).delBuff(0);
                    };
                }
                else
                {
                    _core.view.getUI(ViewManager.MAIN_LONGBUFF).delBuff(0);
                };
                _core.view.getUI(ViewManager.PANEL_CHARACTOR).updateInfo();
                updateView();
            };
        }

        private function setTitle():void
        {
            if ((((titleList) && (titleList.selectedItem)) && (titleList.selectedItem.titleData)))
            {
                _core.remote.call("setTitle", new Responder(onSetTitle), titleList.selectedItem.titleData.id);
                setButton.enabled = false;
                unSetButton.enabled = false;
            };
        }

        private function titleClick():void
        {
            var _local_1:String;
            var _local_2:String;
            if (((titleList.selectedItem) && (titleList.selectedItem.titleData)))
            {
                _local_1 = titleList.selectedItem.titleData.i;
                _local_2 = BuffParser.parseBuff2(titleList.selectedItem.titleData.b);
                info.htmlText = getStyleDescription(_local_1, _local_2);
            };
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        private function updateActTitleView():void
        {
            var _local_1:Array;
            var _local_2:int;
            var _local_3:Object;
            actTitlesAc = new ArrayCollection();
            if (_core.player.cts != null)
            {
                _local_1 = _core.player.cts.split("|");
                for each (_local_2 in _local_1)
                {
                    _local_3 = GameData.d[GamePredef.TBL_TITLE][_local_2];
                    if (_local_3)
                    {
                        if (_local_3.id == _core.player.actT)
                        {
                            _local_3.icon = ResManager.ICON_TITLE_YES;
                        }
                        else
                        {
                            _local_3.icon = ResManager.ICON_TITLE_NO;
                        };
                        actTitlesAc.addItem(_local_3);
                    };
                };
            };
            actTitleList.dataProvider = actTitlesAc;
        }

        [Bindable(event="propertyChange")]
        public function get titleList():List
        {
            return (this._2135991530titleList);
        }

        [Bindable(event="propertyChange")]
        public function get setButton():BasicGlowButton
        {
            return (this._103710260setButton);
        }

        public function onAddTitle(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_2:* = "";
            if (_arg_1)
            {
                if (_arg_1.t)
                {
                    _local_3 = _core.data.getData(GamePredef.TBL_TITLE, _arg_1.t);
                };
                switch (Number(_arg_1.f))
                {
                    case 1:
                        _core.player.ct = _arg_1.ct;
                        if (_local_3)
                        {
                            _local_2 = Language.TITLESELECTPANEL_S[0];
                            _local_2 = _local_2.replace("{tData.n}", _local_3.n);
                            _core.sysMsg(_local_2);
                        };
                        updateView();
                        return;
                    case 2:
                        _core.player.ct = _arg_1.ct;
                        if (_local_3)
                        {
                            _local_2 = Language.TITLESELECTPANEL_S[2];
                            _local_2 = _local_2.replace("{tData.n}", _local_3.n);
                            _core.sysMsg(_local_2);
                        };
                        updateView();
                        return;
                    case 3:
                        _core.player.ct = _arg_1.ct;
                        if (_local_3)
                        {
                            _local_2 = Language.TITLESELECTPANEL_S[4];
                            _local_2 = _local_2.replace("{tData.n}", _local_3.n);
                            _core.sysMsg(_local_2);
                        };
                        updateView();
                        return;
                    case 4:
                        _core.sysMsg(Language.TITLESELECTPANEL_S[6]);
                        return;
                    case 5:
                        _core.sysMsg(Language.TITLESELECTPANEL_S[7]);
                        return;
                };
            };
        }

        public function __actTitleList_itemClick(_arg_1:ListEvent):void
        {
            actTitleClick();
        }

        public function set titleList(_arg_1:List):void
        {
            var _local_2:Object = this._2135991530titleList;
            if (_local_2 !== _arg_1)
            {
                this._2135991530titleList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleList", _local_2, _arg_1));
            };
        }

        public function set unSetButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2118849637unSetButton;
            if (_local_2 !== _arg_1)
            {
                this._2118849637unSetButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unSetButton", _local_2, _arg_1));
            };
        }

        public function __titleList_click(_arg_1:MouseEvent):void
        {
            onTitleClick(_arg_1);
        }

        private function tabBtnClick(_arg_1:int):void
        {
            vs.selectedIndex = _arg_1;
            this["tabBtn0"].selected = false;
            this["tabBtn1"].selected = false;
            this[("tabBtn" + _arg_1)].selected = true;
        }

        public function updateSelectTitle(_arg_1:int):void
        {
            _core.player.t = _arg_1;
            updateView();
        }

        public function onAddActTitle(_arg_1:String):void
        {
            _core.player.cts = _arg_1;
            if (actInfo)
            {
                actInfo.text = "";
                updateActTitleView();
            };
        }

        private function actTitleClick():void
        {
            var _local_1:String;
            var _local_2:String;
            if (((actTitleList.selectedItem) && (actTitleList.selectedItem.i)))
            {
                _local_1 = actTitleList.selectedItem.i;
                _local_2 = BuffParser.parseBuff2(actTitleList.selectedItem.b);
                actInfo.htmlText = getStyleDescription(_local_1, _local_2);
            };
        }

        public function reset():void
        {
            firstTimeFlag = true;
        }

        public function set actTitleList(_arg_1:List):void
        {
            var _local_2:Object = this._673810084actTitleList;
            if (_local_2 !== _arg_1)
            {
                this._673810084actTitleList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actTitleList", _local_2, _arg_1));
            };
        }

        public function set info(_arg_1:TextArea):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        private function onTitleClick(_arg_1:MouseEvent):void
        {
            if (_arg_1.shiftKey)
            {
                _core.addLink(GamePredef.TOOLTIP_TITLE, titleList.selectedItem.titleData.id, titleList.selectedItem.titleData.n);
            };
        }

        [Bindable(event="propertyChange")]
        public function get actInfo():TextArea
        {
            return (this._1162758048actInfo);
        }

        public function __actUnSetButton_click(_arg_1:MouseEvent):void
        {
            unSetActTitle();
        }

        private function setActTitle():void
        {
            if (!actTitleList.selectedItem)
            {
                Alert.show(Language.TITLESELECTPANEL_S[8]);
                return;
            };
            if (actTitleList.selectedItem.id == _core.player.actT)
            {
                Alert.show(Language.TITLESELECTPANEL_S[9]);
                return;
            };
            _core.remote.call("setActTitle", new Responder(onSetActTitle), actTitleList.selectedItem.id);
            actSetButton.selected = false;
            actUnSetButton.selected = false;
        }

        private function _TitleSelectPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TITLESELECTPANEL_U[2];
            _local_1 = Language.TITLESELECTPANEL_U[3];
            _local_1 = Language.TITLESELECTPANEL_U[4];
            _local_1 = Language.TITLESELECTPANEL_U[0];
            _local_1 = Language.TITLESELECTPANEL_U[1];
            _local_1 = Language.TITLESELECTPANEL_U[5];
            _local_1 = Language.TITLESELECTPANEL_U[6];
        }

        public function set actUnSetButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._861039529actUnSetButton;
            if (_local_2 !== _arg_1)
            {
                this._861039529actUnSetButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actUnSetButton", _local_2, _arg_1));
            };
        }

        public function __titleList_itemClick(_arg_1:ListEvent):void
        {
            titleClick();
        }

        public function set setButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._103710260setButton;
            if (_local_2 !== _arg_1)
            {
                this._103710260setButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "setButton", _local_2, _arg_1));
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
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

        public function set actSetButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1381455422actSetButton;
            if (_local_2 !== _arg_1)
            {
                this._1381455422actSetButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actSetButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        override public function initialize():void
        {
            var target:TitleSelectPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TitleSelectPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TitleSelectPanelWatcherSetupUtil");
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
        public function get unSetButton():BasicGlowButton
        {
            return (this._2118849637unSetButton);
        }

        private function onActTitleClick(_arg_1:MouseEvent):void
        {
            if (_arg_1.shiftKey)
            {
                _core.addLink(GamePredef.TOOLTIP_TITLE, actTitleList.selectedItem.id, actTitleList.selectedItem.n);
            };
        }

        [Bindable(event="propertyChange")]
        public function get actTitleList():List
        {
            return (this._673810084actTitleList);
        }

        public function __actSetButton_click(_arg_1:MouseEvent):void
        {
            setActTitle();
        }

        [Bindable(event="propertyChange")]
        public function get info():TextArea
        {
            return (this._3237038info);
        }

        [Bindable(event="propertyChange")]
        public function get actUnSetButton():BasicGlowButton
        {
            return (this._861039529actUnSetButton);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        public function set actInfo(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1162758048actInfo;
            if (_local_2 !== _arg_1)
            {
                this._1162758048actInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get actSetButton():BasicGlowButton
        {
            return (this._1381455422actSetButton);
        }

        private function _TitleSelectPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TITLESELECTPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TitleSelectPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_TitleSelectPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TITLESELECTPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TITLESELECTPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TITLESELECTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                setButton.label = _arg_1;
            }, "setButton.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TITLESELECTPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                unSetButton.label = _arg_1;
            }, "unSetButton.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TITLESELECTPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actSetButton.label = _arg_1;
            }, "actSetButton.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TITLESELECTPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actUnSetButton.label = _arg_1;
            }, "actUnSetButton.label");
            result[6] = binding;
            return (result);
        }

        public function ___TitleSelectPanel_Canvas2_creationComplete(_arg_1:FlexEvent):void
        {
            updateActTitleView();
        }

        private function unSetTitle():void
        {
            if ((((titleList) && (titleList.selectedItem)) && (titleList.selectedItem.titleData)))
            {
                _core.remote.call("setTitle", new Responder(onSetTitle), -1);
                setButton.enabled = false;
                unSetButton.enabled = false;
            };
        }

        public function __setButton_click(_arg_1:MouseEvent):void
        {
            setTitle();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                if (firstTimeFlag)
                {
                    initView();
                };
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("gtl", new Responder(onTitleList));
        }

        private function onTitleList(_arg_1:Object):void
        {
            firstTimeFlag = false;
            _core.player.ct = _arg_1.ct;
            _core.player.cts = _arg_1.cts;
            updateView();
        }


    }
}//package com.qeedoo.ui.view.compDragable

