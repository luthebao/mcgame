// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PRSShowCvs

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponent;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.view.compGameStage.CreatureShowView;
    import com.qeedoo.game.object.Creature;
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

    public class PRSShowCvs extends Canvas implements IBindingClient 
    {

        private static const PAGE_NUM:uint = 3;
        private static const NOTACTIVED:uint = 1;
        private static const ACTIVED:uint = 2;
        private static const EQUIPTED:uint = 3;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2086414968stateBtn3:BasicGlowButton;
        private var _2086134420stateLbl1:Label;
        public var tab:int;
        private var _2086414969stateBtn2:BasicGlowButton;
        private var _417806515showViewContainer2:UIComponent;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _339324305showCvs2:Canvas;
        private var _curPage:int = 1;
        private var _339324306showCvs1:Canvas;
        private var _339324304showCvs3:Canvas;
        private var _prsInfo:Object;
        private var _2086414970stateBtn1:BasicGlowButton;
        private var _2086134418stateLbl3:Label;
        private var _417806514showViewContainer1:UIComponent;
        public var _PRSShowCvs_Label1:Label;
        private var _417806516showViewContainer3:UIComponent;
        private var _2086134419stateLbl2:Label;
        private var _totalPage:int;
        private var _showAllArr:Array;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":430,
                    "height":250,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PRSShowCvs_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.fontSize = 12;
                            this.horizontalCenter = "100";
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"showCvs1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":135,
                                "height":180,
                                "x":18,
                                "y":22,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":UIComponent,
                                    "id":"showViewContainer1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":60,
                                            "y":123
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"stateLbl1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":152});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"stateBtn1",
                        "events":{"click":"__stateBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "x":50,
                                "y":205
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"showCvs2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":135,
                                "height":180,
                                "x":158,
                                "y":23,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":UIComponent,
                                    "id":"showViewContainer2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":60,
                                            "y":123
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"stateLbl2",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":152});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"stateBtn2",
                        "events":{"click":"__stateBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "x":195,
                                "y":206
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"showCvs3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":135,
                                "height":180,
                                "x":298,
                                "y":23,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":UIComponent,
                                    "id":"showViewContainer3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":60,
                                            "y":123
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"stateLbl3",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":152});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"stateBtn3",
                        "events":{"click":"__stateBtn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "x":336,
                                "y":206
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelectorOnly,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "1";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"changeCall":updatePage});
                        }
                    })]
                });
            }
        });
        private var _showArr:Array = new Array();
        private var _btnState:Array = [0, 0, 0];
        private var _showIdArr:Array = [0, 0, 0];
        private var _creObjArr:Array = new Array();
        private var _creShowArr:Array = new Array();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PRSShowCvs()
        {
            mx_internal::_document = this;
            this.width = 430;
            this.height = 250;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___PRSShowCvs_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PRSShowCvs._watcherSetupUtil = _arg_1;
        }


        public function set showCvs3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._339324304showCvs3;
            if (_local_2 !== _arg_1)
            {
                this._339324304showCvs3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCvs3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stateLbl1():Label
        {
            return (this._2086134420stateLbl1);
        }

        [Bindable(event="propertyChange")]
        public function get stateLbl2():Label
        {
            return (this._2086134419stateLbl2);
        }

        [Bindable(event="propertyChange")]
        public function get stateBtn1():BasicGlowButton
        {
            return (this._2086414970stateBtn1);
        }

        private function clickHandlerByState(_arg_1:Number):void
        {
            var _local_2:uint = _btnState[(_arg_1 - 1)];
            var _local_3:Number = _showIdArr[(_arg_1 - 1)];
            switch (_local_2)
            {
                case NOTACTIVED:
                    if (tab == 0)
                    {
                        _core.remote.call("activePRSShow", null, _core.cid, _local_3);
                    }
                    else
                    {
                        _core.remote.call("activePRSShowSpe", null, _core.cid, _local_3);
                    };
                    return;
                case ACTIVED:
                    _core.remote.call("replacePRSShow", null, _core.cid, _local_3);
                    return;
                case EQUIPTED:
                    _core.remote.call("cancelPRSShow", null, _core.cid, _local_3);
                    return;
            };
        }

        public function __stateBtn2_click(_arg_1:MouseEvent):void
        {
            clickHandlerByState(2);
        }

        public function set showViewContainer3(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._417806516showViewContainer3;
            if (_local_2 !== _arg_1)
            {
                this._417806516showViewContainer3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showViewContainer3", _local_2, _arg_1));
            };
        }

        public function set stateBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2086414970stateBtn1;
            if (_local_2 !== _arg_1)
            {
                this._2086414970stateBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        [Bindable(event="propertyChange")]
        public function get stateBtn3():BasicGlowButton
        {
            return (this._2086414968stateBtn3);
        }

        override public function initialize():void
        {
            var target:PRSShowCvs;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PRSShowCvs_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PRSShowCvsWatcherSetupUtil");
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

        public function set pageSelector(_arg_1:PageSelectorOnly):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCvs3():Canvas
        {
            return (this._339324304showCvs3);
        }

        private function init():void
        {
            var _local_1:Object;
            _showAllArr = (GameData.d[GamePredef.TBL_PRS_SHOW] as Array).slice(1);
            for (_local_1 in _showAllArr)
            {
                if (_showAllArr[_local_1]["tab"] == tab)
                {
                    _showArr.push(_showAllArr[_local_1]);
                };
            };
            _showArr.sortOn("position", Array.NUMERIC);
        }

        public function set stateBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2086414969stateBtn2;
            if (_local_2 !== _arg_1)
            {
                this._2086414969stateBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateBtn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCvs2():Canvas
        {
            return (this._339324305showCvs2);
        }

        private function _PRSShowCvs_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PRS_PANEL[9];
        }

        public function __stateBtn1_click(_arg_1:MouseEvent):void
        {
            clickHandlerByState(1);
        }

        [Bindable(event="propertyChange")]
        public function get showViewContainer1():UIComponent
        {
            return (this._417806514showViewContainer1);
        }

        [Bindable(event="propertyChange")]
        public function get showViewContainer3():UIComponent
        {
            return (this._417806516showViewContainer3);
        }

        public function __stateBtn3_click(_arg_1:MouseEvent):void
        {
            clickHandlerByState(3);
        }

        public function set stateBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2086414968stateBtn3;
            if (_local_2 !== _arg_1)
            {
                this._2086414968stateBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateBtn3", _local_2, _arg_1));
            };
        }

        private function _PRSShowCvs_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRS_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PRSShowCvs_Label1.text = _arg_1;
            }, "_PRSShowCvs_Label1.text");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get showViewContainer2():UIComponent
        {
            return (this._417806515showViewContainer2);
        }

        [Bindable(event="propertyChange")]
        public function get stateBtn2():BasicGlowButton
        {
            return (this._2086414969stateBtn2);
        }

        public function set showCvs1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._339324306showCvs1;
            if (_local_2 !== _arg_1)
            {
                this._339324306showCvs1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCvs1", _local_2, _arg_1));
            };
        }

        public function set showCvs2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._339324305showCvs2;
            if (_local_2 !== _arg_1)
            {
                this._339324305showCvs2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCvs2", _local_2, _arg_1));
            };
        }

        public function set stateLbl3(_arg_1:Label):void
        {
            var _local_2:Object = this._2086134418stateLbl3;
            if (_local_2 !== _arg_1)
            {
                this._2086134418stateLbl3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateLbl3", _local_2, _arg_1));
            };
        }

        public function set showViewContainer1(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._417806514showViewContainer1;
            if (_local_2 !== _arg_1)
            {
                this._417806514showViewContainer1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showViewContainer1", _local_2, _arg_1));
            };
        }

        public function set showViewContainer2(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._417806515showViewContainer2;
            if (_local_2 !== _arg_1)
            {
                this._417806515showViewContainer2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showViewContainer2", _local_2, _arg_1));
            };
        }

        public function set stateLbl2(_arg_1:Label):void
        {
            var _local_2:Object = this._2086134419stateLbl2;
            if (_local_2 !== _arg_1)
            {
                this._2086134419stateLbl2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateLbl2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCvs1():Canvas
        {
            return (this._339324306showCvs1);
        }

        public function ___PRSShowCvs_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get stateLbl3():Label
        {
            return (this._2086134418stateLbl3);
        }

        public function set stateLbl1(_arg_1:Label):void
        {
            var _local_2:Object = this._2086134420stateLbl1;
            if (_local_2 !== _arg_1)
            {
                this._2086134420stateLbl1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateLbl1", _local_2, _arg_1));
            };
        }

        public function updatePRSInfo(_arg_1:Object):void
        {
            _prsInfo = _arg_1;
            updatePage();
        }

        public function updatePage():void
        {
            var _local_7:String;
            var _local_8:Number;
            var _local_9:Object;
            var _local_10:UIComponent;
            var _local_11:Boolean;
            var _local_12:Object;
            var _local_13:uint;
            var _local_14:CreatureShowView;
            var _local_15:Creature;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Object;
            var _local_19:Object;
            var _local_20:Number;
            var _local_21:String;
            var _local_22:Number;
            var _local_23:Number;
            var _local_24:int;
            var _local_25:int;
            var _local_26:int;
            var _local_27:int;
            var _local_1:* = _showArr.length;
            _totalPage = (pageSelector.totalPage = Math.ceil((_local_1 / PAGE_NUM)));
            _curPage = pageSelector.curPage;
            var _local_2:Number = ((_curPage - 1) * PAGE_NUM);
            var _local_3:Object = _prsInfo["actArr"];
            var _local_4:Object = _prsInfo["actLimitObj"];
            var _local_5:Number = _prsInfo["useSid"];
            var _local_6:int = 1;
            while (_local_6 <= PAGE_NUM)
            {
                if ((_local_2 + _local_6) > _showArr.length)
                {
                    (this[("showCvs" + _local_6)] as UIComponent).visible = false;
                    (this[("stateLbl" + _local_6)] as UIComponent).visible = false;
                    (this[("stateBtn" + _local_6)] as UIComponent).visible = false;
                }
                else
                {
                    _local_7 = "";
                    _local_8 = _showArr[((_local_2 + _local_6) - 1)].id;
                    _showIdArr[(_local_6 - 1)] = _local_8;
                    _local_9 = GameData.d[GamePredef.TBL_PRS_SHOW][_local_8];
                    if (!_creShowArr[(_local_6 - 1)])
                    {
                        _local_14 = new CreatureShowView();
                        _creShowArr[(_local_6 - 1)] = _local_14;
                    };
                    _local_10 = (this[("showViewContainer" + _local_6)] as UIComponent);
                    if (_local_10.numChildren > 0)
                    {
                        _local_10.removeChild(_creShowArr[(_local_6 - 1)]);
                    };
                    if (!_creObjArr[(_local_6 - 1)])
                    {
                        _local_15 = new Creature();
                        _local_15.resCode = _local_9["resCode"];
                        _creObjArr[(_local_6 - 1)] = _local_15;
                    }
                    else
                    {
                        _creObjArr[(_local_6 - 1)].resCode = _local_9["resCode"];
                    };
                    _creShowArr[(_local_6 - 1)].gameObject = _creObjArr[(_local_6 - 1)];
                    _local_10.addChild(_creShowArr[(_local_6 - 1)]);
                    _local_11 = false;
                    for (_local_12 in _local_3)
                    {
                        if (Number(_local_3[_local_12]) == _local_8)
                        {
                            _local_11 = true;
                            break;
                        };
                    };
                    if (_local_4[_local_8])
                    {
                        _local_11 = true;
                    };
                    _local_7 = (("<font color='#FF00FF'>" + _local_9["name"]) + "</font>");
                    if (_local_11)
                    {
                        if (((_local_5) && (_local_5 == _local_8)))
                        {
                            (this[("stateBtn" + _local_6)] as BasicGlowButton).label = Language.PRS_PANEL[10];
                            _btnState[(_local_6 - 1)] = EQUIPTED;
                            (this[("stateLbl" + _local_6)] as Label).htmlText = (("<font color='#00FFFF'>" + Language.PRS_PANEL[25]) + "</font>");
                            _local_7 = (_local_7 + ((("\n" + "<font color='#00FFFF'>") + Language.PRS_PANEL[25]) + "</font>"));
                        }
                        else
                        {
                            (this[("stateBtn" + _local_6)] as BasicGlowButton).label = Language.PRS_PANEL[11];
                            _btnState[(_local_6 - 1)] = ACTIVED;
                            (this[("stateLbl" + _local_6)] as Label).htmlText = (("<font color='#00FF00'>" + Language.PRS_PANEL[26]) + "</font>");
                            _local_7 = (_local_7 + ((("\n" + "<font color='#00FF00'>") + Language.PRS_PANEL[22]) + "</font>"));
                        };
                    }
                    else
                    {
                        (this[("stateBtn" + _local_6)] as BasicGlowButton).label = Language.PRS_PANEL[12];
                        _btnState[(_local_6 - 1)] = NOTACTIVED;
                        if (tab == 0)
                        {
                            _local_16 = Number(_local_9["needNum"]);
                            _local_17 = 0;
                            _local_18 = _prsInfo["chipBag"];
                            for (_local_19 in _local_18)
                            {
                                if (((_local_18[_local_19]) && (Number(_local_18[_local_19]["chipId"]) == Number(_local_9["needChipId"]))))
                                {
                                    _local_17 = Number(_local_18[_local_19]["chipNum"]);
                                };
                            };
                            (this[("stateLbl" + _local_6)] as Label).htmlText = Language.PRS_PANEL[27].toString().replace("{hasNum}", String(_local_17)).replace("{needNum}", String(_local_16));
                        }
                        else
                        {
                            _local_16 = Number(_local_9["needNum"]);
                            _local_20 = Number(_local_9["needChipId"]);
                            _local_17 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, _local_20).num;
                            _local_21 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_20]["name"];
                            (this[("stateLbl" + _local_6)] as Label).htmlText = Language.PRS_PANEL[41].toString().replace("{hasNum}", String(_local_17)).replace("{needNum}", String(_local_16)).replace("{name}", _local_21);
                        };
                        _local_7 = (_local_7 + ((("\n" + "<font color='#FF0000'>") + Language.PRS_PANEL[23]) + "</font>"));
                    };
                    if (!(this[("showCvs" + _local_6)] as UIComponent).visible)
                    {
                        (this[("showCvs" + _local_6)] as UIComponent).visible = true;
                    };
                    if (!(this[("stateLbl" + _local_6)] as UIComponent).visible)
                    {
                        (this[("stateLbl" + _local_6)] as UIComponent).visible = true;
                    };
                    if (!(this[("stateBtn" + _local_6)] as UIComponent).visible)
                    {
                        (this[("stateBtn" + _local_6)] as UIComponent).visible = true;
                    };
                    _local_13 = 1;
                    while (_local_13 <= 8)
                    {
                        if (Number(_local_9[("pT" + _local_13)]))
                        {
                            if (((((Number(_local_9[("pT" + _local_13)]) == 59) || (Number(_local_9[("pT" + _local_13)]) == 60)) || (Number(_local_9[("pT" + _local_13)]) == 62)) || (Number(_local_9[("pT" + _local_13)]) == 63)))
                            {
                                _local_7 = (_local_7 + ((("\n" + Language.PRS_PROP_TIP[Number(_local_9[("pT" + _local_13)])]) + (Number(_local_9[("pN" + _local_13)]) / 100)) + "%"));
                            }
                            else
                            {
                                if (((((((Number(_local_9[("pT" + _local_13)]) == 1) || (Number(_local_9[("pT" + _local_13)]) == 4)) || (Number(_local_9[("pT" + _local_13)]) == 5)) || (Number(_local_9[("pT" + _local_13)]) == 6)) || (Number(_local_9[("pT" + _local_13)]) == 7)) || (Number(_local_9[("pT" + _local_13)]) == 11)))
                                {
                                    _local_7 = (_local_7 + (("\n" + Language.PRS_PROP_TIP[Number(_local_9[("pT" + _local_13)])]) + Number(_local_9[("pN" + _local_13)])));
                                }
                                else
                                {
                                    _local_7 = (_local_7 + (("\n" + Language.PRS_PROP_TIP[Number(_local_9[("pT" + _local_13)])]) + (Number(_local_9[("pN" + _local_13)]) / 100)));
                                };
                            };
                        };
                        _local_13++;
                    };
                    if (_local_4[_local_8])
                    {
                        _local_22 = Number(_local_4[_local_8]);
                        _local_23 = new Date().getTime();
                        _local_24 = int(Math.ceil((((_local_22 - _local_23) / 1000) / 60)));
                        _local_25 = int((_local_24 / (60 * 24)));
                        _local_26 = int(((_local_24 % (60 * 24)) / 60));
                        _local_27 = ((_local_24 % (60 * 24)) % 60);
                        _local_7 = (_local_7 + ((("\n" + "<font color='#00FFFF'>") + Language.PRS_PANEL[24].toString().replace("{min}", _local_27).replace("{day}", _local_25).replace("{hour}", _local_26)) + "</font>"));
                    };
                    (this[("showCvs" + _local_6)] as UIComponent).toolTip = _local_7;
                };
                _local_6++;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

