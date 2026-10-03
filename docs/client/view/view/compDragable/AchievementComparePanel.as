// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AchievementComparePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.Property;
    import com.qeedoo.ui.view.comp.AchievementDetail;
    import mx.containers.Canvas;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.ButtonTree;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.collections.ArrayCollection;
    import mx.states.RemoveChild;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.controls.VRule;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.states.State;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import com.qeedoo.game.data.GameData;
    import mx.binding.BindingManager;
    import mx.events.FlexEvent;
    import mx.states.SetProperty;
    import com.qeedoo.ui.view.comp.TipAchieve;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ListEvent;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import flash.display.DisplayObject;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.utils.LinkEncode;
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

    public class AchievementComparePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _ACHIEVE_COUNT_PER_PAGE:int = 5;
        private static var _MAX_ACH_CHECK_VERSION:int = 999999;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _968653915progress2:Property;
        private var _2093876418simple4:AchievementDetail;
        private var _totalAchPoint:Number = 0;
        private var _165649647canvasOverView:Canvas;
        private var _1557721601detail2:AchievementDetail;
        private var _1607534951rescentDetail2:AchievementDetail;
        private var _2093876416simple2:AchievementDetail;
        private var _1291982793canvasDetail:Canvas;
        private var _1607534952rescentDetail1:AchievementDetail;
        private var _1362202622rescentAchieveVBox:VBox;
        private var _2093876414simple0:AchievementDetail;
        private var _770866455progressTotal:Property;
        private var _1746887055achieveTree:ButtonTree;
        private var _1607534953rescentDetail0:AchievementDetail;
        private var _968653912progress5:Property;
        public var _AchievementComparePanel_BasicTxtButton2:BasicTxtButton;
        public var _AchievementComparePanel_BasicTxtButton3:BasicTxtButton;
        public var _AchievementComparePanel_BasicTxtButton4:BasicTxtButton;
        public var _AchievementComparePanel_BasicTxtButton5:BasicTxtButton;
        public var _AchievementComparePanel_BasicTxtButton6:BasicTxtButton;
        public var _AchievementComparePanel_BasicTxtButton7:BasicTxtButton;
        public var _AchievementComparePanel_BasicTxtButton8:BasicTxtButton;
        public var _AchievementComparePanel_BasicTxtButton9:BasicTxtButton;
        private var _recentAchieveList:ArrayCollection = null;
        private var _achieveList:ArrayCollection = null;
        private var _968653914progress3:Property;
        private var _initalized:Boolean = false;
        private var _selectedDetail:String = null;
        private var _1557721599detail0:AchievementDetail;
        private var _finishAchieveTotalNum:int = 0;
        private var _1557721602detail3:AchievementDetail;
        public var _AchievementComparePanel_RemoveChild1:RemoveChild;
        public var _AchievementComparePanel_RemoveChild2:RemoveChild;
        private var _2145302773achievePageCtrl:PageSelector;
        private var _1774143534achieveVBoxSelf:VBox;
        private var _968653916progress1:Property;
        private var _807853569vrule1:VRule;
        public var _AchievementComparePanel_BasicTxtButton10:BasicTxtButton;
        public var _AchievementComparePanel_BasicTxtButton11:BasicTxtButton;
        private var _2093876417simple3:AchievementDetail;
        private var _1557721600detail1:AchievementDetail;
        private var _charAchieveReqLog:Object;
        private var _charAchieveLog:Object;
        private var _1191852023selfName:Label;
        private var _2093876415simple1:AchievementDetail;
        private var _968653911progress6:Property;
        private var _totalAchieveNum:int = 0;
        private var _1746900838achieveVBox:VBox;
        private var _968653913progress4:Property;
        private var _1684855361achievePoint:BasicTxtButton;
        private var _1557721603detail4:AchievementDetail;
        private var _1946065477otherName:Label;
        private var _110371416title:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":515,
                    "height":410,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"title"
                    }), new UIComponentDescriptor({
                        "type":ButtonTree,
                        "id":"achieveTree",
                        "events":{"itemClick":"__achieveTree_itemClick"},
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":131,
                                "x":6,
                                "height":358,
                                "y":39
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":VRule,
                        "id":"vrule1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":138,
                                "y":36,
                                "height":362
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvasOverView",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":145,
                                "y":32,
                                "width":475,
                                "height":375,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"achievePoint",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 15;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":86,
                                            "y":6,
                                            "width":203,
                                            "height":25
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":34,
                                            "width":100,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"rescentAchieveVBox",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "16";
                                        this.right = "3";
                                        this.top = "55";
                                        this.horizontalGap = 10;
                                        this.verticalGap = 3;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":175,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"rescentDetail0",
                                                "events":{"click":"__rescentDetail0_click"}
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"rescentDetail1",
                                                "events":{"click":"__rescentDetail1_click"}
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"rescentDetail2",
                                                "events":{"click":"__rescentDetail2_click"}
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":232,
                                            "width":100,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":0xFF,
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":280,
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":184,
                                            "y":280,
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton7",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":305,
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton8",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":184,
                                            "y":305,
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton9",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":330,
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton10",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":184,
                                            "y":330,
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"progressTotal",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":55,
                                            "y":258,
                                            "height":13,
                                            "width":300,
                                            "styleName":"ProgressExp",
                                            "color":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"progress1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":55,
                                            "y":283,
                                            "height":13,
                                            "width":120,
                                            "styleName":"ProgressExp",
                                            "color":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"progress2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":234,
                                            "y":283,
                                            "height":13,
                                            "width":120,
                                            "styleName":"ProgressExp",
                                            "color":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"progress3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":55,
                                            "y":308,
                                            "height":13,
                                            "width":120,
                                            "styleName":"ProgressExp",
                                            "color":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"progress4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":234,
                                            "y":308,
                                            "height":13,
                                            "width":120,
                                            "styleName":"ProgressExp",
                                            "color":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"progress5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":55,
                                            "y":333,
                                            "height":13,
                                            "width":120,
                                            "styleName":"ProgressExp",
                                            "color":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"progress6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":234,
                                            "y":333,
                                            "height":13,
                                            "width":120,
                                            "styleName":"ProgressExp",
                                            "color":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AchievementComparePanel_BasicTxtButton11",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":16,
                                            "y":353,
                                            "width":315,
                                            "height":20
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvasDetail",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":140,
                                "y":32,
                                "width":460,
                                "height":364,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"otherName",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                        this.fontSize = 15;
                                        this.left = "10";
                                        this.top = "7";
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"achieveVBox",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "35";
                                        this.horizontalGap = 10;
                                        this.verticalGap = 4;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":365,
                                            "height":320,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"detail0"
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"detail1"
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"detail2"
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"detail3"
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"detail4"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"selfName",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                        this.fontSize = 15;
                                        this.top = "7";
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"x":360});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"achieveVBoxSelf",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "35";
                                        this.horizontalGap = 5;
                                        this.verticalGap = 4;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":360,
                                            "width":80,
                                            "height":320,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"simple0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"currentState":"simple"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"simple1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"currentState":"simple"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"simple2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"currentState":"simple"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"simple3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"currentState":"simple"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AchievementDetail,
                                                "id":"simple4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"currentState":"simple"});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"achievePageCtrl",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "onPageChanged":onPageChanged,
                                            "x":122,
                                            "y":335
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
        private var _totalAchieveKindNum:Array = [0, 0, 0, 0, 0, 0, 0];
        private var _finishAchieveKindNum:Array = [0, 0, 0, 0, 0, 0, 0];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AchievementComparePanel()
        {
            mx_internal::_document = this;
            this.width = 515;
            this.height = 410;
            this.styleName = "StandardContent";
            this.states = [_AchievementComparePanel_State1_c(), _AchievementComparePanel_State2_c()];
            this.addEventListener("creationComplete", ___AchievementComparePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AchievementComparePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get detail2():AchievementDetail
        {
            return (this._1557721601detail2);
        }

        [Bindable(event="propertyChange")]
        public function get detail4():AchievementDetail
        {
            return (this._1557721603detail4);
        }

        public function set detail3(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._1557721602detail3;
            if (_local_2 !== _arg_1)
            {
                this._1557721602detail3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "detail3", _local_2, _arg_1));
            };
        }

        private function getFinishTime(_arg_1:int, _arg_2:Object):String
        {
            var _local_3:Date;
            var _local_4:String;
            var _local_5:String;
            if (isFinishAchieve(_arg_1, _arg_2))
            {
                _local_3 = new Date(_arg_2[_arg_1]);
                _local_4 = ("0" + ToolKit.add(_local_3.getMonth(), 1));
                _local_4 = _local_4.substr(-2);
                _local_5 = ("0" + _local_3.date);
                _local_5 = _local_5.substr(-2);
                return ((((_local_3.getFullYear() + ".") + _local_4) + ".") + _local_5);
            };
            return ("");
        }

        public function set detail4(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._1557721603detail4;
            if (_local_2 !== _arg_1)
            {
                this._1557721603detail4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "detail4", _local_2, _arg_1));
            };
        }

        public function set detail2(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._1557721601detail2;
            if (_local_2 !== _arg_1)
            {
                this._1557721601detail2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "detail2", _local_2, _arg_1));
            };
        }

        public function set detail0(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._1557721599detail0;
            if (_local_2 !== _arg_1)
            {
                this._1557721599detail0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "detail0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get detail3():AchievementDetail
        {
            return (this._1557721602detail3);
        }

        public function set achievePageCtrl(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._2145302773achievePageCtrl;
            if (_local_2 !== _arg_1)
            {
                this._2145302773achievePageCtrl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achievePageCtrl", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vrule1():VRule
        {
            return (this._807853569vrule1);
        }

        [Bindable(event="propertyChange")]
        public function get detail1():AchievementDetail
        {
            return (this._1557721600detail1);
        }

        public function set canvasOverView(_arg_1:Canvas):void
        {
            var _local_2:Object = this._165649647canvasOverView;
            if (_local_2 !== _arg_1)
            {
                this._165649647canvasOverView = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvasOverView", _local_2, _arg_1));
            };
        }

        public function set vrule1(_arg_1:VRule):void
        {
            var _local_2:Object = this._807853569vrule1;
            if (_local_2 !== _arg_1)
            {
                this._807853569vrule1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vrule1", _local_2, _arg_1));
            };
        }

        public function set detail1(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._1557721600detail1;
            if (_local_2 !== _arg_1)
            {
                this._1557721600detail1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "detail1", _local_2, _arg_1));
            };
        }

        public function set progressTotal(_arg_1:Property):void
        {
            var _local_2:Object = this._770866455progressTotal;
            if (_local_2 !== _arg_1)
            {
                this._770866455progressTotal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressTotal", _local_2, _arg_1));
            };
        }

        private function _AchievementComparePanel_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "detail";
            _local_1.overrides = [_AchievementComparePanel_RemoveChild2_i(), _AchievementComparePanel_SetProperty1_c()];
            return (_local_1);
        }

        private function _AchievementComparePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ACHIEVEMENTPANEL_U[7];
            _local_1 = canvasDetail;
            _local_1 = canvasOverView;
            _local_1 = Language.ACHIEVEMENTPANEL_U[2];
            _local_1 = Language.ACHIEVEMENTPANEL_U[3];
            _local_1 = Language.ACHIEVEMENTPANEL_U[4];
            _local_1 = Language.ACHIEVEMENTPANEL_U[5];
            _local_1 = Language.GAMEPREDEF_S[423];
            _local_1 = Language.GAMEPREDEF_S[424];
            _local_1 = Language.GAMEPREDEF_S[425];
            _local_1 = Language.GAMEPREDEF_S[426];
            _local_1 = Language.GAMEPREDEF_S[427];
            _local_1 = Language.GAMEPREDEF_S[428];
            _local_1 = Language.ACHIEVEMENTPANEL_U[6];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.ACHIEVEMENTPANEL_U[8];
            _local_1 = detail0.visible;
            _local_1 = detail1.visible;
            _local_1 = detail2.visible;
            _local_1 = detail3.visible;
            _local_1 = detail4.visible;
            _local_1 = _ACHIEVE_COUNT_PER_PAGE;
        }

        public function __rescentDetail2_click(_arg_1:MouseEvent):void
        {
            onRecentAchClick(_arg_1);
        }

        private function initRecentAchieve():void
        {
            var _local_1:*;
            var _local_2:int;
            var _local_3:Boolean;
            _recentAchieveList = new ArrayCollection();
            for (_local_1 in _charAchieveLog)
            {
                if (isFinishAchieve(_local_1, _charAchieveLog))
                {
                    if (_recentAchieveList.length == 0)
                    {
                        _recentAchieveList.addItem({
                            "aid":_local_1,
                            "done":_charAchieveLog[_local_1]
                        });
                    }
                    else
                    {
                        _local_2 = 0;
                        _local_3 = false;
                        while (_local_2 < _recentAchieveList.length)
                        {
                            if (_charAchieveLog[_local_1] > _recentAchieveList[_local_2].done)
                            {
                                _recentAchieveList.addItemAt({
                                    "aid":_local_1,
                                    "done":_charAchieveLog[_local_1]
                                }, _local_2);
                                _local_3 = true;
                                if (_recentAchieveList.length > 3)
                                {
                                    _recentAchieveList.removeItemAt(3);
                                };
                                break;
                            };
                            _local_2++;
                        };
                        if (((!(_local_3)) && (_local_2 < 3)))
                        {
                            _recentAchieveList.addItemAt({
                                "aid":_local_1,
                                "done":_charAchieveLog[_local_1]
                            }, _local_2);
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get title():BasicTitleCanvas
        {
            return (this._110371416title);
        }

        private function setFinishedField(_arg_1:ArrayCollection):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Array = _arg_1.source;
            var _local_3:* = 0;
            while (_local_3 < _local_2.length)
            {
                _local_2[_local_3].finished = 0;
                if (isFinishAchieve(_local_2[_local_3].id, _charAchieveLog))
                {
                    _local_2[_local_3].finished = (_local_2[_local_3].finished + 2);
                };
                if (isFinishAchieve(_local_2[_local_3].id, _core.player.achieveLog))
                {
                    _local_2[_local_3].finished = (_local_2[_local_3].finished + 1);
                };
                _local_3++;
            };
        }

        private function initAchieveProgress():void
        {
            var _local_1:*;
            var _local_2:Object;
            _finishAchieveTotalNum = 0;
            _finishAchieveKindNum = [0, 0, 0, 0, 0, 0, 0];
            for (_local_1 in _charAchieveLog)
            {
                _local_2 = GameData.d[GamePredef.TBL_ACHIEVEMENT][_local_1];
                if (((_local_2) && (isFinishAchieve(_local_1, _charAchieveLog))))
                {
                    _finishAchieveTotalNum++;
                    _finishAchieveKindNum[_local_2.kind]++;
                };
            };
        }

        private function _AchievementComparePanel_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "overview";
            _local_1.overrides = [_AchievementComparePanel_RemoveChild1_i()];
            return (_local_1);
        }

        private function _AchievementComparePanel_RemoveChild2_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _AchievementComparePanel_RemoveChild2 = _local_1;
            BindingManager.executeBindings(this, "_AchievementComparePanel_RemoveChild2", _AchievementComparePanel_RemoveChild2);
            return (_local_1);
        }

        public function ___AchievementComparePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get rescentDetail0():AchievementDetail
        {
            return (this._1607534953rescentDetail0);
        }

        [Bindable(event="propertyChange")]
        public function get rescentDetail1():AchievementDetail
        {
            return (this._1607534952rescentDetail1);
        }

        [Bindable(event="propertyChange")]
        public function get rescentDetail2():AchievementDetail
        {
            return (this._1607534951rescentDetail2);
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

        private function _AchievementComparePanel_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _AchievementComparePanel_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_AchievementComparePanel_RemoveChild1", _AchievementComparePanel_RemoveChild1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get simple1():AchievementDetail
        {
            return (this._2093876415simple1);
        }

        [Bindable(event="propertyChange")]
        public function get simple2():AchievementDetail
        {
            return (this._2093876416simple2);
        }

        [Bindable(event="propertyChange")]
        public function get simple3():AchievementDetail
        {
            return (this._2093876417simple3);
        }

        [Bindable(event="propertyChange")]
        public function get simple4():AchievementDetail
        {
            return (this._2093876418simple4);
        }

        [Bindable(event="propertyChange")]
        public function get simple0():AchievementDetail
        {
            return (this._2093876414simple0);
        }

        public function set achieveVBox(_arg_1:VBox):void
        {
            var _local_2:Object = this._1746900838achieveVBox;
            if (_local_2 !== _arg_1)
            {
                this._1746900838achieveVBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achieveVBox", _local_2, _arg_1));
            };
        }

        private function initTree():void
        {
            var _local_4:*;
            var _local_5:ArrayCollection;
            var _local_6:int;
            var _local_7:*;
            var _local_1:Object = GamePredef.ACHI_KIND_TYPE;
            var _local_2:Object = {};
            var _local_3:ArrayCollection = new ArrayCollection();
            _local_3.addItem({"label":Language.ACHIEVEMENTPANEL_U[1]});
            for (_local_4 in _local_1)
            {
                _local_2[_local_4] = new ArrayCollection();
                for (_local_7 in _local_1[_local_4])
                {
                    _local_2[_local_4].addItem({
                        "label":GamePredef.ACHI_TYPE_NAME[_local_7],
                        "kind":_local_4,
                        "type":_local_7
                    });
                };
                _local_3.addItem({
                    "label":GamePredef.ACHI_KIND_NAME[_local_4],
                    "kind":_local_4,
                    "children":_local_2[_local_4]
                });
            };
            _local_5 = new ArrayCollection();
            _local_6 = 0;
            while (_local_6 < _local_3.length)
            {
                _local_5.addItem(_local_3.getItemAt(_local_6));
                _local_6++;
            };
            achieveTree.dataProvider = _local_5;
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                initCharAchieve();
                updateOverView();
            };
        }

        private function _AchievementComparePanel_SetProperty1_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "width";
            _local_1.value = 585;
            return (_local_1);
        }

        private function initCharAchieve(_arg_1:Object=null, _arg_2:Object=null):void
        {
            ((_arg_1) && (_charAchieveLog = _arg_1));
            ((_arg_2) && (_charAchieveReqLog = _arg_2));
        }

        public function __rescentDetail1_click(_arg_1:MouseEvent):void
        {
            onRecentAchClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get achievePageCtrl():PageSelector
        {
            return (this._2145302773achievePageCtrl);
        }

        private function init():void
        {
            var _local_1:*;
            var _local_2:Object;
            _initalized = true;
            initTree();
            initCharAchieve();
            _totalAchieveNum = 0;
            _totalAchieveKindNum = [0, 0, 0, 0, 0, 0, 0];
            for (_local_1 in GameData.d[GamePredef.TBL_ACHIEVEMENT])
            {
                _local_2 = GameData.d[GamePredef.TBL_ACHIEVEMENT][_local_1];
                if (((_local_2) && (_local_2.enable == 1)))
                {
                    _totalAchieveNum++;
                    _totalAchieveKindNum[_local_2.kind]++;
                };
            };
            initRecentAchieve();
            initAchieveProgress();
            updateOverView();
        }

        [Bindable(event="propertyChange")]
        public function get canvasOverView():Canvas
        {
            return (this._165649647canvasOverView);
        }

        [Bindable(event="propertyChange")]
        public function get progressTotal():Property
        {
            return (this._770866455progressTotal);
        }

        private function updateRecentAchieve():void
        {
            var _local_2:Object;
            var _local_1:int;
            while (_local_1 < _recentAchieveList.length)
            {
                _local_2 = GameData.d[GamePredef.TBL_ACHIEVEMENT][_recentAchieveList[_local_1].aid];
                this[("rescentDetail" + _local_1)].visible = true;
                this[("rescentDetail" + _local_1)].aid = _local_2.id;
                this[("rescentDetail" + _local_1)].txtareaAchieveTitle.htmlText = TipAchieve.ACH_NAME_STR.replace("{color}", GamePredef.MSG_ITEM_COLOR[_local_2.color]).replace("{name}", _local_2.name);
                this[("rescentDetail" + _local_1)].selected = false;
                this[("rescentDetail" + _local_1)].txtAchieveTime.label = getFinishTime(_recentAchieveList[_local_1].aid, _charAchieveLog);
                this[("rescentDetail" + _local_1)].txtareaAchieveDesc.text = _local_2.description;
                this[("rescentDetail" + _local_1)].txtAchieveAward.label = _local_2.award;
                this[("rescentDetail" + _local_1)].finished = true;
                _local_1++;
            };
            while (_local_1 < 3)
            {
                this[("rescentDetail" + _local_1++)].visible = false;
            };
        }

        public function set rescentDetail0(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._1607534953rescentDetail0;
            if (_local_2 !== _arg_1)
            {
                this._1607534953rescentDetail0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rescentDetail0", _local_2, _arg_1));
            };
        }

        public function set rescentDetail1(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._1607534952rescentDetail1;
            if (_local_2 !== _arg_1)
            {
                this._1607534952rescentDetail1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rescentDetail1", _local_2, _arg_1));
            };
        }

        public function set rescentDetail2(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._1607534951rescentDetail2;
            if (_local_2 !== _arg_1)
            {
                this._1607534951rescentDetail2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rescentDetail2", _local_2, _arg_1));
            };
        }

        public function set achieveTree(_arg_1:ButtonTree):void
        {
            var _local_2:Object = this._1746887055achieveTree;
            if (_local_2 !== _arg_1)
            {
                this._1746887055achieveTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achieveTree", _local_2, _arg_1));
            };
        }

        private function achieveTreeClick(_arg_1:Event):void
        {
            var _local_3:Boolean;
            var _local_4:AchievementDetail;
            var _local_2:Object = achieveTree.selectedItem;
            if (_local_2.label == Language.ACHIEVEMENTPANEL_U[1])
            {
                updateOverView();
                closeAllNodes();
            }
            else
            {
                currentState = "detail";
                if ((((_local_2.kind) && (_local_2.kind > 0)) && (_local_2.hasOwnProperty("children"))))
                {
                    _local_3 = achieveTree.isItemOpen(achieveTree.selectedItem);
                    closeAllNodes();
                    if (!_local_3)
                    {
                        achieveTree.expandItem(achieveTree.selectedItem, (!(achieveTree.isItemOpen(achieveTree.selectedItem))));
                    };
                    _achieveList = getAchieveList(_local_2.kind);
                }
                else
                {
                    _achieveList = getAchieveList(-1, _local_2.type);
                };
                if (_achieveList.length > 0)
                {
                    achievePageCtrl.initPageSeletor(_achieveList.length, _ACHIEVE_COUNT_PER_PAGE);
                };
            };
            if (_selectedDetail)
            {
                _local_4 = this[_selectedDetail];
                _local_4.selected = false;
            };
        }

        private function isFinishAchieve(_arg_1:int, _arg_2:Object):Boolean
        {
            if (!_arg_2)
            {
                _arg_2 = {};
            };
            return ((_arg_2[_arg_1]) && (ToolKit.isBigThan(_arg_2[_arg_1], _MAX_ACH_CHECK_VERSION)));
        }

        public function set progress4(_arg_1:Property):void
        {
            var _local_2:Object = this._968653913progress4;
            if (_local_2 !== _arg_1)
            {
                this._968653913progress4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progress4", _local_2, _arg_1));
            };
        }

        public function updateViewByData(_arg_1:Object, _arg_2:Object, _arg_3:Number, _arg_4:String):void
        {
            ((visible) || (visible = true));
            _totalAchPoint = _arg_3;
            initCharAchieve(((_arg_1) || ({})), ((_arg_2) || ({})));
            otherName.text = Language.ACHIEVEMENTPANEL_U[9].replace("{name}", _arg_4);
            if (!_initalized)
            {
                init();
            };
            initRecentAchieve();
            initAchieveProgress();
            updateOverView();
        }

        public function set progress5(_arg_1:Property):void
        {
            var _local_2:Object = this._968653912progress5;
            if (_local_2 !== _arg_1)
            {
                this._968653912progress5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progress5", _local_2, _arg_1));
            };
        }

        public function set progress2(_arg_1:Property):void
        {
            var _local_2:Object = this._968653915progress2;
            if (_local_2 !== _arg_1)
            {
                this._968653915progress2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progress2", _local_2, _arg_1));
            };
        }

        public function set progress6(_arg_1:Property):void
        {
            var _local_2:Object = this._968653911progress6;
            if (_local_2 !== _arg_1)
            {
                this._968653911progress6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progress6", _local_2, _arg_1));
            };
        }

        public function set progress3(_arg_1:Property):void
        {
            var _local_2:Object = this._968653914progress3;
            if (_local_2 !== _arg_1)
            {
                this._968653914progress3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progress3", _local_2, _arg_1));
            };
        }

        public function set progress1(_arg_1:Property):void
        {
            var _local_2:Object = this._968653916progress1;
            if (_local_2 !== _arg_1)
            {
                this._968653916progress1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progress1", _local_2, _arg_1));
            };
        }

        private function getAchieveList(_arg_1:int, _arg_2:int=0):ArrayCollection
        {
            var _local_4:Object;
            var _local_5:*;
            var _local_6:Object;
            var _local_7:*;
            var _local_3:ArrayCollection = new ArrayCollection();
            if (_arg_1 < 0)
            {
                _local_4 = _core.data.gameDataIndex2[GamePredef.TBL_ACHIEVEMENT][_arg_2];
                for (_local_5 in _local_4)
                {
                    if (_local_4[_local_5].enable == 1)
                    {
                        _local_3.addItem(_local_4[_local_5]);
                    };
                };
            }
            else
            {
                _local_6 = _core.data.gameDataIndex[GamePredef.TBL_ACHIEVEMENT][_arg_1];
                for (_local_7 in _local_6)
                {
                    if (_local_6[_local_7].enable == 1)
                    {
                        _local_3.addItem(_local_6[_local_7]);
                    };
                };
            };
            return (_local_3);
        }

        [Bindable(event="propertyChange")]
        public function get achieveVBox():VBox
        {
            return (this._1746900838achieveVBox);
        }

        private function isDoneAchieveReq(_arg_1:int):Boolean
        {
            return ((_charAchieveReqLog[_arg_1]) && ((_charAchieveReqLog[_arg_1].done > 0) || (_charAchieveReqLog[_arg_1].progress > 0)));
        }

        public function set simple0(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._2093876414simple0;
            if (_local_2 !== _arg_1)
            {
                this._2093876414simple0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simple0", _local_2, _arg_1));
            };
        }

        public function set otherName(_arg_1:Label):void
        {
            var _local_2:Object = this._1946065477otherName;
            if (_local_2 !== _arg_1)
            {
                this._1946065477otherName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "otherName", _local_2, _arg_1));
            };
        }

        public function set achievePoint(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1684855361achievePoint;
            if (_local_2 !== _arg_1)
            {
                this._1684855361achievePoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achievePoint", _local_2, _arg_1));
            };
        }

        public function set simple2(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._2093876416simple2;
            if (_local_2 !== _arg_1)
            {
                this._2093876416simple2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simple2", _local_2, _arg_1));
            };
        }

        private function updateOverView():void
        {
            if (!_initalized)
            {
                return;
            };
            currentState = "overview";
            updateRecentAchieve();
            achievePoint.label = Language.ACHIEVEMENTPANEL_U[2].replace("{point}", _totalAchPoint);
            updateAchieveProgress();
        }

        public function set simple4(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._2093876418simple4;
            if (_local_2 !== _arg_1)
            {
                this._2093876418simple4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simple4", _local_2, _arg_1));
            };
        }

        public function set simple1(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._2093876415simple1;
            if (_local_2 !== _arg_1)
            {
                this._2093876415simple1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simple1", _local_2, _arg_1));
            };
        }

        public function set simple3(_arg_1:AchievementDetail):void
        {
            var _local_2:Object = this._2093876417simple3;
            if (_local_2 !== _arg_1)
            {
                this._2093876417simple3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simple3", _local_2, _arg_1));
            };
        }

        override public function set width(_arg_1:Number):void
        {
            super.width = _arg_1;
            if (((title) && (title.text)))
            {
                title.text = title.text;
            };
        }

        override public function initialize():void
        {
            var target:AchievementComparePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AchievementComparePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AchievementComparePanelWatcherSetupUtil");
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

        public function set canvasDetail(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1291982793canvasDetail;
            if (_local_2 !== _arg_1)
            {
                this._1291982793canvasDetail = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvasDetail", _local_2, _arg_1));
            };
        }

        private function updateAchieveProgress():void
        {
            var _local_1:*;
            progressTotal.m = _totalAchieveNum;
            progressTotal.v = _finishAchieveTotalNum;
            progressTotal.label = ((_finishAchieveTotalNum + "/") + _totalAchieveNum);
            for (_local_1 in GamePredef.ACHI_KIND_NAME)
            {
                this[("progress" + _local_1)].m = _totalAchieveKindNum[_local_1];
                this[("progress" + _local_1)].v = _finishAchieveKindNum[_local_1];
                this[("progress" + _local_1)].label = ((_finishAchieveKindNum[_local_1] + "/") + _totalAchieveKindNum[_local_1]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get achieveTree():ButtonTree
        {
            return (this._1746887055achieveTree);
        }

        public function set achieveVBoxSelf(_arg_1:VBox):void
        {
            var _local_2:Object = this._1774143534achieveVBoxSelf;
            if (_local_2 !== _arg_1)
            {
                this._1774143534achieveVBoxSelf = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achieveVBoxSelf", _local_2, _arg_1));
            };
        }

        public function __achieveTree_itemClick(_arg_1:ListEvent):void
        {
            achieveTreeClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get progress3():Property
        {
            return (this._968653914progress3);
        }

        [Bindable(event="propertyChange")]
        public function get progress4():Property
        {
            return (this._968653913progress4);
        }

        [Bindable(event="propertyChange")]
        public function get progress5():Property
        {
            return (this._968653912progress5);
        }

        [Bindable(event="propertyChange")]
        public function get progress6():Property
        {
            return (this._968653911progress6);
        }

        [Bindable(event="propertyChange")]
        public function get progress1():Property
        {
            return (this._968653916progress1);
        }

        [Bindable(event="propertyChange")]
        public function get progress2():Property
        {
            return (this._968653915progress2);
        }

        private function closeAllNodes():void
        {
            var _local_1:*;
            for each (_local_1 in achieveTree.openItems)
            {
                achieveTree.expandItem(_local_1, false);
            };
        }

        [Bindable(event="propertyChange")]
        public function get achievePoint():BasicTxtButton
        {
            return (this._1684855361achievePoint);
        }

        public function __rescentDetail0_click(_arg_1:MouseEvent):void
        {
            onRecentAchClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get otherName():Label
        {
            return (this._1946065477otherName);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Object;
            var _local_4:Sort;
            var _local_5:ArrayCollection;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:*;
            var _local_10:*;
            if (currentState == "detail")
            {
                _local_3 = achieveTree.selectedItem;
                if ((((_local_3.kind) && (_local_3.kind > 0)) && (_local_3.hasOwnProperty("children"))))
                {
                    _achieveList = getAchieveList(_local_3.kind);
                }
                else
                {
                    _achieveList = getAchieveList(-1, _local_3.type);
                };
                setFinishedField(_achieveList);
                _local_4 = new Sort();
                _local_4.fields = [new SortField("finished", true, true), new SortField("award")];
                _achieveList.sort = _local_4;
                _achieveList.refresh();
            };
            if (_achieveList)
            {
                _local_5 = ToolKit.getPageCollection(_achieveList, _arg_1, _arg_2);
                _local_6 = ((_local_5.length < _ACHIEVE_COUNT_PER_PAGE) ? _local_5.length : _ACHIEVE_COUNT_PER_PAGE);
                _local_7 = 0;
                while (_local_7 < _local_6)
                {
                    _local_8 = _local_5[_local_7];
                    this[("detail" + _local_7)].aid = _local_8.id;
                    this[("detail" + _local_7)].visible = true;
                    this[("detail" + _local_7)].selected = false;
                    this[("detail" + _local_7)].txtAchieveAward.label = _local_8.award;
                    this[("detail" + _local_7)].txtAchieveTime.label = getFinishTime(_local_8.id, _charAchieveLog);
                    this[("simple" + _local_7)].aid = _local_8.id;
                    this[("simple" + _local_7)].visible = true;
                    this[("simple" + _local_7)].selected = false;
                    this[("simple" + _local_7)].txtAchieveAward.label = _local_8.award;
                    this[("simple" + _local_7)].txtAchieveTime.label = getFinishTime(_local_8.id, _core.player.achieveLog);
                    this[("detail" + _local_7)].txtareaAchieveDesc.text = _local_8.description;
                    this[("detail" + _local_7)].finished = ((_local_8.finished == 2) || (_local_8.finished == 3));
                    this[("simple" + _local_7)].finished = ((_local_8.finished == 1) || (_local_8.finished == 3));
                    _local_9 = (((this[("detail" + _local_7)].finished) && (GamePredef.MSG_ITEM_COLOR[_local_8.color])) || (0xC8C8C8));
                    _local_10 = (((this[("simple" + _local_7)].finished) && (GamePredef.MSG_ITEM_COLOR[_local_8.color])) || (0xC8C8C8));
                    this[("detail" + _local_7)].txtareaAchieveTitle.htmlText = TipAchieve.ACH_NAME_STR.replace("{color}", _local_9).replace("{name}", _local_8.name);
                    this[("simple" + _local_7)].txtareaAchieveTitle.htmlText = TipAchieve.ACH_NAME_STR.replace("{color}", _local_10).replace("{name}", _local_8.name);
                    _local_7++;
                };
                while (_local_7 < _ACHIEVE_COUNT_PER_PAGE)
                {
                    this[("detail" + _local_7++)].visible = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get canvasDetail():Canvas
        {
            return (this._1291982793canvasDetail);
        }

        [Bindable(event="propertyChange")]
        public function get achieveVBoxSelf():VBox
        {
            return (this._1774143534achieveVBoxSelf);
        }

        override public function initView():void
        {
            if (!_initalized)
            {
                return;
            };
            initCharAchieve();
            initRecentAchieve();
            initAchieveProgress();
            updateOverView();
        }

        private function _AchievementComparePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (canvasDetail);
            }, function (_arg_1:DisplayObject):void
            {
                _AchievementComparePanel_RemoveChild1.target = _arg_1;
            }, "_AchievementComparePanel_RemoveChild1.target");
            result[1] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (canvasOverView);
            }, function (_arg_1:DisplayObject):void
            {
                _AchievementComparePanel_RemoveChild2.target = _arg_1;
            }, "_AchievementComparePanel_RemoveChild2.target");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                achievePoint.label = _arg_1;
            }, "achievePoint.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton2.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton3.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton3.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton4.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton4.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[423];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton5.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton5.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[424];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton6.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton6.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[425];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton7.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton7.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[426];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton8.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton8.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[427];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton9.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton9.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[428];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton10.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton10.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AchievementComparePanel_BasicTxtButton11.label = _arg_1;
            }, "_AchievementComparePanel_BasicTxtButton11.label");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                otherName.filters = _arg_1;
            }, "otherName.filters");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                selfName.filters = _arg_1;
            }, "selfName.filters");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                selfName.text = _arg_1;
            }, "selfName.text");
            result[16] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (detail0.visible);
            }, function (_arg_1:Boolean):void
            {
                simple0.visible = _arg_1;
            }, "simple0.visible");
            result[17] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (detail1.visible);
            }, function (_arg_1:Boolean):void
            {
                simple1.visible = _arg_1;
            }, "simple1.visible");
            result[18] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (detail2.visible);
            }, function (_arg_1:Boolean):void
            {
                simple2.visible = _arg_1;
            }, "simple2.visible");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (detail3.visible);
            }, function (_arg_1:Boolean):void
            {
                simple3.visible = _arg_1;
            }, "simple3.visible");
            result[20] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (detail4.visible);
            }, function (_arg_1:Boolean):void
            {
                simple4.visible = _arg_1;
            }, "simple4.visible");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (_ACHIEVE_COUNT_PER_PAGE);
            }, function (_arg_1:int):void
            {
                achievePageCtrl.pageSize = _arg_1;
            }, "achievePageCtrl.pageSize");
            result[22] = binding;
            return (result);
        }

        private function onRecentAchClick(_arg_1:MouseEvent):void
        {
            var _local_2:AchievementDetail = AchievementDetail(_arg_1.currentTarget);
            if (_arg_1.shiftKey)
            {
                _core.view.getUI(ViewManager.MAIN_SYS).addLink(LinkEncode.encode(GamePredef.TBL_ACHIEVEMENT, _local_2.aid, _local_2.txtareaAchieveTitle.text));
            };
        }

        public function set selfName(_arg_1:Label):void
        {
            var _local_2:Object = this._1191852023selfName;
            if (_local_2 !== _arg_1)
            {
                this._1191852023selfName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selfName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get selfName():Label
        {
            return (this._1191852023selfName);
        }

        public function set rescentAchieveVBox(_arg_1:VBox):void
        {
            var _local_2:Object = this._1362202622rescentAchieveVBox;
            if (_local_2 !== _arg_1)
            {
                this._1362202622rescentAchieveVBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rescentAchieveVBox", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rescentAchieveVBox():VBox
        {
            return (this._1362202622rescentAchieveVBox);
        }

        [Bindable(event="propertyChange")]
        public function get detail0():AchievementDetail
        {
            return (this._1557721599detail0);
        }


    }
}//package com.qeedoo.ui.view.compDragable

