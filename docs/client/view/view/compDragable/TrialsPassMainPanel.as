// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TrialsPassMainPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.TrialsFloorCanvas;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.LinkButton;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.Button;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.net.Responder;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import com.qeedoo.game.utils.TimeUtil;
    import mx.events.PropertyChangeEvent;
    import mx.managers.PopUpManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
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

    public class TrialsPassMainPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _101081fa4:ItemSlot;
        private var _1281570377faward:BasicDelayButton;
        private var _1254502066gaBtn0:BasicDelayButton;
        private var _101078fa1:ItemSlot;
        private var _helpAlert:Alert;
        private var _2047892671trialsBtn02:TrialsFloorCanvas;
        private var _m:Number = 5;
        private var _59498092lfLable:Label;
        private var _2047892668trialsBtn05:TrialsFloorCanvas;
        private var _ut:String = "0|0|0";
        public var _TrialsPassMainPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _nf:Number = 0;
        private var _101082fa5:ItemSlot;
        private var _1712711974floorInfo:TextArea;
        private var _101079fa2:ItemSlot;
        public var _TrialsPassMainPanel_Label2:Label;
        public var _TrialsPassMainPanel_Label3:Label;
        private var _2047892672trialsBtn01:TrialsFloorCanvas;
        private var _2047892669trialsBtn04:TrialsFloorCanvas;
        private var _101080fa3:ItemSlot;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _loadCid:Number = 0;
        public var _TrialsPassMainPanel_LinkButton2:LinkButton;
        public var _TrialsPassMainPanel_LinkButton1:LinkButton;
        private var _lastHitFloor:Number = 1;
        private var _at:String = "0|0|0";
        private var _2047892670trialsBtn03:TrialsFloorCanvas;
        private var _t:Number = 0;
        private var _n:Number = 0;
        public var _TrialsPassMainPanel_Image1:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":620,
                    "height":420,
                    "creationPolicy":"all",
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_TrialsPassMainPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "63";
                            this.left = "13";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":593,
                                "height":343,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_TrialsPassMainPanel_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":593,
                                            "height":343,
                                            "x":0,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"faward",
                                    "events":{"click":"__faward_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":3000,
                                            "x":446,
                                            "y":221,
                                            "height":21,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TrialsFloorCanvas,
                                    "id":"trialsBtn01",
                                    "events":{"click":"__trialsBtn01_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":163,
                                            "height":75,
                                            "x":12,
                                            "y":17,
                                            "visible":true,
                                            "findex":1
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TrialsFloorCanvas,
                                    "id":"trialsBtn02",
                                    "events":{"click":"__trialsBtn02_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":163,
                                            "height":75,
                                            "x":193.95,
                                            "y":64,
                                            "visible":true,
                                            "findex":2
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TrialsFloorCanvas,
                                    "id":"trialsBtn03",
                                    "events":{"click":"__trialsBtn03_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":163,
                                            "height":75,
                                            "x":27.95,
                                            "y":121,
                                            "visible":true,
                                            "findex":3
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TrialsFloorCanvas,
                                    "id":"trialsBtn04",
                                    "events":{"click":"__trialsBtn04_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":163,
                                            "height":75,
                                            "x":195.95,
                                            "y":176,
                                            "visible":true,
                                            "findex":4
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TrialsFloorCanvas,
                                    "id":"trialsBtn05",
                                    "events":{"click":"__trialsBtn05_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":163,
                                            "height":75,
                                            "x":12,
                                            "y":222,
                                            "visible":true,
                                            "findex":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___TrialsPassMainPanel_Button1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":326.95,
                                            "y":17,
                                            "width":35,
                                            "height":35,
                                            "styleName":"trialsBtnAward"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"fa1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":388,
                                            "y":179,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"fa2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":428,
                                            "y":179,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"fa3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":466,
                                            "y":179,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"fa4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":505,
                                            "y":179,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"fa5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":544,
                                            "y":179,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"gaBtn0",
                                    "events":{"click":"__gaBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":3000,
                                            "width":104,
                                            "height":40,
                                            "x":437.95,
                                            "y":290,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"lfLable",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16187149;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":392,
                                            "y":268,
                                            "width":195
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TrialsPassMainPanel_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16187149;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":395,
                                            "y":20,
                                            "width":195
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TrialsPassMainPanel_Label3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16187149;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":395,
                                            "y":143,
                                            "width":195
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextArea,
                                    "id":"floorInfo",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderThickness = 0;
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":388,
                                            "y":42,
                                            "width":195,
                                            "height":95,
                                            "wordWrap":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_TrialsPassMainPanel_LinkButton1",
                                    "events":{"click":"___TrialsPassMainPanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textDecoration = "underline";
                                        this.color = 0xFFFF00;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":270.95,
                                            "y":314,
                                            "height":17
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_TrialsPassMainPanel_LinkButton2",
                                    "events":{"click":"___TrialsPassMainPanel_LinkButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textDecoration = "underline";
                                        this.color = 0xFFFF00;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":270.95,
                                            "y":284,
                                            "height":17
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                            this.top = "43";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":13,
                                "percentWidth":100,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "labelPlacement":"bottom",
                                            "width":77
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
        private var _kt:Object = new Object();
        private var _a:Object = new Object();
        private var _sc:Object = new Object();
        private var _firstAwardArr:Array = [[{
            "tid":29,
            "iid":4725,
            "n":1
        }, {
            "tid":29,
            "iid":4591,
            "n":1
        }, {
            "tid":29,
            "iid":4674,
            "n":4
        }, {
            "tid":29,
            "iid":4735,
            "n":1
        }], [{
            "tid":29,
            "iid":4726,
            "n":1
        }, {
            "tid":29,
            "iid":4591,
            "n":2
        }, {
            "tid":29,
            "iid":4674,
            "n":5
        }, {
            "tid":29,
            "iid":4736,
            "n":1
        }], [{
            "tid":29,
            "iid":4727,
            "n":1
        }, {
            "tid":29,
            "iid":4592,
            "n":1
        }, {
            "tid":29,
            "iid":4674,
            "n":8
        }, {
            "tid":29,
            "iid":4737,
            "n":1
        }], [{
            "tid":29,
            "iid":4728,
            "n":1
        }, {
            "tid":29,
            "iid":4592,
            "n":1
        }, {
            "tid":29,
            "iid":4674,
            "n":9
        }, {
            "tid":29,
            "iid":4738,
            "n":1
        }], [{
            "tid":29,
            "iid":4729,
            "n":1
        }, {
            "tid":29,
            "iid":4592,
            "n":2
        }, {
            "tid":29,
            "iid":4674,
            "n":10
        }, {
            "tid":29,
            "iid":4739,
            "n":1
        }]];
        private var _updataKey:Array = ["t", "m", "n", "nf", "ut", "kt", "a", "at", "sc"];
        private var _updataForeachKey:Object = {
            "kt":1,
            "a":1,
            "sc":1
        };
        private var _updataFunc:Object = {
            "1":"onTrialsTimeUpdate",
            "2":"onTrialsTimeUpdate",
            "6":"onTrialsFirstAwardStateUpdate",
            "7":"onTrialsAwardStateUpdate",
            "8":"onTrialsScordUpdate"
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TrialsPassMainPanel()
        {
            mx_internal::_document = this;
            this.width = 620;
            this.height = 420;
            this.styleName = "StandardContent";
            this.creationPolicy = "all";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TrialsPassMainPanel._watcherSetupUtil = _arg_1;
        }


        public function onUpdateTrialsCharData(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:*;
            if (((initialized) && (_arg_1)))
            {
                _local_2 = 0;
                while (_local_2 < _updataKey.length)
                {
                    if (_arg_1[_updataKey[_local_2]])
                    {
                        if (!_updataForeachKey[_updataKey[_local_2]])
                        {
                            this[("_" + _updataKey[_local_2])] = _arg_1[_updataKey[_local_2]];
                        }
                        else
                        {
                            for (_local_3 in _arg_1[_updataKey[_local_2]])
                            {
                                this[("_" + _updataKey[_local_2])][_local_3] = _arg_1[_updataKey[_local_2]][_local_3];
                            };
                        };
                        if (_updataFunc[_local_2])
                        {
                            var _local_4:* = this;
                            (_local_4[_updataFunc[_local_2]]());
                        };
                    };
                    _local_2++;
                };
            };
        }

        private function trialsAssister():void
        {
            _core.remote.call("trialsTimerAward", new Responder(onTrialsTimerAward));
        }

        private function trialsCharDataInit(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Number;
            if (_arg_1)
            {
                _m = _arg_1.m;
                _n = _arg_1.n;
                lfLable.text = Language.TRIALS_MAIN_PANEL[3].replace("{num}", Number(ToolKit.minus(_m, _n)));
                _t = _arg_1.t;
                _kt = _arg_1.kt;
                _a = _arg_1.a;
                _at = _arg_1.at;
                _nf = _arg_1.nf;
                _sc = _arg_1.sc;
                if (!_kt[_lastHitFloor])
                {
                    _lastHitFloor = 1;
                };
                _local_2 = 1;
                while (_local_2 <= 5)
                {
                    _local_3 = ((_sc[_local_2]) ? _sc[_local_2] : 1);
                    this[("trialsBtn0" + _local_2)].scord = _local_3;
                    this[("trialsBtn0" + _local_2)].fiterBtn = false;
                    if ((((!(_local_2 == 1)) && (!(_kt[_local_2]))) && (!(_kt[ToolKit.minus(_local_2, 1)]))))
                    {
                        this[("trialsBtn0" + _local_2)].fiterBtn = true;
                    };
                    this[("trialsBtn0" + _local_2)].setStarLev(_local_3);
                    _local_2++;
                };
                gaBtn0.enabled = true;
                if (((this[("trialsBtn0" + _lastHitFloor)]) && (this[("trialsBtn0" + _lastHitFloor)].fiterBtn)))
                {
                    gaBtn0.enabled = false;
                };
            };
        }

        private function onTrialsAwardStateUpdate():void
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_TRIALS_AWARD);
            if (((_local_1) && (_local_1.visible)))
            {
                trialsAwardPanelVisible();
            };
        }

        public function onTrialsTimerAward(_arg_1:Object):void
        {
            var _local_2:*;
            if (initialized)
            {
                _local_2 = _core.view.getUI(ViewManager.MAIN_MINIMAP);
                if (((_local_2) && (_arg_1)))
                {
                    if (ToolKit.isBigThan(_arg_1.num, 1000))
                    {
                        _local_2.setTrialsInfoVisible(_arg_1.num, _arg_1.life, true);
                        return;
                    };
                };
                _local_2.setTrialsInfoVisible(0, -1, false);
            };
        }

        [Bindable(event="propertyChange")]
        public function get floorInfo():TextArea
        {
            return (this._1712711974floorInfo);
        }

        public function ___TrialsPassMainPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            trialsInfo();
        }

        private function trialsAwardPanelVisible():void
        {
            var _local_1:Number = ((new Date().getTime() + _core.timeLag) + TimeUtil.timeOSOffSet);
            var _local_2:String = TimeUtil.getThisMonDay(_local_1);
            var _local_3:Number = 0;
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_6:Number = 1;
            while (_local_6 <= 5)
            {
                if (((_kt[_local_6]) && (_kt[_local_6] == _local_2)))
                {
                    _local_3 = _local_6;
                };
                if (((!(_local_4)) && (_at == _local_2)))
                {
                    _local_4 = true;
                };
                if (!_local_4)
                {
                    _local_5 = true;
                };
                _local_6++;
            };
            var _local_7:* = _core.view.getUI(ViewManager.PANEL_TRIALS_AWARD);
            if (_local_7)
            {
                _local_7.trialsAwardPanelVisible(_local_3, _local_4, _local_5);
            };
        }

        public function __trialsBtn02_click(_arg_1:MouseEvent):void
        {
            trialsSelect(2);
        }

        public function __gaBtn0_click(_arg_1:MouseEvent):void
        {
            trialsStart();
        }

        [Bindable(event="propertyChange")]
        public function get trialsBtn01():TrialsFloorCanvas
        {
            return (this._2047892672trialsBtn01);
        }

        [Bindable(event="propertyChange")]
        public function get trialsBtn02():TrialsFloorCanvas
        {
            return (this._2047892671trialsBtn02);
        }

        [Bindable(event="propertyChange")]
        public function get trialsBtn03():TrialsFloorCanvas
        {
            return (this._2047892670trialsBtn03);
        }

        [Bindable(event="propertyChange")]
        public function get trialsBtn04():TrialsFloorCanvas
        {
            return (this._2047892669trialsBtn04);
        }

        private function trialsStart():void
        {
            if (((!(_lastHitFloor == 1)) && (!(_kt[ToolKit.minus(_lastHitFloor, 1)]))))
            {
                _core.sysMsg(Language.TRIALS_MAIN_PANEL[4]);
                return;
            };
            _core.remote.call("trialsStart", null, _lastHitFloor);
        }

        [Bindable(event="propertyChange")]
        public function get trialsBtn05():TrialsFloorCanvas
        {
            return (this._2047892668trialsBtn05);
        }

        private function onTrialsScordUpdate():void
        {
            var _local_1:*;
            if (this[("trialsBtn0" + _nf)])
            {
                if (_kt[_nf])
                {
                    this[("trialsBtn0" + _nf)].fiterBtn = false;
                    if (_nf == _lastHitFloor)
                    {
                        gaBtn0.enabled = true;
                    };
                }
                else
                {
                    this[("trialsBtn0" + _nf)].fiterBtn = true;
                };
                this[("trialsBtn0" + _nf)].setStarLev(_sc[_nf]);
                if (_nf == _lastHitFloor)
                {
                    faward.label = Language.TRIALS_MAIN_PANEL[6];
                    if (((_kt[_lastHitFloor]) && (!(_a[_lastHitFloor]))))
                    {
                        faward.enabled = true;
                    }
                    else
                    {
                        faward.enabled = false;
                        if (_a[_lastHitFloor])
                        {
                            faward.label = Language.TRIALS_MAIN_PANEL[9];
                        };
                    };
                };
                _local_1 = _core.view.getUI(ViewManager.PANEL_TRIALS_AWARD);
                if (((_local_1) && (_local_1.visible)))
                {
                    trialsAwardPanelVisible();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn0():BasicDelayButton
        {
            return (this._1254502066gaBtn0);
        }

        public function set bangBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324756bangBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1863324756bangBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn0", _local_2, _arg_1));
            };
        }

        public function __trialsBtn03_click(_arg_1:MouseEvent):void
        {
            trialsSelect(3);
        }

        private function trialsFirstAwardGet():void
        {
            _core.remote.call("trialsFirstKillAwardTake", null, _lastHitFloor);
        }

        public function ___TrialsPassMainPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            trialsAssister();
        }

        private function onTrialsFirstAwardStateUpdate():void
        {
            if (_nf == _lastHitFloor)
            {
                if (_a[_nf])
                {
                    faward.enabled = false;
                    faward.label = Language.TRIALS_MAIN_PANEL[9];
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get lfLable():Label
        {
            return (this._59498092lfLable);
        }

        private function trialsSelect(_arg_1:Number):void
        {
            var _local_2:Number;
            var _local_5:*;
            _local_2 = 1;
            while (_local_2 <= 5)
            {
                this[("trialsBtn0" + _local_2)].cancelSelectFloor();
                _local_2++;
            };
            this[("trialsBtn0" + _arg_1)].selectFloor();
            _lastHitFloor = _arg_1;
            var _local_3:Number = ToolKit.add(_arg_1, 14);
            floorInfo.text = Language.TRIALS_MAIN_PANEL[_local_3];
            var _local_4:Array = _firstAwardArr[ToolKit.minus(_lastHitFloor, 1)];
            _local_2 = 0;
            while (_local_2 < _local_4.length)
            {
                _local_5 = _core.data.gameData[_local_4[_local_2].tid][_local_4[_local_2].iid];
                this[("fa" + ToolKit.add(_local_2, 1))].slotData = _local_5;
                this[("fa" + ToolKit.add(_local_2, 1))].type = _local_4[_local_2].tid;
                this[("fa" + ToolKit.add(_local_2, 1))].giid = _local_4[_local_2].iid;
                this[("fa" + ToolKit.add(_local_2, 1))].stackNum = _local_4[_local_2].n;
                _local_2++;
            };
            faward.label = Language.TRIALS_MAIN_PANEL[6];
            if ((((_lastHitFloor == 1) || (_kt[_lastHitFloor])) || (_kt[ToolKit.minus(_lastHitFloor, 1)])))
            {
                gaBtn0.enabled = true;
            }
            else
            {
                gaBtn0.enabled = false;
            };
            if (((_kt[_lastHitFloor]) && (!(_a[_lastHitFloor]))))
            {
                faward.enabled = true;
            }
            else
            {
                faward.enabled = false;
                if (_a[_lastHitFloor])
                {
                    faward.label = Language.TRIALS_MAIN_PANEL[9];
                };
            };
        }

        private function trialsInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.TRIALS_MAIN_PANEL[20].toString();
            _helpAlert = Alert.show(_local_1, Language.TRIALS_MAIN_PANEL[20].toString(), Alert.YES, null, null);
        }

        public function set faward(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._1281570377faward;
            if (_local_2 !== _arg_1)
            {
                this._1281570377faward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "faward", _local_2, _arg_1));
            };
        }

        public function set trialsBtn02(_arg_1:TrialsFloorCanvas):void
        {
            var _local_2:Object = this._2047892671trialsBtn02;
            if (_local_2 !== _arg_1)
            {
                this._2047892671trialsBtn02 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trialsBtn02", _local_2, _arg_1));
            };
        }

        public function set trialsBtn03(_arg_1:TrialsFloorCanvas):void
        {
            var _local_2:Object = this._2047892670trialsBtn03;
            if (_local_2 !== _arg_1)
            {
                this._2047892670trialsBtn03 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trialsBtn03", _local_2, _arg_1));
            };
        }

        public function set trialsBtn04(_arg_1:TrialsFloorCanvas):void
        {
            var _local_2:Object = this._2047892669trialsBtn04;
            if (_local_2 !== _arg_1)
            {
                this._2047892669trialsBtn04 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trialsBtn04", _local_2, _arg_1));
            };
        }

        public function ___TrialsPassMainPanel_Button1_click(_arg_1:MouseEvent):void
        {
            trialsAwardPanelVisible();
        }

        override public function initialize():void
        {
            var target:TrialsPassMainPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TrialsPassMainPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TrialsPassMainPanelWatcherSetupUtil");
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

        private function _TrialsPassMainPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TRIALS_MAIN_PANEL[0];
            _local_1 = ResManager.getIconUrl(parseInt("4130220000388"));
            _local_1 = Language.TRIALS_MAIN_PANEL[6];
            _local_1 = Language.TRIALS_MAIN_PANEL[10];
            _local_1 = Language.TRIALS_MAIN_PANEL[1];
            _local_1 = Language.TRIALS_MAIN_PANEL[2];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.ASTROLOGIC_PANEL_U[38];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.TRIALS_MAIN_PANEL[12];
            _local_1 = Language.TRIALS_MAIN_PANEL[7];
        }

        public function trialsPanelInit():*
        {
            initView();
            visible = true;
        }

        public function set trialsBtn05(_arg_1:TrialsFloorCanvas):void
        {
            var _local_2:Object = this._2047892668trialsBtn05;
            if (_local_2 !== _arg_1)
            {
                this._2047892668trialsBtn05 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trialsBtn05", _local_2, _arg_1));
            };
        }

        public function set trialsBtn01(_arg_1:TrialsFloorCanvas):void
        {
            var _local_2:Object = this._2047892672trialsBtn01;
            if (_local_2 !== _arg_1)
            {
                this._2047892672trialsBtn01 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trialsBtn01", _local_2, _arg_1));
            };
        }

        public function __trialsBtn04_click(_arg_1:MouseEvent):void
        {
            trialsSelect(4);
        }

        public function set fa3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._101080fa3;
            if (_local_2 !== _arg_1)
            {
                this._101080fa3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fa3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn0():BasicGlowButton
        {
            return (this._1863324756bangBtn0);
        }

        public function set fa5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._101082fa5;
            if (_local_2 !== _arg_1)
            {
                this._101082fa5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fa5", _local_2, _arg_1));
            };
        }

        public function set fa2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._101079fa2;
            if (_local_2 !== _arg_1)
            {
                this._101079fa2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fa2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get faward():BasicDelayButton
        {
            return (this._1281570377faward);
        }

        private function onTrialsPanelInit(_arg_1:Object):void
        {
            if (_arg_1)
            {
                trialsCharDataInit(_arg_1);
                trialsSelect(_lastHitFloor);
            };
        }

        public function set fa1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._101078fa1;
            if (_local_2 !== _arg_1)
            {
                this._101078fa1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fa1", _local_2, _arg_1));
            };
        }

        public function set gaBtn0(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._1254502066gaBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1254502066gaBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn0", _local_2, _arg_1));
            };
        }

        public function set fa4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._101081fa4;
            if (_local_2 !== _arg_1)
            {
                this._101081fa4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fa4", _local_2, _arg_1));
            };
        }

        public function set floorInfo(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1712711974floorInfo;
            if (_local_2 !== _arg_1)
            {
                this._1712711974floorInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "floorInfo", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("trialsPanelInit", new Responder(onTrialsPanelInit));
        }

        [Bindable(event="propertyChange")]
        public function get fa1():ItemSlot
        {
            return (this._101078fa1);
        }

        [Bindable(event="propertyChange")]
        public function get fa2():ItemSlot
        {
            return (this._101079fa2);
        }

        [Bindable(event="propertyChange")]
        public function get fa3():ItemSlot
        {
            return (this._101080fa3);
        }

        [Bindable(event="propertyChange")]
        public function get fa4():ItemSlot
        {
            return (this._101081fa4);
        }

        private function _TrialsPassMainPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_MAIN_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrialsPassMainPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_TrialsPassMainPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000388")));
            }, function (_arg_1:Object):void
            {
                _TrialsPassMainPanel_Image1.source = _arg_1;
            }, "_TrialsPassMainPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_MAIN_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                faward.label = _arg_1;
            }, "faward.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_MAIN_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn0.label = _arg_1;
            }, "gaBtn0.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_MAIN_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrialsPassMainPanel_Label2.text = _arg_1;
            }, "_TrialsPassMainPanel_Label2.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_MAIN_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrialsPassMainPanel_Label3.text = _arg_1;
            }, "_TrialsPassMainPanel_Label3.text");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _TrialsPassMainPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_TrialsPassMainPanel_LinkButton1.overSkin");
            result[6] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _TrialsPassMainPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_TrialsPassMainPanel_LinkButton1.upSkin");
            result[7] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _TrialsPassMainPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_TrialsPassMainPanel_LinkButton1.downSkin");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrialsPassMainPanel_LinkButton1.label = _arg_1;
            }, "_TrialsPassMainPanel_LinkButton1.label");
            result[9] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _TrialsPassMainPanel_LinkButton2.setStyle("overSkin", _arg_1);
            }, "_TrialsPassMainPanel_LinkButton2.overSkin");
            result[10] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _TrialsPassMainPanel_LinkButton2.setStyle("upSkin", _arg_1);
            }, "_TrialsPassMainPanel_LinkButton2.upSkin");
            result[11] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _TrialsPassMainPanel_LinkButton2.setStyle("downSkin", _arg_1);
            }, "_TrialsPassMainPanel_LinkButton2.downSkin");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_MAIN_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrialsPassMainPanel_LinkButton2.label = _arg_1;
            }, "_TrialsPassMainPanel_LinkButton2.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_MAIN_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[14] = binding;
            return (result);
        }

        public function set lfLable(_arg_1:Label):void
        {
            var _local_2:Object = this._59498092lfLable;
            if (_local_2 !== _arg_1)
            {
                this._59498092lfLable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lfLable", _local_2, _arg_1));
            };
        }

        public function __faward_click(_arg_1:MouseEvent):void
        {
            trialsFirstAwardGet();
        }

        [Bindable(event="propertyChange")]
        public function get fa5():ItemSlot
        {
            return (this._101082fa5);
        }

        public function __trialsBtn01_click(_arg_1:MouseEvent):void
        {
            trialsSelect(1);
        }

        public function __trialsBtn05_click(_arg_1:MouseEvent):void
        {
            trialsSelect(5);
        }

        private function onTrialsTimeUpdate():void
        {
            lfLable.text = Language.TRIALS_MAIN_PANEL[3].replace("{num}", Number(ToolKit.minus(_m, _n)));
        }


    }
}//package com.qeedoo.ui.view.compDragable

