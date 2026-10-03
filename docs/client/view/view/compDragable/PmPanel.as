// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PmPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.Currency;
    import mx.controls.Label;
    import mx.controls.Alert;
    import mx.controls.Button;
    import mx.core.UIComponent;
    import flash.display.MovieClip;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import flash.utils.Dictionary;
    import flash.filters.ColorMatrixFilter;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import mx.core.IUITextField;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.utils.TimeUtil;
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

    public class PmPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2068466327pmImage5:Image;
        private var _2068466325pmImage3:Image;
        private var _2068466326pmImage4:Image;
        private var _1469055782vipInfo1:Canvas;
        private var _2068466330pmImage8:Image;
        private var _2068466331pmImage9:Image;
        private var _1177514720itemText:RoundedLabel;
        private var _2068466324pmImage2:Image;
        private var _617073764tMonthCard:Canvas;
        private var _1649072453monthImage:Image;
        private var _98536402gold2:Currency;
        private var _1943535025tMonthImage:Image;
        public var _PmPanel_RoundedLabel2:RoundedLabel;
        public var _PmPanel_RoundedLabel3:RoundedLabel;
        private var _462873678vipDesc:Label;
        public var _PmPanel_Label1:Label;
        private var _1754012778hYearImage:Image;
        private var _1191676748selfHead:Image;
        private var _463030891vipInfo:Canvas;
        private var processFlagObj:Object;
        internal var _alert:Alert;
        private var _upExp:Number = 0;
        public var _PmPanel_Button1:Button;
        public var _PmPanel_Button2:Button;
        public var _PmPanel_Button3:Button;
        public var _PmPanel_Button4:Button;
        private var VIP_TEMP_LEVEL_DESC:String = "vip";
        private var _98536401gold1:Currency;
        private var _472412811hYearCard:Canvas;
        private var _1300311632monthCard:Canvas;
        private var _nExp:Number = 0;
        private var _time:Number = 0;
        private var _566144145pmExpProcess:UIComponent;
        private var VIP_TEMP_VALUE_DESC:String = "value";
        private var _98536403gold3:Currency;
        public var panelDataFlush:Boolean = false;
        public var pmLevelProcess:MovieClip;
        private var _2068466323pmImage1:Image;
        private var _1368895518_lastTime:String = "";
        private var _110371416title:BasicTitleCanvas;
        private var _2068466328pmImage6:Image;
        private var _pmType:Number = -1;
        private var _2068466329pmImage7:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":340,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"title"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":39,
                                "width":480,
                                "height":285,
                                "styleName":"txtArea",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":UIComponent,
                                    "id":"pmExpProcess",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":84,
                                            "y":51,
                                            "width":380,
                                            "height":18,
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PmPanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":260,
                                            "y":51,
                                            "width":50,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"pmImage1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":75.5,
                                            "y":28,
                                            "width":26,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"pmImage2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":120,
                                            "y":28,
                                            "width":26,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"pmImage3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":167,
                                            "y":28,
                                            "width":26,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"pmImage4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":212,
                                            "y":28,
                                            "width":26,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"pmImage5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":260,
                                            "y":28,
                                            "width":26,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"pmImage6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":305,
                                            "y":28,
                                            "width":26,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"pmImage7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":352,
                                            "y":28,
                                            "width":26,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"pmImage8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":399,
                                            "y":28,
                                            "width":26,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"pmImage9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":445,
                                            "y":28,
                                            "width":26,
                                            "height":22
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"selfHead",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "useHandCursor":true,
                                "buttonMode":true,
                                "width":49,
                                "x":24,
                                "height":47,
                                "y":52
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"vipDesc",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                            this.fontFamily = "宋体";
                            this.fontWeight = "bold";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":91,
                                "y":45,
                                "width":282,
                                "height":23
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"hYearCard",
                        "events":{"click":"__hYearCard_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":22,
                                "y":107,
                                "width":150,
                                "height":66,
                                "useHandCursor":true,
                                "styleName":"CanvasShopSlot",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"hYearImage",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "18";
                                        this.top = "18";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":32,
                                            "height":32
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"itemText",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":66,
                                            "y":10,
                                            "width":83,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"gold3",
                                    "events":{"creationComplete":"__gold3_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":true,
                                            "x":66,
                                            "y":25,
                                            "value":2888,
                                            "type":1,
                                            "width":82,
                                            "height":16
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_PmPanel_Button1",
                                    "events":{"click":"___PmPanel_Button1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":85,
                                            "y":40,
                                            "height":20,
                                            "width":57,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"vipInfo1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":175,
                                "width":460,
                                "height":140,
                                "styleName":"txtArea",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"vipInfo",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10,
                                            "width":436,
                                            "height":119,
                                            "horizontalScrollPolicy":"off"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_PmPanel_Button2",
                        "events":{"click":"___PmPanel_Button2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":381,
                                "y":45,
                                "height":25,
                                "width":84,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"tMonthCard",
                        "events":{"click":"__tMonthCard_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":173,
                                "y":107,
                                "width":150,
                                "height":66,
                                "useHandCursor":true,
                                "styleName":"CanvasShopSlot",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"tMonthImage",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "18";
                                        this.top = "18";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":32,
                                            "height":32
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_PmPanel_RoundedLabel2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":66,
                                            "y":10,
                                            "width":83,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"gold2",
                                    "events":{"creationComplete":"__gold2_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":true,
                                            "x":66,
                                            "y":25,
                                            "value":1688,
                                            "type":1,
                                            "width":82,
                                            "height":16
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_PmPanel_Button3",
                                    "events":{"click":"___PmPanel_Button3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":85,
                                            "y":40,
                                            "height":20,
                                            "width":57,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"monthCard",
                        "events":{"click":"__monthCard_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":324,
                                "y":107,
                                "width":150,
                                "height":66,
                                "useHandCursor":true,
                                "styleName":"CanvasShopSlot",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"monthImage",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "18";
                                        this.top = "18";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":32,
                                            "height":32
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"gold1",
                                    "events":{"creationComplete":"__gold1_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":true,
                                            "x":66,
                                            "y":25,
                                            "value":688,
                                            "type":1,
                                            "width":82,
                                            "height":16
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_PmPanel_RoundedLabel3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":66,
                                            "y":10,
                                            "width":83,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_PmPanel_Button4",
                                    "events":{"click":"___PmPanel_Button4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":85,
                                            "y":40,
                                            "height":20,
                                            "width":57,
                                            "styleName":"BtnStdRed"
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
        private var _levelUpExp:Array = [0, 15000, 45000, 105000, 205000, 355000, 555000, 805000, 1105000];
        private var btnDict:Dictionary = new Dictionary();
        private var _matrix:Array = [new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0, 0, 0, 1, 0])];
        public var pmLevelProcessMp:Class = PmPanel_pmLevelProcessMp;
        private var _levelGold:Object = {
            "1":688,
            "2":1688,
            "3":2888
        };
        private var pm1Pic:Class = PmPanel_pm1Pic;
        private var pm2Pic:Class = PmPanel_pm2Pic;
        private var pm3Pic:Class = PmPanel_pm3Pic;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PmPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 340;
            this.styleName = "StandardContent";
            this.x = 92.5;
            this.y = 76;
            this.addEventListener("creationComplete", ___PmPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PmPanel._watcherSetupUtil = _arg_1;
        }


        public function lightPMPic(_arg_1:Number):void
        {
            var _local_2:*;
            var _local_3:Number;
            for (_local_2 in _levelUpExp)
            {
                _local_3 = (Number(_local_2) + 1);
                if ((((_arg_1) && (!(_arg_1 == 0))) && (ToolKit.isSmallOrEqual(_local_3, _arg_1))))
                {
                    this[("pmImage" + _local_3)].filters = [];
                }
                else
                {
                    this[("pmImage" + _local_3)].filters = _matrix;
                };
            };
        }

        public function __gold3_creationComplete(_arg_1:FlexEvent):void
        {
            changeFontSize(3);
        }

        [Bindable(event="propertyChange")]
        public function get monthImage():Image
        {
            return (this._1649072453monthImage);
        }

        public function initPmLevelUpDate(_arg_1:Number):void
        {
            var _local_2:Number;
            if (((_arg_1) && (ToolKit.isBigOrEqual(_arg_1, 0))))
            {
                showInfoByLevel(_arg_1);
            }
            else
            {
                showInfoByLevel(1);
            };
            lightPMPic(_arg_1);
            if (((_arg_1) && (ToolKit.isBigOrEqual(_arg_1, 0))))
            {
                _local_2 = (Number(_arg_1) + 10);
                this.vipDesc.htmlText = Language.PM_PANEL[10].toString().replace("{name}", _core.player.name).replace("{pm}", Language.PM_PANEL[_local_2].toString());
            }
            else
            {
                this.vipDesc.htmlText = Language.PM_PANEL[9].toString().replace("{name}", _core.player.name);
            };
        }

        public function set pmImage1(_arg_1:Image):void
        {
            var _local_2:Object = this._2068466323pmImage1;
            if (_local_2 !== _arg_1)
            {
                this._2068466323pmImage1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImage1", _local_2, _arg_1));
            };
        }

        public function __tMonthCard_click(_arg_1:MouseEvent):void
        {
            showVipFunc(2);
        }

        private function init():void
        {
            var _local_1:*;
            var _local_2:Number;
            if (!pmLevelProcess)
            {
                pmLevelProcess = new ((pmLevelProcessMp as Class))();
                pmExpProcess.addChild(pmLevelProcess);
            };
            pmLevelProcess.gotoAndStop(0);
            for (_local_1 in _levelUpExp)
            {
                _local_2 = (Number(_local_1) + 1);
                this[("pmImage" + _local_2)].filters = _matrix;
            };
        }

        [Bindable(event="propertyChange")]
        public function get vipInfo1():Canvas
        {
            return (this._1469055782vipInfo1);
        }

        public function set pmImage2(_arg_1:Image):void
        {
            var _local_2:Object = this._2068466324pmImage2;
            if (_local_2 !== _arg_1)
            {
                this._2068466324pmImage2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImage2", _local_2, _arg_1));
            };
        }

        public function set pmImage6(_arg_1:Image):void
        {
            var _local_2:Object = this._2068466328pmImage6;
            if (_local_2 !== _arg_1)
            {
                this._2068466328pmImage6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImage6", _local_2, _arg_1));
            };
        }

        public function flushProcesFlag(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:String;
            var _local_4:*;
            var _local_5:Array;
            var _local_6:String;
            if (_arg_1)
            {
                if (btnDict[_arg_1.index])
                {
                    if (!processFlagObj)
                    {
                        processFlagObj = new Object();
                    };
                    processFlagObj[_arg_1.index] = {
                        "day":_arg_1.day,
                        "type":_arg_1.type,
                        "time":_arg_1.time
                    };
                    _local_2 = GameData.d[GamePredef.TBL_PM_RIGHT];
                    _local_3 = "";
                    for (_local_4 in _local_2)
                    {
                        if (((_local_2[_local_4]) && (Number(_local_2[_local_4].id) == Number(_arg_1.index))))
                        {
                            _local_3 = _local_2[_local_4]["countConfig"];
                            break;
                        };
                    };
                    if (((!(_local_3)) || (_local_3 == "")))
                    {
                        return;
                    };
                    _local_5 = null;
                    if (_local_3)
                    {
                        _local_5 = _local_3.split("|");
                    };
                    if (_local_5)
                    {
                        if (Number(processFlagObj[_arg_1.index]["type"]) == 1)
                        {
                            if (Number(_local_5[2]) <= Number(processFlagObj[_arg_1.index]["time"]))
                            {
                                btnDict[_arg_1.index].removeEventListener(MouseEvent.CLICK, doPmOperation);
                                btnDict[_arg_1.index].htmlText = Language.PM_PANEL[8];
                                btnDict[_arg_1.index].buttonMode = false;
                                btnDict[_arg_1.index].useHandCursor = false;
                                btnDict[_arg_1.index].mouseChildren = false;
                            }
                            else
                            {
                                _local_6 = ((processFlagObj[_arg_1.index]["time"] + "/") + _local_5[2]);
                                btnDict[_arg_1.index].htmlText = Language.PM_PANEL[7].toString().replace("{num}", _local_6);
                            };
                        }
                        else
                        {
                            if (Number(processFlagObj[_arg_1.index]["type"]) != 4)
                            {
                                if (Number(_local_5[2]) <= Number(processFlagObj[_arg_1.index]["time"]))
                                {
                                    btnDict[_arg_1.index].removeEventListener(MouseEvent.CLICK, doPmOperation);
                                    btnDict[_arg_1.index].htmlText = Language.PM_PANEL[8];
                                    btnDict[_arg_1.index].buttonMode = false;
                                    btnDict[_arg_1.index].useHandCursor = false;
                                    btnDict[_arg_1.index].mouseChildren = false;
                                }
                                else
                                {
                                    _local_6 = ((processFlagObj[_arg_1.index]["time"] + "/") + _local_5[2]);
                                    btnDict[_arg_1.index].htmlText = Language.PM_PANEL[7].toString().replace("{num}", _local_6);
                                };
                            };
                        };
                    };
                };
            };
        }

        public function set pmImage5(_arg_1:Image):void
        {
            var _local_2:Object = this._2068466327pmImage5;
            if (_local_2 !== _arg_1)
            {
                this._2068466327pmImage5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImage5", _local_2, _arg_1));
            };
        }

        public function ___PmPanel_Button2_click(_arg_1:MouseEvent):void
        {
            showPmInfo();
        }

        public function set pmImage9(_arg_1:Image):void
        {
            var _local_2:Object = this._2068466331pmImage9;
            if (_local_2 !== _arg_1)
            {
                this._2068466331pmImage9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImage9", _local_2, _arg_1));
            };
        }

        private function onClickNpc(_arg_1:Boolean):*
        {
            if (!_arg_1)
            {
            };
        }

        public function set pmImage7(_arg_1:Image):void
        {
            var _local_2:Object = this._2068466329pmImage7;
            if (_local_2 !== _arg_1)
            {
                this._2068466329pmImage7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImage7", _local_2, _arg_1));
            };
        }

        public function set pmImage3(_arg_1:Image):void
        {
            var _local_2:Object = this._2068466325pmImage3;
            if (_local_2 !== _arg_1)
            {
                this._2068466325pmImage3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImage3", _local_2, _arg_1));
            };
        }

        public function set pmImage8(_arg_1:Image):void
        {
            var _local_2:Object = this._2068466330pmImage8;
            if (_local_2 !== _arg_1)
            {
                this._2068466330pmImage8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImage8", _local_2, _arg_1));
            };
        }

        public function buyPm(level:Number):void
        {
            var handler:Function;
            if ((((!(level)) || (level < 1)) || (level > 3)))
            {
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyPm", new Responder(onBuyPm), level);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var name:* = "";
            var day:* = "";
            switch (level)
            {
                case 1:
                    name = Language.PM_PANEL[11].toString().replace(Language.PM_INFO_PANEL[4].toString(), Language.PM_PANEL[5].toString());
                    day = 30;
                    break;
                case 2:
                    name = Language.PM_PANEL[12].toString().replace(Language.PM_INFO_PANEL[5].toString(), Language.PM_PANEL[4].toString());
                    day = 90;
                    break;
                case 3:
                    name = Language.PM_PANEL[13].toString().replace(Language.PM_INFO_PANEL[6].toString(), Language.PM_PANEL[3].toString());
                    day = 180;
                    break;
            };
            var str:* = "";
            if (((_pmType) && (ToolKit.isBigThan(_pmType, 0))))
            {
                if (((_core.player.pmLevel) && (ToolKit.isBigThan(_core.player.pmLevel, 0))))
                {
                    if (ToolKit.isBigThan(level, _pmType))
                    {
                        str = Language.PM_PANEL[35];
                    }
                    else
                    {
                        if (ToolKit.isEqual(level, _pmType))
                        {
                            str = Language.PM_PANEL[30];
                        }
                        else
                        {
                            _core.sysMidNote(Language.PM_PANEL[31]);
                            return;
                        };
                    };
                };
            }
            else
            {
                str = Language.PM_PANEL[34].toString().replace("{gold}", _levelGold[level]).replace("{name}", name).replace("{day}", day);
            };
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        private function _PmPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _nExp;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmExpProcess.toolTip = _arg_1;
            }, "pmExpProcess.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_nExp > 0) ? true : false);
            }, function (_arg_1:Boolean):void
            {
                _PmPanel_Label1.visible = _arg_1;
            }, "_PmPanel_Label1.visible");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _nExp;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmPanel_Label1.toolTip = _arg_1;
            }, "_PmPanel_Label1.toolTip");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PM_ZUAN1);
            }, function (_arg_1:Object):void
            {
                pmImage1.source = _arg_1;
            }, "pmImage1.source");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _levelUpExp[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmImage1.toolTip = _arg_1;
            }, "pmImage1.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PM_ZUAN2);
            }, function (_arg_1:Object):void
            {
                pmImage2.source = _arg_1;
            }, "pmImage2.source");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _levelUpExp[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmImage2.toolTip = _arg_1;
            }, "pmImage2.toolTip");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PM_ZUAN3);
            }, function (_arg_1:Object):void
            {
                pmImage3.source = _arg_1;
            }, "pmImage3.source");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _levelUpExp[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmImage3.toolTip = _arg_1;
            }, "pmImage3.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PM_ZUAN4);
            }, function (_arg_1:Object):void
            {
                pmImage4.source = _arg_1;
            }, "pmImage4.source");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _levelUpExp[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmImage4.toolTip = _arg_1;
            }, "pmImage4.toolTip");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PM_ZUAN5);
            }, function (_arg_1:Object):void
            {
                pmImage5.source = _arg_1;
            }, "pmImage5.source");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _levelUpExp[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmImage5.toolTip = _arg_1;
            }, "pmImage5.toolTip");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PM_ZUAN6);
            }, function (_arg_1:Object):void
            {
                pmImage6.source = _arg_1;
            }, "pmImage6.source");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _levelUpExp[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmImage6.toolTip = _arg_1;
            }, "pmImage6.toolTip");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PM_ZUAN7);
            }, function (_arg_1:Object):void
            {
                pmImage7.source = _arg_1;
            }, "pmImage7.source");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _levelUpExp[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmImage7.toolTip = _arg_1;
            }, "pmImage7.toolTip");
            result[17] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PM_ZUAN8);
            }, function (_arg_1:Object):void
            {
                pmImage8.source = _arg_1;
            }, "pmImage8.source");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _levelUpExp[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmImage8.toolTip = _arg_1;
            }, "pmImage8.toolTip");
            result[19] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PM_ZUAN9);
            }, function (_arg_1:Object):void
            {
                pmImage9.source = _arg_1;
            }, "pmImage9.source");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _levelUpExp[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pmImage9.toolTip = _arg_1;
            }, "pmImage9.toolTip");
            result[21] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pm3Pic);
            }, function (_arg_1:Object):void
            {
                hYearImage.source = _arg_1;
            }, "hYearImage.source");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                itemText.text = _arg_1;
            }, "itemText.text");
            result[23] = binding;
            binding = new Binding(this, function ():uint
            {
                return (GamePredef.CODE_ITEM_COLOR[2]);
            }, function (_arg_1:uint):void
            {
                itemText.setStyle("color", _arg_1);
            }, "itemText.color");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmPanel_Button1.label = _arg_1;
            }, "_PmPanel_Button1.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmPanel_Button2.label = _arg_1;
            }, "_PmPanel_Button2.label");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pm2Pic);
            }, function (_arg_1:Object):void
            {
                tMonthImage.source = _arg_1;
            }, "tMonthImage.source");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmPanel_RoundedLabel2.text = _arg_1;
            }, "_PmPanel_RoundedLabel2.text");
            result[28] = binding;
            binding = new Binding(this, function ():uint
            {
                return (GamePredef.CODE_ITEM_COLOR[1]);
            }, function (_arg_1:uint):void
            {
                _PmPanel_RoundedLabel2.setStyle("color", _arg_1);
            }, "_PmPanel_RoundedLabel2.color");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmPanel_Button3.label = _arg_1;
            }, "_PmPanel_Button3.label");
            result[30] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pm1Pic);
            }, function (_arg_1:Object):void
            {
                monthImage.source = _arg_1;
            }, "monthImage.source");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmPanel_RoundedLabel3.text = _arg_1;
            }, "_PmPanel_RoundedLabel3.text");
            result[32] = binding;
            binding = new Binding(this, function ():uint
            {
                return (GamePredef.CODE_ITEM_COLOR[0]);
            }, function (_arg_1:uint):void
            {
                _PmPanel_RoundedLabel3.setStyle("color", _arg_1);
            }, "_PmPanel_RoundedLabel3.color");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmPanel_Button4.label = _arg_1;
            }, "_PmPanel_Button4.label");
            result[34] = binding;
            return (result);
        }

        public function set vipInfo(_arg_1:Canvas):void
        {
            var _local_2:Object = this._463030891vipInfo;
            if (_local_2 !== _arg_1)
            {
                this._463030891vipInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vipInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get selfHead():Image
        {
            return (this._1191676748selfHead);
        }

        [Bindable(event="propertyChange")]
        public function get tMonthImage():Image
        {
            return (this._1943535025tMonthImage);
        }

        public function set tMonthCard(_arg_1:Canvas):void
        {
            var _local_2:Object = this._617073764tMonthCard;
            if (_local_2 !== _arg_1)
            {
                this._617073764tMonthCard = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tMonthCard", _local_2, _arg_1));
            };
        }

        public function set vipInfo1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1469055782vipInfo1;
            if (_local_2 !== _arg_1)
            {
                this._1469055782vipInfo1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vipInfo1", _local_2, _arg_1));
            };
        }

        public function __monthCard_click(_arg_1:MouseEvent):void
        {
            showVipFunc(1);
        }

        private function StringReplaceAll(_arg_1:String, _arg_2:String, _arg_3:String):String
        {
            return (_arg_1.split(_arg_2).join(_arg_3));
        }

        internal function doPmOperation(_arg_1:Event):void
        {
            var _local_2:Object;
            if (!_core.player.pmLevel)
            {
                return;
            };
            if (Number(_arg_1.currentTarget.name) == 18)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_JEWEL_EXCHANGE);
                if (_local_2)
                {
                    _local_2.visible = true;
                };
                return;
            };
            if (Number(_arg_1.currentTarget.name) == 25)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_STAR_EXCHANGE);
                if (_local_2)
                {
                    _local_2.open();
                };
                return;
            };
            if (_arg_1.currentTarget.name == 24)
            {
                processFlagObj.findback = false;
                btnDict[24].htmlText = Language.PM_PANEL[8];
                btnDict[24].removeEventListener(MouseEvent.CLICK, doPmOperation);
                btnDict[24].buttonMode = false;
                btnDict[24].useHandCursor = false;
                btnDict[24].mouseChildren = false;
            };
            _core.remote.call("doPmOperation", null, _arg_1.currentTarget.name);
        }

        public function set monthCard(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1300311632monthCard;
            if (_local_2 !== _arg_1)
            {
                this._1300311632monthCard = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monthCard", _local_2, _arg_1));
            };
        }

        public function __hYearCard_click(_arg_1:MouseEvent):void
        {
            showVipFunc(3);
        }

        [Bindable(event="propertyChange")]
        public function get vipDesc():Label
        {
            return (this._462873678vipDesc);
        }

        [Bindable(event="propertyChange")]
        public function get title():BasicTitleCanvas
        {
            return (this._110371416title);
        }

        [Bindable(event="propertyChange")]
        public function get vipInfo():Canvas
        {
            return (this._463030891vipInfo);
        }

        [Bindable(event="propertyChange")]
        public function get pmExpProcess():UIComponent
        {
            return (this._566144145pmExpProcess);
        }

        public function set hYearImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1754012778hYearImage;
            if (_local_2 !== _arg_1)
            {
                this._1754012778hYearImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hYearImage", _local_2, _arg_1));
            };
        }

        public function ___PmPanel_Button3_click(_arg_1:MouseEvent):void
        {
            buyPm(2);
        }

        public function set monthImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1649072453monthImage;
            if (_local_2 !== _arg_1)
            {
                this._1649072453monthImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monthImage", _local_2, _arg_1));
            };
        }

        public function set pmImage4(_arg_1:Image):void
        {
            var _local_2:Object = this._2068466326pmImage4;
            if (_local_2 !== _arg_1)
            {
                this._2068466326pmImage4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImage4", _local_2, _arg_1));
            };
        }

        public function onBuyPm(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Date;
            var _local_4:Number;
            if (_arg_1)
            {
                monthCard.buttonMode = false;
                tMonthCard.buttonMode = false;
                hYearCard.buttonMode = false;
                _core.player.pmLevel = _arg_1.level;
                _nExp = _arg_1.data.pmExp;
                this.pmExpProcess.toolTip = _nExp.toString();
                _pmType = _arg_1.data.activeType;
                _local_2 = (Number(((((1000 * 60) * 60) * 24) * _arg_1.data.keepDay)) + Number(_arg_1.data.activeTime));
                _local_3 = new Date(_local_2);
                _local_3.setTime(((_local_3.getTime() + ((_local_3.getTimezoneOffset() * 60) * 1000)) - _core.serverTimeOffSet));
                _lastTime = ((((((((((_local_3.fullYear + "/") + (_local_3.month + 1)) + "/") + _local_3.date) + " ") + _local_3.hours) + ":") + _local_3.minutes) + ":") + _local_3.seconds);
                _local_4 = (Number(_arg_1.level) + 10);
                this.vipDesc.htmlText = Language.PM_PANEL[10].toString().replace("{name}", _core.player.name).replace("{pm}", Language.PM_PANEL[_local_4].toString());
                setExpProcess(_nExp, _core.player.pmLevel);
                lightPMPic(_core.player.pmLevel);
                showInfoByLevel(_arg_1.level);
            };
        }

        [Bindable(event="propertyChange")]
        public function get hYearCard():Canvas
        {
            return (this._472412811hYearCard);
        }

        override public function initialize():void
        {
            var target:PmPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PmPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PmPanelWatcherSetupUtil");
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

        public function ___PmPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get pmImage1():Image
        {
            return (this._2068466323pmImage1);
        }

        private function setExpProcess(_arg_1:Number, _arg_2:Number):*
        {
            var _local_4:Boolean;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            if (!pmLevelProcess)
            {
                pmLevelProcess = new ((pmLevelProcessMp as Class))();
                pmExpProcess.addChild(pmLevelProcess);
            };
            var _local_3:Number = 0;
            if (((!(_arg_1)) || (Number(_arg_1) == 0)))
            {
                _local_3 = 0;
            }
            else
            {
                _local_4 = true;
                _local_5 = 0;
                while (_local_5 <= _levelUpExp.length)
                {
                    if ((((_arg_1 >= _levelUpExp[_local_5]) && (_levelUpExp[(_local_5 + 1)])) && (_arg_1 < _levelUpExp[(_local_5 + 1)])))
                    {
                        _local_6 = (Number(_levelUpExp[(_local_5 + 1)]) - Number(_levelUpExp[_local_5]));
                        _local_7 = 1;
                        while (_local_7 <= 9)
                        {
                            _local_8 = (_arg_1 - Number(_levelUpExp[_local_5]));
                            if (_local_8 >= ((_local_6 * _local_7) / 10))
                            {
                                _local_3 = ((_local_7 * 0.83) + (_local_5 * 7.5));
                                _local_4 = false;
                            };
                            if (_local_8 <= (_local_6 / 10))
                            {
                                _local_3 = (_local_5 * 7.5);
                                _local_4 = false;
                            };
                            _local_7++;
                        };
                        break;
                    };
                    _local_5++;
                };
                if (_local_4)
                {
                    _local_3 = 60;
                };
            };
            pmLevelProcess.gotoAndStop(Math.ceil(_local_3));
            if (((!(_arg_2)) || (_arg_2 == 0)))
            {
                pmLevelProcess.filters = _matrix;
            }
            else
            {
                pmLevelProcess.filters = [];
            };
        }

        [Bindable(event="propertyChange")]
        public function get pmImage7():Image
        {
            return (this._2068466329pmImage7);
        }

        [Bindable(event="propertyChange")]
        public function get pmImage3():Image
        {
            return (this._2068466325pmImage3);
        }

        public function initPanelData(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                selfHead.source = _arg_1.resUrl;
            }
            else
            {
                _local_2 = _core.view.getUI(ViewManager.MAIN_SELF);
                if ((((_local_2) && (_local_2.iconCode)) && (!(_local_2.iconCode == ""))))
                {
                    selfHead.source = ResManager.getIconUrl(_local_2.iconCode);
                };
            };
            _core.remote.call("initPmData", new Responder(onInitPmData));
        }

        [Bindable(event="propertyChange")]
        public function get pmImage8():Image
        {
            return (this._2068466330pmImage8);
        }

        [Bindable(event="propertyChange")]
        public function get pmImage2():Image
        {
            return (this._2068466324pmImage2);
        }

        public function set gold2(_arg_1:Currency):void
        {
            var _local_2:Object = this._98536402gold2;
            if (_local_2 !== _arg_1)
            {
                this._98536402gold2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gold2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get hYearImage():Image
        {
            return (this._1754012778hYearImage);
        }

        public function set gold3(_arg_1:Currency):void
        {
            var _local_2:Object = this._98536403gold3;
            if (_local_2 !== _arg_1)
            {
                this._98536403gold3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gold3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pmImage6():Image
        {
            return (this._2068466328pmImage6);
        }

        private function showInfoByLevel(_arg_1:Number):void
        {
            var _local_2:*;
            var _local_3:Array;
            var _local_4:Number;
            var _local_5:*;
            var _local_6:Number;
            var _local_7:Canvas;
            var _local_8:Label;
            var _local_9:String;
            var _local_10:Label;
            var _local_11:String;
            var _local_12:Array;
            var _local_13:String;
            var _local_14:Date;
            var _local_15:String;
            var _local_16:Number;
            this.vipInfo.removeAllChildren();
            for (_local_2 in this.btnDict)
            {
                delete this.btnDict[_local_2];
            };
            _local_3 = GameData.d[GamePredef.TBL_PM_RIGHT];
            _local_3.sortOn("sortIndex", Array.NUMERIC);
            _local_4 = 28;
            _local_5 = new Label();
            this.vipInfo.addChild(_local_5);
            _local_5.x = 5;
            _local_5.width = 350;
            _local_5.height = 27;
            _local_5.setStyle("color", "#FFFFFF");
            _local_5.setStyle("fontSize", "14");
            _local_5.setStyle("fontFamily", "宋体");
            if (((_core.player.pmLevel) && (!(_core.player.pmLevel == 0))))
            {
                _local_5.htmlText = Language.PM_PANEL[32].toString().replace("{time}", _lastTime);
            }
            else
            {
                _local_6 = (10 + _arg_1);
                _local_5.htmlText = Language.PM_PANEL[33].toString().replace("{pm}", Language.PM_PANEL[_local_6].toString());
            };
            _local_6 = 0;
            for (_local_2 in _local_3)
            {
                if (((_local_3[_local_2][(VIP_TEMP_LEVEL_DESC + _arg_1)]) && (!(_local_3[_local_2][(VIP_TEMP_LEVEL_DESC + _arg_1)] == 0))))
                {
                    _local_7 = new Canvas();
                    _local_6++;
                    _local_7.height = 20;
                    _local_7.setStyle("horizontalScrollPolicy", "off");
                    _local_7.setStyle("verticalScrollPolicy", "off");
                    _local_7.width = 470;
                    _local_7.y = _local_4;
                    _local_4 = (Number(_local_4) + 20);
                    _local_7.x = 15;
                    _local_8 = new Label();
                    _local_8.htmlText = ((_local_6 + ": ") + _local_3[_local_2]["desc"]);
                    if (_local_3[_local_2][(VIP_TEMP_VALUE_DESC + _arg_1)])
                    {
                        _local_9 = ((_local_6 + ": ") + _local_3[_local_2]["desc"].toString());
                        _local_8.htmlText = StringReplaceAll(_local_9, "{num}", _local_3[_local_2][(VIP_TEMP_VALUE_DESC + _arg_1)]);
                    };
                    _local_8.styleName = "BoxLabel";
                    _local_7.addChild(_local_8);
                    _local_8.width = 320;
                    _local_8.x = 5;
                    if (((_local_3[_local_2]["type"]) && (!(Number(_local_3[_local_2]["type"]) == 3))))
                    {
                        _local_10 = new Label();
                        _local_7.addChild(_local_10);
                        btnDict[_local_3[_local_2].id] = _local_10;
                        _local_10.width = 60;
                        _local_10.x = 320;
                        _local_10.buttonMode = true;
                        _local_10.useHandCursor = true;
                        _local_10.mouseChildren = false;
                        _local_10.name = _local_3[_local_2].id;
                        _local_10.styleName = "BoxLabel";
                        if ((((_core.player.pmLevel) && (!(_core.player.pmLevel == 0))) && (_core.player.pmLevel == _arg_1)))
                        {
                            _local_11 = _local_3[_local_2]["countConfig"];
                            _local_12 = null;
                            if (_local_11)
                            {
                                _local_12 = _local_11.split("|");
                            };
                            switch (Number(_local_3[_local_2]["type"]))
                            {
                                case 1:
                                    _local_10.htmlText = Language.PM_PANEL[6];
                                    _local_10.addEventListener(MouseEvent.CLICK, doPmOperation);
                                    break;
                                case 2:
                                    if (_local_12)
                                    {
                                        _local_13 = (("(0/" + _local_12[2]) + ")");
                                        if (((processFlagObj) && (processFlagObj[_local_3[_local_2].id])))
                                        {
                                            _local_13 = (((("(" + processFlagObj[_local_3[_local_2].id]["time"]) + "/") + _local_12[2]) + ")");
                                        };
                                        _local_10.htmlText = Language.PM_PANEL[7].toString().replace("{num}", _local_13);
                                        _local_10.addEventListener(MouseEvent.CLICK, doPmOperation);
                                        if ((((_local_12) && (processFlagObj)) && (processFlagObj[_local_3[_local_2].id])))
                                        {
                                            _local_14 = new Date(_time);
                                            _local_14.setTime(((_local_14.getTime() + ((_local_14.getTimezoneOffset() * 60) * 1000)) - _core.serverTimeOffSet));
                                            if (Number(processFlagObj[_local_3[_local_2].id]["type"]) == 1)
                                            {
                                                _local_15 = ((((_local_14.month + "|") + _local_14.date) + "|") + _local_14.day);
                                                if (((processFlagObj[_local_3[_local_2].id]["day"] == _local_15) && (Number(processFlagObj[_local_3[_local_2].id]["time"]) >= Number(_local_12[2]))))
                                                {
                                                    _local_10.removeEventListener(MouseEvent.CLICK, doPmOperation);
                                                    _local_10.htmlText = Language.PM_PANEL[8];
                                                    _local_10.buttonMode = false;
                                                    _local_10.useHandCursor = false;
                                                    _local_10.mouseChildren = false;
                                                }
                                                else
                                                {
                                                    if (processFlagObj[_local_3[_local_2].id]["day"] != _local_15)
                                                    {
                                                        _local_13 = (("(0/" + _local_12[2]) + ")");
                                                        _local_10.htmlText = Language.PM_PANEL[7].toString().replace("{num}", _local_13);
                                                    };
                                                };
                                            }
                                            else
                                            {
                                                if (processFlagObj[_local_3[_local_2].id]["type"] == 2)
                                                {
                                                    if (ToolKit.isEqual(_local_12[1], 7))
                                                    {
                                                        _local_15 = TimeUtil.getThisMonDay(_time);
                                                        if (((processFlagObj[_local_3[_local_2].id]["day"] == _local_15) && (Number(processFlagObj[_local_3[_local_2].id]["time"]) >= Number(_local_12[2]))))
                                                        {
                                                            _local_10.removeEventListener(MouseEvent.CLICK, doPmOperation);
                                                            _local_10.htmlText = Language.PM_PANEL[8];
                                                            _local_10.buttonMode = false;
                                                            _local_10.useHandCursor = false;
                                                            _local_10.mouseChildren = false;
                                                        }
                                                        else
                                                        {
                                                            if (processFlagObj[_local_3[_local_2].id]["day"] != _local_15)
                                                            {
                                                                _local_13 = (("(0/" + _local_12[2]) + ")");
                                                                _local_10.htmlText = Language.PM_PANEL[7].toString().replace("{num}", _local_13);
                                                            };
                                                        };
                                                    }
                                                    else
                                                    {
                                                        if (ToolKit.isEqual(_local_12[1], 30))
                                                        {
                                                            _local_15 = String(_local_14.month);
                                                            if (((processFlagObj[_local_3[_local_2].id]["day"] == _local_15) && (Number(processFlagObj[_local_3[_local_2].id]["time"]) >= Number(_local_12[2]))))
                                                            {
                                                                _local_10.removeEventListener(MouseEvent.CLICK, doPmOperation);
                                                                _local_10.htmlText = Language.PM_PANEL[8];
                                                                _local_10.buttonMode = false;
                                                                _local_10.useHandCursor = false;
                                                                _local_10.mouseChildren = false;
                                                            }
                                                            else
                                                            {
                                                                if (processFlagObj[_local_3[_local_2].id]["day"] != _local_15)
                                                                {
                                                                    _local_13 = (("(0/" + _local_12[2]) + ")");
                                                                    _local_10.htmlText = Language.PM_PANEL[7].toString().replace("{num}", _local_13);
                                                                };
                                                            };
                                                        }
                                                        else
                                                        {
                                                            _local_16 = ((Number(_local_14.getTime()) - Number(processFlagObj[_local_3[_local_2].id]["day"])) / (((24 * 60) * 60) * 1000));
                                                            if (((_local_16 < _local_12[1]) && (Number(processFlagObj[_local_3[_local_2].id]["time"]) >= Number(_local_12[2]))))
                                                            {
                                                                _local_10.removeEventListener(MouseEvent.CLICK, doPmOperation);
                                                                _local_10.buttonMode = false;
                                                                _local_10.useHandCursor = false;
                                                                _local_10.mouseChildren = false;
                                                                _local_10.htmlText = Language.PM_PANEL[8];
                                                            }
                                                            else
                                                            {
                                                                if (_local_16 >= _local_12[1])
                                                                {
                                                                    _local_13 = (("(0/" + _local_12[2]) + ")");
                                                                    _local_10.htmlText = Language.PM_PANEL[7].toString().replace("{num}", _local_13);
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    break;
                                case 4:
                                    if (!processFlagObj.findback)
                                    {
                                        _local_10.buttonMode = false;
                                        _local_10.useHandCursor = false;
                                        _local_10.mouseChildren = false;
                                    };
                                    break;
                            };
                        };
                        _local_10.setStyle("textDecoration", "underline");
                    };
                    this.vipInfo.addChild(_local_7);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get monthCard():Canvas
        {
            return (this._1300311632monthCard);
        }

        public function set gold1(_arg_1:Currency):void
        {
            var _local_2:Object = this._98536401gold1;
            if (_local_2 !== _arg_1)
            {
                this._98536401gold1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gold1", _local_2, _arg_1));
            };
        }

        private function onInitPmData(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Date;
            panelDataFlush = true;
            if (((_arg_1) && (_arg_1.data)))
            {
                processFlagObj = new Object();
                if (_arg_1.data.pmExp)
                {
                    _nExp = _arg_1.data.pmExp;
                    this.pmExpProcess.toolTip = _nExp.toString();
                }
                else
                {
                    _nExp = 0;
                };
                monthCard.buttonMode = false;
                tMonthCard.buttonMode = false;
                hYearCard.buttonMode = false;
                if (((!(_nExp)) || (Number(_nExp) == 0)))
                {
                    monthCard.buttonMode = true;
                    tMonthCard.buttonMode = true;
                    hYearCard.buttonMode = true;
                };
                _time = _arg_1.date;
                _pmType = _arg_1.data.activeType;
                if (((!(_arg_1.flag)) || (_arg_1.flag == 0)))
                {
                    _core.player.pmLevel = 0;
                    this.vipDesc.htmlText = Language.PM_PANEL[9].toString().replace("{name}", _core.player.name);
                    _lastTime = "";
                    showInfoByLevel(1);
                }
                else
                {
                    _core.player.pmLevel = _arg_1.flag;
                    _local_2 = (Number(_core.player.pmLevel) + 10);
                    this.vipDesc.htmlText = Language.PM_PANEL[10].toString().replace("{name}", _core.player.name).replace("{pm}", Language.PM_PANEL[_local_2].toString());
                    processFlagObj = _arg_1.processFlag;
                    processFlagObj.findback = _arg_1.findback;
                    _local_3 = (Number(((((1000 * 60) * 60) * 24) * _arg_1.data.keepDay)) + Number(_arg_1.data.activeTime));
                    _local_4 = new Date(_local_3);
                    _local_4.setTime(((_local_4.getTime() + ((_local_4.getTimezoneOffset() * 60) * 1000)) - _core.serverTimeOffSet));
                    _lastTime = ((((((((((_local_4.fullYear + "/") + (_local_4.month + 1)) + "/") + _local_4.date) + " ") + _local_4.hours) + ":") + _local_4.minutes) + ":") + _local_4.seconds);
                    showInfoByLevel(_core.player.pmLevel);
                };
                setExpProcess(_nExp, _core.player.pmLevel);
                lightPMPic(_core.player.pmLevel);
                this.visible = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get pmImage4():Image
        {
            return (this._2068466326pmImage4);
        }

        [Bindable(event="propertyChange")]
        public function get pmImage5():Image
        {
            return (this._2068466327pmImage5);
        }

        [Bindable(event="propertyChange")]
        public function get pmImage9():Image
        {
            return (this._2068466331pmImage9);
        }

        [Bindable(event="propertyChange")]
        public function get tMonthCard():Canvas
        {
            return (this._617073764tMonthCard);
        }

        public function set title(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function ___PmPanel_Button4_click(_arg_1:MouseEvent):void
        {
            buyPm(1);
        }

        internal function showVipFunc(_arg_1:Number):void
        {
            if (_core.player.pmLevel)
            {
                return;
            };
            monthCard.filters = [];
            hYearCard.filters = [];
            tMonthCard.filters = [];
            switch (_arg_1)
            {
                case 1:
                    monthCard.filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
                    break;
                case 2:
                    tMonthCard.filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
                    break;
                case 3:
                    hYearCard.filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
                    break;
            };
            showInfoByLevel(_arg_1);
        }

        public function set selfHead(_arg_1:Image):void
        {
            var _local_2:Object = this._1191676748selfHead;
            if (_local_2 !== _arg_1)
            {
                this._1191676748selfHead = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selfHead", _local_2, _arg_1));
            };
        }

        private function changeFontSize(_arg_1:Number):void
        {
            this[("gold" + _arg_1)].currencyInput.setStyle("fontSize", 11);
        }

        public function set vipDesc(_arg_1:Label):void
        {
            var _local_2:Object = this._462873678vipDesc;
            if (_local_2 !== _arg_1)
            {
                this._462873678vipDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vipDesc", _local_2, _arg_1));
            };
        }

        private function showPmInfo():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_PM_INFO);
            if (_local_1)
            {
                _local_1.visible = true;
            };
        }

        public function set tMonthImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1943535025tMonthImage;
            if (_local_2 !== _arg_1)
            {
                this._1943535025tMonthImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tMonthImage", _local_2, _arg_1));
            };
        }

        public function __gold1_creationComplete(_arg_1:FlexEvent):void
        {
            changeFontSize(1);
        }

        public function set itemText(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1177514720itemText;
            if (_local_2 !== _arg_1)
            {
                this._1177514720itemText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get gold1():Currency
        {
            return (this._98536401gold1);
        }

        [Bindable(event="propertyChange")]
        public function get gold3():Currency
        {
            return (this._98536403gold3);
        }

        private function _PmPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PM_PANEL[0];
            _local_1 = _nExp;
            _local_1 = ((_nExp > 0) ? true : false);
            _local_1 = _nExp;
            _local_1 = ResManager.PM_ZUAN1;
            _local_1 = _levelUpExp[0];
            _local_1 = ResManager.PM_ZUAN2;
            _local_1 = _levelUpExp[1];
            _local_1 = ResManager.PM_ZUAN3;
            _local_1 = _levelUpExp[2];
            _local_1 = ResManager.PM_ZUAN4;
            _local_1 = _levelUpExp[3];
            _local_1 = ResManager.PM_ZUAN5;
            _local_1 = _levelUpExp[4];
            _local_1 = ResManager.PM_ZUAN6;
            _local_1 = _levelUpExp[5];
            _local_1 = ResManager.PM_ZUAN7;
            _local_1 = _levelUpExp[6];
            _local_1 = ResManager.PM_ZUAN8;
            _local_1 = _levelUpExp[7];
            _local_1 = ResManager.PM_ZUAN9;
            _local_1 = _levelUpExp[8];
            _local_1 = pm3Pic;
            _local_1 = Language.PM_PANEL[3];
            _local_1 = GamePredef.CODE_ITEM_COLOR[2];
            _local_1 = Language.PM_PANEL[1];
            _local_1 = Language.PM_PANEL[2];
            _local_1 = pm2Pic;
            _local_1 = Language.PM_PANEL[4];
            _local_1 = GamePredef.CODE_ITEM_COLOR[1];
            _local_1 = Language.PM_PANEL[1];
            _local_1 = pm1Pic;
            _local_1 = Language.PM_PANEL[5];
            _local_1 = GamePredef.CODE_ITEM_COLOR[0];
            _local_1 = Language.PM_PANEL[1];
        }

        [Bindable(event="propertyChange")]
        public function get gold2():Currency
        {
            return (this._98536402gold2);
        }

        public function addOrMinusPmExp(_arg_1:Object):void
        {
            var _local_2:Number;
            if (_arg_1)
            {
                if (((!(_core.player)) || (!(panelDataFlush))))
                {
                    return;
                };
                if (!_core.player.pmLevel)
                {
                    _core.player.pmLevel = 0;
                };
                if (!_arg_1.pmLevel)
                {
                    _core.player.pmLevel = 0;
                }
                else
                {
                    if (!ToolKit.isEqual(_core.player.pmLevel, _arg_1.pmLevel))
                    {
                        _core.player.pmLevel = _arg_1.pmLevel;
                        showInfoByLevel(_core.player.pmLevel);
                    };
                };
                _local_2 = (Number(_core.player.pmLevel) + 10);
                _nExp = _arg_1.nExp;
                this.pmExpProcess.toolTip = _nExp.toString();
                setExpProcess(_nExp, _core.player.pmLevel);
            };
        }

        private function set _lastTime(_arg_1:String):void
        {
            var _local_2:Object = this._1368895518_lastTime;
            if (_local_2 !== _arg_1)
            {
                this._1368895518_lastTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_lastTime", _local_2, _arg_1));
            };
        }

        public function set pmExpProcess(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._566144145pmExpProcess;
            if (_local_2 !== _arg_1)
            {
                this._566144145pmExpProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmExpProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _lastTime():String
        {
            return (this._1368895518_lastTime);
        }

        public function __gold2_creationComplete(_arg_1:FlexEvent):void
        {
            changeFontSize(2);
        }

        [Bindable(event="propertyChange")]
        public function get itemText():RoundedLabel
        {
            return (this._1177514720itemText);
        }

        public function ___PmPanel_Button1_click(_arg_1:MouseEvent):void
        {
            buyPm(3);
        }

        public function set hYearCard(_arg_1:Canvas):void
        {
            var _local_2:Object = this._472412811hYearCard;
            if (_local_2 !== _arg_1)
            {
                this._472412811hYearCard = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hYearCard", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

