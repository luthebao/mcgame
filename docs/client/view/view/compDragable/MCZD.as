// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MCZD

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Image;
    import mx.controls.DataGrid;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.core.UIComponentDescriptor;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.utils.ArrayQueue;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
    import com.adobe.crypto.MD5;
    import mx.core.UIComponent;
    import flash.display.DisplayObject;
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

    public class MCZD extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _979805919promp1:RoundedLabel;
        private var _903685453mczdbg2:Image;
        private var _1880500467todayRank:DataGrid;
        private var _912227987allRank:DataGrid;
        private var _1528145178mytimes:RoundedLabel;
        private var _874994789fightBox:Canvas;
        private var _1554141559tabBtn0:BasicGlowButton;
        public var _MCZD_BasicTitleCanvas1:BasicTitleCanvas;
        private var _898461337todayMyRank:RoundedLabel;
        private var _117012vs1:ViewStack;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var mcdzBasicPrice:* = 45;
        public var _MCZD_RoundedLabel4:RoundedLabel;
        public var elite:* = false;
        private var _874994644fightBtn:BasicDelayButton;
        private var myPtimes:* = 0;
        private var _599588615allMyRank:RoundedLabel;
        private var _979805918promp2:RoundedLabel;
        private var _341476866logList:LinkTextArea;
        private var _582333572introtxt:IntroText;
        private var img1:*;
        private var _66732960myregion:RoundedLabel;
        private var _1079227515mczdbg:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":730,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MCZD_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "percentHeight":100,
                                "percentWidth":100,
                                "x":1,
                                "y":32,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"mczdbg",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":0,
                                            "x":0,
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":16,
                                            "width":80,
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
                                        this.top = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":97,
                                            "width":80,
                                            "styleName":"HorizontalTab",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"vs1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "29";
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":206,
                                            "height":253,
                                            "selectedIndex":0,
                                            "creationPolicy":"all",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "mouseEnabled":false,
                                                        "width":206,
                                                        "height":253,
                                                        "x":0,
                                                        "y":0,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"todayRank",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                                this.top = "5";
                                                                this.bottom = "31";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "width":200,
                                                                    "x":8,
                                                                    "columns":[_MCZD_DataGridColumn1_c(), _MCZD_DataGridColumn2_c(), _MCZD_DataGridColumn3_c()]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"todayMyRank",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"width":131});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "events":{"click":"___MCZD_BasicGlowButton3_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                                this.bottom = "9";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "label":"查看奖励",
                                                                    "width":61,
                                                                    "styleName":"BtnNormalBlue"
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
                                                        "mouseEnabled":false,
                                                        "width":206,
                                                        "height":253,
                                                        "x":0,
                                                        "y":0,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"allRank",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                                this.top = "5";
                                                                this.bottom = "31";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "width":200,
                                                                    "x":8,
                                                                    "columns":[_MCZD_DataGridColumn4_c(), _MCZD_DataGridColumn5_c(), _MCZD_DataGridColumn6_c()]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"allMyRank",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"width":131});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "events":{"click":"___MCZD_BasicGlowButton4_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                                this.bottom = "9";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "label":"查看奖励",
                                                                    "width":61,
                                                                    "styleName":"BtnNormalBlue"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"introtxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                        this.top = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "width":495,
                                            "height":160
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "mouseEnabled":false,
                                            "width":206,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "height":168,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":LinkTextArea,
                                                "id":"logList",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0.3;
                                                    this.backgroundColor = 0;
                                                    this.borderStyle = "none";
                                                    this.color = 16774324;
                                                    this.left = "5";
                                                    this.top = "5";
                                                    this.right = "5";
                                                    this.bottom = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "mouseEnabled":false,
                                                        "editable":false,
                                                        "enabled":true,
                                                        "selectable":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"fightBox",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "mouseEnabled":false,
                                            "height":280,
                                            "width":495,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"mczdbg2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "x":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"myregion",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.fontSize = 13;
                                                    this.top = "13";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_MCZD_RoundedLabel4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.fontSize = 13;
                                                    this.top = "42";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"mytimes",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "78";
                                                    this.fontSize = 13;
                                                    this.top = "42";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "events":{"click":"___MCZD_BasicGlowButton5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":140,
                                                        "y":40,
                                                        "label":"增加今日挑战次数",
                                                        "styleName":"BtnNormalBlue",
                                                        "height":22
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "events":{"click":"___MCZD_BasicGlowButton6_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":72,
                                                        "label":"宠物配置",
                                                        "width":61,
                                                        "styleName":"BtnNormalBlue",
                                                        "height":22
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"fightBtn",
                                                "events":{"click":"__fightBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.verticalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "width":142,
                                                        "height":141,
                                                        "styleName":"MCZDFightBtn"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"promp1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.fontSize = 13;
                                                    this.bottom = "27";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":24});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"promp2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.fontSize = 13;
                                                    this.bottom = "7";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":24});
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
        private var _259649619mczdTodayRank:ArrayCollection = new ArrayCollection();
        private var _1194484237mczdAllRank:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        private var _logStrArr:ArrayQueue = new ArrayQueue(100);
        private var regionName:* = ["A组", "B组", "C组", "D组", "E组", "F组"];
        private var gameName:* = ["", "热身赛", "精英赛"];
        private var _mczdDataStorage:* = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MCZD()
        {
            mx_internal::_document = this;
            this.width = 730;
            this.height = 500;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___MCZD_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MCZD._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get allMyRank():RoundedLabel
        {
            return (this._599588615allMyRank);
        }

        public function set logList(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._341476866logList;
            if (_local_2 !== _arg_1)
            {
                this._341476866logList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "logList", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        public function set introtxt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._582333572introtxt;
            if (_local_2 !== _arg_1)
            {
                this._582333572introtxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introtxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get logList():LinkTextArea
        {
            return (this._341476866logList);
        }

        public function set allMyRank(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._599588615allMyRank;
            if (_local_2 !== _arg_1)
            {
                this._599588615allMyRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allMyRank", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get todayRank():DataGrid
        {
            return (this._1880500467todayRank);
        }

        public function ___MCZD_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            showTodayRank();
        }

        private function _MCZD_DataGridColumn2_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "区服ID";
            _local_1.dataField = "sn";
            _local_1.width = 130;
            return (_local_1);
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

        private function _MCZD_DataGridColumn6_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "积分";
            _local_1.dataField = "s";
            _local_1.width = 50;
            return (_local_1);
        }

        public function set mczdbg(_arg_1:Image):void
        {
            var _local_2:Object = this._1079227515mczdbg;
            if (_local_2 !== _arg_1)
            {
                this._1079227515mczdbg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mczdbg", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        private function get mczdAllRank():ArrayCollection
        {
            return (this._1194484237mczdAllRank);
        }

        private function addMCZDLog(_arg_1:*, _arg_2:*):void
        {
            var _local_3:* = "";
            if (_arg_1.iswin == GamePredef.BATTLE_WIN)
            {
                _local_3 = (_local_3 + Language.MCZDPETFIGHT_PANEL_U[66].toString().replace("{gname}", _arg_1.gname));
            }
            else
            {
                if (_arg_1.iswin == GamePredef.BATTLE_LOSE)
                {
                    _local_3 = (_local_3 + Language.MCZDPETFIGHT_PANEL_U[67].toString().replace("{gname}", _arg_1.gname));
                };
            };
            _local_3 = (_local_3 + Language.MCZDPETFIGHT_PANEL_U[11].toString().replace("{bid}", _arg_2));
            _logStrArr.push((_local_3 + "\n"));
            logList.htmlText = _logStrArr.join();
        }

        public function onAddMoreTime(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(_arg_1.cid == _core.cid))))
            {
                return;
            };
            myPtimes = (((_arg_1.myPurchaseTimes - (_arg_1.myPurchaseTimes % 5)) / 5) + 1);
            var _local_2:* = mytimes.text;
            var _local_3:* = _local_2.split("/");
            if ((((_local_3) && (int(_local_3[0]) >= 0)) && (int(_local_3[1]) >= 0)))
            {
                mytimes.text = Language.MCZDPETFIGHT_PANEL_U[39].replace("{remain}", _local_3[0]).replace("{all}", (int(_local_3[1]) + 1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get promp1():RoundedLabel
        {
            return (this._979805919promp1);
        }

        [Bindable(event="propertyChange")]
        public function get mytimes():RoundedLabel
        {
            return (this._1528145178mytimes);
        }

        public function onMCZDFightResult(_arg_1:Object):void
        {
            var _local_2:Object;
            if (((!(_arg_1)) || (!(_arg_1.cid == _core.cid))))
            {
                return;
            };
            if (_arg_1.iswin == -1)
            {
            };
            if (_arg_1.list)
            {
                _local_2 = _core.view.getUI(ViewManager.POP_MCZD_BATTLE_REPORT);
                _local_2.showResult(_arg_1);
                _core.remote.call("getMCZDData", null);
            };
        }

        protected function readyToFight():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("startFightMCZD", null, null);
                };
            };
            Alert.show(Language.MCZDPETFIGHT_PANEL_U[57].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        public function set mytimes(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1528145178mytimes;
            if (_local_2 !== _arg_1)
            {
                this._1528145178mytimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mytimes", _local_2, _arg_1));
            };
        }

        public function set fightBox(_arg_1:Canvas):void
        {
            var _local_2:Object = this._874994789fightBox;
            if (_local_2 !== _arg_1)
            {
                this._874994789fightBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fightBox", _local_2, _arg_1));
            };
        }

        public function set vs1(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._117012vs1;
            if (_local_2 !== _arg_1)
            {
                this._117012vs1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs1", _local_2, _arg_1));
            };
        }

        public function set todayMyRank(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._898461337todayMyRank;
            if (_local_2 !== _arg_1)
            {
                this._898461337todayMyRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "todayMyRank", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get fightBtn():BasicDelayButton
        {
            return (this._874994644fightBtn);
        }

        public function set todayRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1880500467todayRank;
            if (_local_2 !== _arg_1)
            {
                this._1880500467todayRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "todayRank", _local_2, _arg_1));
            };
        }

        public function set myregion(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._66732960myregion;
            if (_local_2 !== _arg_1)
            {
                this._66732960myregion = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myregion", _local_2, _arg_1));
            };
        }

        private function tabBtnClick(_arg_1:int):void
        {
            if (((_arg_1 == 0) || (_arg_1 == 1)))
            {
                vs1.selectedIndex = _arg_1;
                tabBtn0.selected = false;
                tabBtn1.selected = false;
                this[("tabBtn" + _arg_1)].selected = true;
            };
        }

        public function set promp1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._979805919promp1;
            if (_local_2 !== _arg_1)
            {
                this._979805919promp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "promp1", _local_2, _arg_1));
            };
        }

        private function set mczdAllRank(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1194484237mczdAllRank;
            if (_local_2 !== _arg_1)
            {
                this._1194484237mczdAllRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mczdAllRank", _local_2, _arg_1));
            };
        }

        public function set promp2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._979805918promp2;
            if (_local_2 !== _arg_1)
            {
                this._979805918promp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "promp2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mczdbg2():Image
        {
            return (this._903685453mczdbg2);
        }

        private function _MCZD_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "▼";
            _local_1.dataField = "r";
            _local_1.width = 20;
            _local_1.setStyle("fontSize", 9);
            return (_local_1);
        }

        public function ___MCZD_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            showAllRank();
        }

        private function _MCZD_DataGridColumn5_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "区服ID";
            _local_1.dataField = "sn";
            _local_1.width = 130;
            return (_local_1);
        }

        public function set fightBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._874994644fightBtn;
            if (_local_2 !== _arg_1)
            {
                this._874994644fightBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fightBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vs1():ViewStack
        {
            return (this._117012vs1);
        }

        [Bindable(event="propertyChange")]
        public function get promp2():RoundedLabel
        {
            return (this._979805918promp2);
        }

        private function set mczdTodayRank(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._259649619mczdTodayRank;
            if (_local_2 !== _arg_1)
            {
                this._259649619mczdTodayRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mczdTodayRank", _local_2, _arg_1));
            };
        }

        private function playLoading(_arg_1:*):void
        {
            if (!initialized)
            {
                return;
            };
            img1.visible = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get allRank():DataGrid
        {
            return (this._912227987allRank);
        }

        private function _MCZD_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZD_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZD_BasicTitleCanvas1.text = _arg_1;
            }, "_MCZD_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220010001));
            }, function (_arg_1:Object):void
            {
                mczdbg.source = _arg_1;
            }, "mczdbg.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (mczdTodayRank);
            }, function (_arg_1:Object):void
            {
                todayRank.dataProvider = _arg_1;
            }, "todayRank.dataProvider");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                todayMyRank.text = _arg_1;
            }, "todayMyRank.text");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (mczdAllRank);
            }, function (_arg_1:Object):void
            {
                allRank.dataProvider = _arg_1;
            }, "allRank.dataProvider");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                allMyRank.text = _arg_1;
            }, "allMyRank.text");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220010002));
            }, function (_arg_1:Object):void
            {
                mczdbg2.source = _arg_1;
            }, "mczdbg2.source");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myregion.text = _arg_1;
            }, "myregion.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[76];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZD_RoundedLabel4.text = _arg_1;
            }, "_MCZD_RoundedLabel4.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mytimes.text = _arg_1;
            }, "mytimes.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                promp1.text = _arg_1;
            }, "promp1.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                promp2.text = _arg_1;
            }, "promp2.text");
            result[13] = binding;
            return (result);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        protected function config_clickHandler(_arg_1:MouseEvent):void
        {
            var _local_3:String;
            var _local_4:Object;
            var _local_2:Boolean;
            for (_local_3 in _core.player.petList)
            {
                _local_2 = true;
                break;
            };
            if (_local_2)
            {
                _local_4 = _core.view.getUI(ViewManager.PANEL_MCZD_PETFIGHT_CONF);
                _local_4.visible = (!(_local_4.visible));
                _local_4.petCrossConf = {"t":false};
            }
            else
            {
                Alert.show(Language.XLS_PANEL[3]);
            };
        }

        public function onMCZDGetData(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            if (!_arg_1)
            {
                visible = false;
                return;
            };
            if (((_arg_1.start) && (_arg_1.end)))
            {
                introtxt.text = Language.MCZDPETFIGHT_PANEL_U[42].replace("{start}", _arg_1.start).replace("{end}", _arg_1.end);
            };
            if (((_arg_1.mczdTodayRank) && (_arg_1.flag.myregion >= 0)))
            {
                mczdTodayRank = new ArrayCollection();
                for each (_local_2 in _arg_1.mczdTodayRank[_arg_1.flag.myregion])
                {
                    mczdTodayRank.addItem(_local_2);
                };
            };
            if (((_arg_1.mczdAllRank) && (_arg_1.flag.myregion >= 0)))
            {
                mczdAllRank = new ArrayCollection();
                for each (_local_2 in _arg_1.mczdAllRank[_arg_1.flag.myregion])
                {
                    mczdAllRank.addItem(_local_2);
                };
            };
            if (_arg_1.todayMyRank > 0)
            {
                todayMyRank.text = Language.MCZDPETFIGHT_PANEL_U[36].replace("{rank}", _arg_1.todayMyRank);
            }
            else
            {
                todayMyRank.text = Language.MCZDPETFIGHT_PANEL_U[43];
            };
            if (_arg_1.allMyRank > 0)
            {
                allMyRank.text = Language.MCZDPETFIGHT_PANEL_U[37].replace("{rank}", _arg_1.allMyRank);
            }
            else
            {
                allMyRank.text = Language.MCZDPETFIGHT_PANEL_U[43];
            };
            myregion.text = Language.MCZDPETFIGHT_PANEL_U[38].replace("{region}", regionName[int(_arg_1.flag.myregion)]).replace("{type}", gameName[int(_arg_1.flag.type)]).replace("{todaypnt}", _arg_1.flag.todaypnt).replace("{allpnt}", _arg_1.flag.allpnt);
            if (((((_arg_1.flag.mytimes >= 0) && (_arg_1.flag.alltimes >= 0)) && (_arg_1.flag.myPurchaseTimes >= 0)) && (_arg_1.flag.totaltimes >= 0)))
            {
                _local_3 = _arg_1.flag.mytimes;
                _local_4 = (_arg_1.flag.alltimes + _arg_1.flag.myPurchaseTimes);
                mytimes.text = Language.MCZDPETFIGHT_PANEL_U[39].replace("{remain}", _local_3).replace("{all}", _local_4);
                myPtimes = (((_arg_1.flag.myPurchaseTimes - (_arg_1.flag.myPurchaseTimes % 5)) / 5) + 1);
                _local_5 = _arg_1.flag.totaltimes;
                _local_6 = 0;
                _local_7 = 0;
                if (_local_5 > 10)
                {
                    _local_6 = (((_local_5 - 10) - ((_local_5 - 10) % 5)) / 5);
                }
                else
                {
                    _local_6 = 0;
                };
                if (_local_5 >= 110)
                {
                    promp2.text = Language.MCZDPETFIGHT_PANEL_U[49];
                    promp1.text = Language.MCZDPETFIGHT_PANEL_U[40].replace("{remain}", _local_5).replace("{prop1}", 20).replace("{prop2}", 20).replace("{prop3}", 20);
                }
                else
                {
                    _local_7 = (((_local_6 + 1) * 5) + 10);
                    promp1.text = Language.MCZDPETFIGHT_PANEL_U[40].replace("{remain}", _local_5).replace("{prop1}", _local_6).replace("{prop2}", _local_6).replace("{prop3}", _local_6);
                    promp2.text = Language.MCZDPETFIGHT_PANEL_U[41].replace("{remain}", _local_7).replace("{prop1}", (_local_6 + 1)).replace("{prop2}", (_local_6 + 1)).replace("{prop3}", (_local_6 + 1));
                };
            };
            if (_arg_1.log)
            {
                _logStrArr.clear();
                _local_8 = _arg_1.log;
                if (((_local_8) && (_local_8.length > 0)))
                {
                    _local_2 = (_local_8.length - 1);
                    while (_local_2 >= 0)
                    {
                        addMCZDLog(_local_8[_local_2], _local_2);
                        _local_2--;
                    };
                };
            }
            else
            {
                _logStrArr.clear();
            };
            _mczdDataStorage = _arg_1;
            elite = ((_arg_1.flag.type == 2) ? true : false);
        }

        private function addMoreTime():void
        {
            var _local_1:String = Language.MCZDPETFIGHT_PANEL_U[50].replace("{gold}", (mcdzBasicPrice * myPtimes));
            Alert.show(_local_1, Language.MCZDPETFIGHT_PANEL_U[51], (Alert.YES | Alert.NO), null, _addMoreTime);
        }

        [Bindable(event="propertyChange")]
        public function get introtxt():IntroText
        {
            return (this._582333572introtxt);
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

        [Bindable(event="propertyChange")]
        public function get mczdbg():Image
        {
            return (this._1079227515mczdbg);
        }

        override public function initialize():void
        {
            var target:MCZD;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MCZD_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MCZDWatcherSetupUtil");
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

        public function ___MCZD_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            addMoreTime();
        }

        private function _MCZD_DataGridColumn4_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "▼";
            _local_1.dataField = "r";
            _local_1.width = 20;
            _local_1.setStyle("fontSize", 9);
            return (_local_1);
        }

        public function __fightBtn_click(_arg_1:MouseEvent):void
        {
            readyToFight();
        }

        [Bindable(event="propertyChange")]
        public function get todayMyRank():RoundedLabel
        {
            return (this._898461337todayMyRank);
        }

        public function set mczdbg2(_arg_1:Image):void
        {
            var _local_2:Object = this._903685453mczdbg2;
            if (_local_2 !== _arg_1)
            {
                this._903685453mczdbg2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mczdbg2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myregion():RoundedLabel
        {
            return (this._66732960myregion);
        }

        private function showTodayRank():void
        {
            var _local_1:Object;
            if (_mczdDataStorage)
            {
                _local_1 = _core.view.getUI(ViewManager.PANEL_MCZD_ALL_RANK);
                _local_1.visible = (!(_local_1.visible));
                _local_1.setRankData(1, _mczdDataStorage.mczdTodayRank);
            };
        }

        public function ___MCZD_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            creationCompleteHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        private function get mczdTodayRank():ArrayCollection
        {
            return (this._259649619mczdTodayRank);
        }

        private function showAllRank():void
        {
            var _local_1:Object;
            if (_mczdDataStorage)
            {
                _local_1 = _core.view.getUI(ViewManager.PANEL_MCZD_ALL_RANK);
                _local_1.visible = (!(_local_1.visible));
                _local_1.setRankData(2, _mczdDataStorage.mczdAllRank);
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        private function _MCZD_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MCZD_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220010001);
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[34];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[35];
            _local_1 = mczdTodayRank;
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[36];
            _local_1 = mczdAllRank;
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[37];
            _local_1 = ResManager.getIconUrl(4130220010002);
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[38];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[76];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[39];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[40];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[41];
        }

        [Bindable(event="propertyChange")]
        public function get fightBox():Canvas
        {
            return (this._874994789fightBox);
        }

        private function _addMoreTime(event:CloseEvent):void
        {
            var getDelPass:Function;
            var inputPanel:* = undefined;
            if (event.detail == Alert.YES)
            {
                if (!_core.delPass)
                {
                    getDelPass = function (_arg_1:String):void
                    {
                        var _local_2:String;
                        if (_arg_1)
                        {
                            _local_2 = MD5.hash(_arg_1);
                            _core.remote.call("MCZDAddMoreTime", null, _local_2);
                        };
                    };
                    inputPanel = _core.view.getUI(ViewManager.PANEL_INPUT);
                    if (inputPanel)
                    {
                        inputPanel.showInput(Language.DELETE_BY_PASS[0], Language.PORTRAITCANVAS_U[0], getDelPass);
                    };
                }
                else
                {
                    _core.remote.call("MCZDAddMoreTime", null);
                };
            };
        }

        public function onStartFightMCZD(_arg_1:Object):void
        {
            if (_arg_1.r == 0)
            {
                Alert.show(Language.MCZDPETFIGHT_PANEL_U[55]);
            }
            else
            {
                if (_arg_1.r != 1)
                {
                    if (_arg_1.r == 2)
                    {
                        Alert.show(Language.MCZDPETFIGHT_PANEL_U[54]);
                    }
                    else
                    {
                        if (_arg_1.r == 3)
                        {
                            Alert.show(Language.MCZDPETFIGHT_PANEL_U[65]);
                        }
                        else
                        {
                            if (_arg_1.r == -1)
                            {
                                Alert.show(Language.MCZDPETFIGHT_PANEL_U[68]);
                            };
                        };
                    };
                };
            };
        }

        private function _MCZD_DataGridColumn3_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "积分";
            _local_1.dataField = "s";
            _local_1.width = 50;
            return (_local_1);
        }

        public function ___MCZD_BasicGlowButton6_click(_arg_1:MouseEvent):void
        {
            config_clickHandler(_arg_1);
        }

        public function onMCZDLogPanel(_arg_1:*):void
        {
            var _local_3:Object;
            var _local_2:* = _mczdDataStorage.log[_arg_1];
            if (_local_2)
            {
                _local_3 = _core.view.getUI(ViewManager.POP_MCZD_BATTLE_REPORT);
                _local_2.cpt = _local_2.gname;
                _local_3.showResult(_local_2);
            };
        }

        public function set allRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._912227987allRank;
            if (_local_2 !== _arg_1)
            {
                this._912227987allRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allRank", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("getMCZDData", null);
        }

        protected function creationCompleteHandler(_arg_1:FlexEvent):void
        {
            img1 = new UIComponent();
            img1.mouseEnabled = false;
            img1.mouseChildren = false;
            var _local_2:DisplayObject = new ((ResManager.MCZDMATCHING as Class))();
            img1.addChild(_local_2);
            img1.x = 260;
            img1.y = 130;
            img1.visible = false;
            fightBox.addChild(img1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

