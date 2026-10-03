// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionFightPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.controls.LinkButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.predef.GamePredef;
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

    public class CrossContentionFightPanel extends DragableCanvas implements IBindingClient 
    {

        public static const PVP_NUM:int = 25;
        public static const PVE_NUM:int = 20;
        public static const CD_TIME:Number = ((10 * 60) * 1000);//600000
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _CrossContentionFightPanel_BasicGlowButton2:BasicGlowButton;
        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _976080868pvpnum:RoundedLabel;
        public var areaId:int = 0;
        public var _CrossContentionFightPanel_RoundedLabel1:RoundedLabel;
        public var _CrossContentionFightPanel_RoundedLabel2:RoundedLabel;
        public var _CrossContentionFightPanel_RoundedLabel4:RoundedLabel;
        public var _CrossContentionFightPanel_RoundedLabel5:RoundedLabel;
        public var GOLD_NUM:int = 200;
        private var _976408569pvenum:RoundedLabel;
        private var _helpAlert:Alert;
        public var GOLD_CD:int = 10;
        public var pvpCd:Number = 0;
        public var mapId:int = 0;
        public var isBoss:Boolean = false;
        public var _CrossContentionFightPanel_DelayButton1:DelayButton;
        public var bossNid:int = 0;
        public var pveCd:Number = 0;
        public var pveNum:int = 20;
        public var _CrossContentionFightPanel_LinkButton1:LinkButton;
        public var pvpNum:int = 25;
        public var _CrossContentionFightPanel_BasicGlowButton1:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":275,
                    "height":250,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "7";
                            this.right = "7";
                            this.top = "39";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":181,
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CrossContentionFightPanel_RoundedLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":4,
                                            "width":241
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CrossContentionFightPanel_RoundedLabel2",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":20,
                                            "y":44,
                                            "width":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"pvenum",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0x8000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "htmlText":"",
                                            "x":130,
                                            "y":44,
                                            "width":53
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_CrossContentionFightPanel_BasicGlowButton1",
                                    "events":{"click":"___CrossContentionFightPanel_BasicGlowButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":44,
                                            "width":60,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CrossContentionFightPanel_RoundedLabel4",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":88,
                                            "width":241
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CrossContentionFightPanel_RoundedLabel5",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":20,
                                            "y":128,
                                            "width":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"pvpnum",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0x8000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "htmlText":"",
                                            "x":130,
                                            "y":128,
                                            "width":53
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_CrossContentionFightPanel_BasicGlowButton2",
                                    "events":{"click":"___CrossContentionFightPanel_BasicGlowButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "7";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":128,
                                            "width":60,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"_CrossContentionFightPanel_DelayButton1",
                        "events":{"click":"___CrossContentionFightPanel_DelayButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "7";
                            this.left = "99";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":10000,
                                "width":60,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_CrossContentionFightPanel_LinkButton1",
                        "events":{"click":"___CrossContentionFightPanel_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.bottom = "7";
                            this.color = 0xFFE600;
                            this.textDecoration = "underline";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":78});
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        public var mapData:Object = new Object();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossContentionFightPanel()
        {
            mx_internal::_document = this;
            this.width = 275;
            this.height = 250;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionFightPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionFightPanel._watcherSetupUtil = _arg_1;
        }


        private function buy(type:Number, isPVE:Boolean):void
        {
            var now:Number = new Date().getDate();
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("minusMoneyForCrossContention", null, type, isPVE);
                };
            };
            if (type == -2)
            {
                if (isPVE)
                {
                    if (pveCd < now)
                    {
                        _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[63]);
                    }
                    else
                    {
                        Alert.show(Language.CROSS_CONTENTION_PANEL_U[62].toString().replace("{gold}", GOLD_CD), "", (Alert.YES | Alert.NO), null, func);
                    };
                }
                else
                {
                    if (pvpCd < now)
                    {
                        _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[63]);
                    }
                    else
                    {
                        Alert.show(Language.CROSS_CONTENTION_PANEL_U[62].toString().replace("{gold}", GOLD_CD), "", (Alert.YES | Alert.NO), null, func);
                    };
                };
            }
            else
            {
                Alert.show(Language.CROSS_CONTENTION_PANEL_U[61].toString().replace("{gold}", GOLD_NUM), "", (Alert.YES | Alert.NO), null, func);
            };
        }

        private function _CrossContentionFightPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[118];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[50];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[52];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[54];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[51];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[52];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[54];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[49];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[46];
        }

        override public function initialize():void
        {
            var target:CrossContentionFightPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionFightPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionFightPanelWatcherSetupUtil");
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

        public function showPanel():void
        {
            _core.remote.call("getCrossContentionFlag", null);
        }

        public function ___CrossContentionFightPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            buy(-1, false);
        }

        private function init():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        public function onAddCrossContentionFlag(_arg_1:Object):void
        {
            onGetData(_arg_1);
        }

        public function set pvenum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._976408569pvenum;
            if (_local_2 !== _arg_1)
            {
                this._976408569pvenum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pvenum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pvpnum():RoundedLabel
        {
            return (this._976080868pvpnum);
        }

        public function onGetData(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Date;
            pvpNum = PVP_NUM;
            pveNum = PVE_NUM;
            this.visible = true;
            this.pvenum.htmlText = String(PVE_NUM);
            this.pvpnum.htmlText = String(PVP_NUM);
            if ((((((_arg_1) && (_arg_1.PVP)) && (_arg_1.PVP.timenow)) && (_arg_1.PVP.timestr)) && (String(_arg_1.PVP.timenow) == String(_arg_1.PVP.timestr))))
            {
                _local_2 = int(_arg_1.PVP.validnum);
                _local_3 = 0;
                if (_arg_1.PVP.fightnum != null)
                {
                    _local_3 = int(_arg_1.PVP.fightnum);
                };
                this.pvpnum.htmlText = String((_local_2 - _local_3));
                _local_4 = 0;
                if ((((_arg_1) && (_arg_1.PVP)) && (_arg_1.PVP.cdnum)))
                {
                    _local_4 = int(_arg_1.PVP.cdnum);
                };
                if (_local_4 == 0)
                {
                    _local_5 = Number(0);
                    if ((((_arg_1) && (_arg_1.PVP)) && (_arg_1.PVP.fighttime)))
                    {
                        _local_5 = (Number(_arg_1.PVP.fighttime) + CD_TIME);
                        _local_6 = new Date(_local_5);
                        pvpCd = _local_6.getTime();
                        if (pvpCd > new Date().getTime())
                        {
                        };
                    };
                };
            };
            if ((((((_arg_1) && (_arg_1.PVE)) && (_arg_1.PVE.timenow)) && (_arg_1.PVE.timestr)) && (String(_arg_1.PVE.timenow) == String(_arg_1.PVE.timestr))))
            {
                _local_2 = int(_arg_1.PVE.validnum);
                _local_3 = 0;
                if (_arg_1.PVE.fightnum != null)
                {
                    _local_3 = int(_arg_1.PVE.fightnum);
                };
                this.pvenum.htmlText = String((_local_2 - _local_3));
                _local_4 = 0;
                if ((((_arg_1) && (_arg_1.PVE)) && (_arg_1.PVE.cdnum)))
                {
                    _local_4 = int(_arg_1.PVE.cdnum);
                };
                if (_local_4 == 0)
                {
                    _local_5 = Number(0);
                    if ((((_arg_1) && (_arg_1.PVE)) && (_arg_1.PVE.fighttime)))
                    {
                        _local_5 = (Number(_arg_1.PVE.fighttime) + CD_TIME);
                        _local_6 = new Date(_local_5);
                        pveCd = _local_6.getTime();
                        if (pveCd > new Date().getTime())
                        {
                        };
                    };
                };
            };
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CROSS_CONTENTION_PANEL_U[47].toString();
            _helpAlert = Alert.show(_local_1, Language.CROSS_CONTENTION_PANEL_U[47].toString(), Alert.YES, null, null);
        }

        [Bindable(event="propertyChange")]
        public function get pvenum():RoundedLabel
        {
            return (this._976408569pvenum);
        }

        public function ___CrossContentionFightPanel_DelayButton1_click(_arg_1:MouseEvent):void
        {
            startFight();
        }

        public function ___CrossContentionFightPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        private function startFight():void
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_1:Boolean = true;
            var _local_2:Boolean = isBoss;
            if ((((((mapData) && (mapData["mData"])) && (mapData["mData"][areaId])) && (!(mapData["mData"][areaId].state1 == null))) && (mapData["mData"][areaId].state1 == 1)))
            {
                _local_1 = false;
            };
            if (!_local_1)
            {
                if (Number(mapData.original_server_id) == Number(mapData["mData"][areaId].osid))
                {
                    _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[65]);
                    return;
                };
            };
            if (((_local_1) && (!(_local_2))))
            {
                _local_3 = Number(GamePredef.CROSS_CONTENTION_P_DATA[GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[mapId]][areaId].p].lvl);
                _local_4 = Number(GamePredef.CROSS_CONTENTION_P_DATA[GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[mapId]][areaId].p].lvl2);
                if (CrossContentionTotalPanel.LEVLE_TYPE == 1)
                {
                    if (((_core.player.level < _local_3) || (_core.player.level > _local_4)))
                    {
                        _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[64]);
                        return;
                    };
                }
                else
                {
                    if (CrossContentionTotalPanel.LEVLE_TYPE == 2)
                    {
                        if (_core.player.level > _local_4)
                        {
                            _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[64]);
                            return;
                        };
                    }
                    else
                    {
                        if (CrossContentionTotalPanel.LEVLE_TYPE == 3)
                        {
                            if (_core.player.level < _local_3)
                            {
                                _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[64]);
                                return;
                            };
                        };
                    };
                };
            };
            _core.remote.call("crossContentionFight", null, mapId, areaId, _local_1, _local_2);
        }

        public function ___CrossContentionFightPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set pvpnum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._976080868pvpnum;
            if (_local_2 !== _arg_1)
            {
                this._976080868pvpnum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pvpnum", _local_2, _arg_1));
            };
        }

        public function ___CrossContentionFightPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            buy(-1, true);
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        private function _CrossContentionFightPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[118];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFightPanel_RoundedLabel1.htmlText = _arg_1;
            }, "_CrossContentionFightPanel_RoundedLabel1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFightPanel_RoundedLabel2.htmlText = _arg_1;
            }, "_CrossContentionFightPanel_RoundedLabel2.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFightPanel_BasicGlowButton1.label = _arg_1;
            }, "_CrossContentionFightPanel_BasicGlowButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFightPanel_RoundedLabel4.htmlText = _arg_1;
            }, "_CrossContentionFightPanel_RoundedLabel4.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFightPanel_RoundedLabel5.htmlText = _arg_1;
            }, "_CrossContentionFightPanel_RoundedLabel5.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFightPanel_BasicGlowButton2.label = _arg_1;
            }, "_CrossContentionFightPanel_BasicGlowButton2.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFightPanel_DelayButton1.label = _arg_1;
            }, "_CrossContentionFightPanel_DelayButton1.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFightPanel_LinkButton1.label = _arg_1;
            }, "_CrossContentionFightPanel_LinkButton1.label");
            result[8] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

