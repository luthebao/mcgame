// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionAreaPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Alert;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.LinkButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.FlexEvent;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.managers.PopUpManager;
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

    public class CrossContentionAreaPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3118c1:Canvas;
        private var _1665385320areaname:RoundedLabel;
        private var _85076701areapoint:RoundedLabel;
        private var _helpAlert:Alert;
        private var _3305i2:Image;
        private var _89056489arealevel:RoundedLabel;
        private var _3121c4:Canvas;
        private var _3309i6:Image;
        private var _352346643lorder5:RoundedLabel;
        private var _1617706140areaoccupy:RoundedLabel;
        private var _1666485594areaIcon:Image;
        private var _3304i1:Image;
        private var _3120c3:Canvas;
        private var _3308i5:Image;
        private var _352346639lorder1:RoundedLabel;
        private var _352346642lorder4:RoundedLabel;
        private var _1287834292panelTitle:BasicTitleCanvas;
        public var areaId:int = 0;
        private var _352346641lorder3:RoundedLabel;
        public var _CrossContentionAreaPanel_IntroText1:IntroText;
        private var _697267248lorderLag:RoundedLabel;
        public var mapId:int = 0;
        private var _352346640lorder2:RoundedLabel;
        public var _CrossContentionAreaPanel_RoundedLabel15:RoundedLabel;
        public var _CrossContentionAreaPanel_RoundedLabel16:RoundedLabel;
        private var _3307i4:Image;
        private var _3123c6:Canvas;
        private var _1446942000giveUpBtn:BasicGlowButton;
        public var isBoss:Boolean = false;
        private var _478932236attackBtn:BasicGlowButton;
        public var _CrossContentionAreaPanel_RoundedLabel1:RoundedLabel;
        public var _CrossContentionAreaPanel_RoundedLabel3:RoundedLabel;
        public var _CrossContentionAreaPanel_RoundedLabel7:RoundedLabel;
        private var _3119c2:Canvas;
        public var _CrossContentionAreaPanel_RoundedLabel5:RoundedLabel;
        public var _CrossContentionAreaPanel_LinkButton1:LinkButton;
        private var _3122c5:Canvas;
        private var _3306i3:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":475,
                    "height":405,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "7";
                            this.right = "7";
                            this.top = "40";
                            this.bottom = "25";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "12";
                                        this.top = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "height":115,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "12";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":78,
                                                        "width":78,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"areaIcon",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "0";
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_CrossContentionAreaPanel_RoundedLabel1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"areaname",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":75,
                                                                    "y":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_CrossContentionAreaPanel_RoundedLabel3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"areaoccupy",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":75,
                                                                    "y":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_CrossContentionAreaPanel_RoundedLabel5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"areapoint",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":175,
                                                                    "y":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_CrossContentionAreaPanel_RoundedLabel7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"arealevel",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":175,
                                                                    "y":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lorderLag",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":228,
                                                                    "y":-10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lorder1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"",
                                                                    "x":185,
                                                                    "y":20,
                                                                    "width":176
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lorder2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"",
                                                                    "x":185,
                                                                    "y":40,
                                                                    "width":176
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lorder3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"",
                                                                    "x":185,
                                                                    "y":60,
                                                                    "width":176
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lorder4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"",
                                                                    "x":185,
                                                                    "y":80,
                                                                    "width":176
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lorder5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"",
                                                                    "x":185,
                                                                    "y":100,
                                                                    "width":176
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "12";
                                        this.top = "130";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":430,
                                            "height":100,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionAreaPanel_RoundedLabel15",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 16;
                                                    this.color = 0xFFFF00;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "85";
                                                    this.top = "30";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"c1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":50,
                                                                    "height":50,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"i1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"c2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "55";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":50,
                                                                    "height":50,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"i2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"c3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "110";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":50,
                                                                    "height":50,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"i3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"c4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "165";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":50,
                                                                    "height":50,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"i4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"c5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "220";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":50,
                                                                    "height":50,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"i5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"c6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "275";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":50,
                                                                    "height":50,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"i6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
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
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CrossContentionAreaPanel_RoundedLabel16",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 16;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":12,
                                            "y":204
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"_CrossContentionAreaPanel_IntroText1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontStyle = "normal";
                                        this.fontWeight = "bold";
                                        this.textAlign = "left";
                                        this.fontSize = 12;
                                        this.borderThickness = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":40,
                                            "y":225,
                                            "width":410,
                                            "height":100
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"attackBtn",
                        "events":{"click":"__attackBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "3";
                            this.left = "207";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnStdRed"});
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"giveUpBtn",
                        "events":{"click":"__giveUpBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "3";
                            this.left = "207";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "width":60,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_CrossContentionAreaPanel_LinkButton1",
                        "events":{"click":"___CrossContentionAreaPanel_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.bottom = "3";
                            this.color = 0xFFE600;
                            this.textDecoration = "underline";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "width":78
                            });
                        }
                    })]
                });
            }
        });
        public var mapData:Object = new Object();
        private var _core:Core = Core.getInstance();
        private var creatureIcons:Array = [{}, {
            "0":[3060100200065],
            "1":[3060100001122, 3060100001057],
            "2":[3060100001122, 3060100001057],
            "3":[3060100001122, 3060100001057],
            "4":[3060100001122, 3060100001057],
            "5":[3060100001122, 3060100001057]
        }, {
            "0":[3060100001065],
            "1":[3060100001096, 3060100001057],
            "2":[3060100001096, 3060100001057],
            "3":[3060100001096, 3060100001057],
            "4":[3060100001096, 3060100001057],
            "5":[3060100001096, 3060100001057]
        }, {
            "0":[3060100200054],
            "1":[3060100001121, 3060100000039, 3060100001057],
            "2":[3060100001121, 3060100000039, 3060100001057],
            "3":[3060100001121, 3060100000039, 3060100001057],
            "4":[3060100001121, 3060100000039, 3060100001057],
            "5":[3060100001121, 3060100000039, 3060100001057]
        }, {
            "0":[3060100200019],
            "1":[3060100200053, 3060100200056, 3060100001057],
            "2":[3060100200053, 3060100200056, 3060100001057],
            "3":[3060100200053, 3060100200056, 3060100001057],
            "4":[3060100200053, 3060100200056, 3060100001057],
            "5":[3060100200053, 3060100200056, 3060100001057]
        }, {
            "0":[3060100200051],
            "1":[3060100001159, 3060100200055, 3060100001104, 3060100001057],
            "2":[3060100001159, 3060100200055, 3060100001104, 3060100001057],
            "3":[3060100001159, 3060100200055, 3060100001104, 3060100001057],
            "4":[3060100001159, 3060100200055, 3060100001104, 3060100001057],
            "5":[3060100001159, 3060100200055, 3060100001104, 3060100001057]
        }];
        private var pvpIcons:Array = [3050080000004, 3050070000003, 3050070000005, 3050080000006, 3050080000002, 3050070000001];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossContentionAreaPanel()
        {
            mx_internal::_document = this;
            this.width = 475;
            this.height = 405;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionAreaPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionAreaPanel._watcherSetupUtil = _arg_1;
        }


        public function set i4(_arg_1:Image):void
        {
            var _local_2:Object = this._3307i4;
            if (_local_2 !== _arg_1)
            {
                this._3307i4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get i6():Image
        {
            return (this._3309i6);
        }

        public function showPanel(_arg_1:Object, _arg_2:Number):void
        {
            var _local_12:String;
            var _local_13:int;
            var _local_14:Object;
            this.visible = true;
            attackBtn.visible = true;
            giveUpBtn.visible = false;
            mapData = _arg_1;
            var _local_3:int = int(GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[mapId]][areaId].p);
            this["areaname"].htmlText = (((("<font color='" + GamePredef.AREAR_COLOR[_local_3]) + "'>") + Language.CROSS_CONTENTION_PANEL_U[32].toString().replace("{id}", areaId).replace("{color}", Language.QUESTCANVAS_PCOLOR[((_local_3 - 1) % 5)])) + "</font>");
            if (((((mapData) && (mapData.mData)) && (mapData.mData[areaId])) && (mapData.mData[areaId].osid)))
            {
                _local_12 = CrossContentionTotalPanel.getServerName(Number(mapData.mData[areaId].osid));
                this["areaoccupy"].htmlText = (("<font color='#00FFFF'>" + Language.CROSS_CONTENTION_PANEL_U[18].toString().replace("{osid}", _local_12)) + "</font>");
            }
            else
            {
                this["areaoccupy"].htmlText = (("<font color='#00FF00'>" + Language.CROSS_CONTENTION_PANEL_U[34]) + "</font>");
            };
            this["areapoint"].htmlText = (("<font color='#FFFF00'><b>" + Language.CROSS_CONTENTION_PANEL_U[37].toString().replace("{point}", GamePredef.CROSS_CONTENTION_P_DATA[_local_3].score)) + "</b></font>");
            var _local_4:int = int(GamePredef.CROSS_CONTENTION_P_DATA[_local_3].lvl);
            var _local_5:int = int(GamePredef.CROSS_CONTENTION_P_DATA[_local_3].lvl2);
            if (CrossContentionTotalPanel.LEVLE_TYPE == 1)
            {
                this["arealevel"].htmlText = (("<font color='#FFFF00'><b>" + Language.CROSS_CONTENTION_PANEL_U[122].toString().replace("{level}", _local_4).replace("{level2}", _local_5)) + "</font>");
            }
            else
            {
                if (CrossContentionTotalPanel.LEVLE_TYPE == 2)
                {
                    this["arealevel"].htmlText = (("<font color='#FFFF00'><b>" + Language.CROSS_CONTENTION_PANEL_U[39].toString().replace("{level}", _local_4)) + "</font>");
                }
                else
                {
                    if (CrossContentionTotalPanel.LEVLE_TYPE == 3)
                    {
                        this["arealevel"].htmlText = (("<font color='#FFFF00'><b>" + Language.CROSS_CONTENTION_PANEL_U[121].toString().replace("{level}", _local_5)) + "</font>");
                    }
                    else
                    {
                        if (CrossContentionTotalPanel.LEVLE_TYPE == 4)
                        {
                            this["arealevel"].htmlText = (("<font color='#FFFF00'><b>" + Language.CROSS_CONTENTION_PANEL_U[120]) + "</font>");
                        };
                    };
                };
            };
            lorderLag.visible = false;
            var _local_6:int = 1;
            while (_local_6 < 6)
            {
                this[("lorder" + _local_6)].htmlText = "";
                _local_6++;
            };
            var _local_7:Boolean;
            var _local_8:Boolean;
            var _local_9:Array = [];
            if (((((mapData) && (mapData.mData)) && (mapData.mData[areaId])) && (mapData.mData[areaId].members)))
            {
                _local_13 = 1;
                _local_7 = true;
                _local_14 = mapData.mData[areaId].members.head;
                while (((!(_local_14 == null)) && (_local_14.obj)))
                {
                    if (int(_local_14.obj) == _core.player.id)
                    {
                        _local_8 = true;
                    };
                    this[("lorder" + _local_13)].htmlText = (("<font color='#00FFFF'>" + _local_14.cname) + "</font>");
                    _local_13++;
                    _local_9.push(_local_14.iconCode);
                    lorderLag.visible = true;
                    _local_14 = _local_14.next;
                };
            };
            if (((_local_8) && (CrossContentionTotalPanel.giveup)))
            {
                attackBtn.visible = false;
                giveUpBtn.visible = true;
            };
            if (_arg_2)
            {
                areaIcon.source = ResManager.getIconUrl(_arg_2);
            };
            var _local_10:int = GamePredef.CROSS_CONTENTION_MAP_REC_INIT[CrossContentionSinglePanel.MAP_ID];
            var _local_11:Array = [];
            if (_local_7)
            {
                _local_11 = _local_9;
            }
            else
            {
                _local_11 = creatureIcons[_local_10][_local_3];
            };
            _local_6 = 1;
            while (_local_6 <= 6)
            {
                if (((_local_11) && (_local_11[(_local_6 - 1)])))
                {
                    this[("c" + _local_6)].visible = true;
                    this[("i" + _local_6)].source = ResManager.getIconUrl(_local_11[(_local_6 - 1)]);
                }
                else
                {
                    this[("c" + _local_6)].visible = false;
                    this[("i" + _local_6)].source = null;
                };
                _local_6++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get lorder1():RoundedLabel
        {
            return (this._352346639lorder1);
        }

        [Bindable(event="propertyChange")]
        public function get lorder3():RoundedLabel
        {
            return (this._352346641lorder3);
        }

        public function set i6(_arg_1:Image):void
        {
            var _local_2:Object = this._3309i6;
            if (_local_2 !== _arg_1)
            {
                this._3309i6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lorder4():RoundedLabel
        {
            return (this._352346642lorder4);
        }

        [Bindable(event="propertyChange")]
        public function get lorder5():RoundedLabel
        {
            return (this._352346643lorder5);
        }

        private function init():void
        {
        }

        public function set lorder3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._352346641lorder3;
            if (_local_2 !== _arg_1)
            {
                this._352346641lorder3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lorder3", _local_2, _arg_1));
            };
        }

        public function set lorder1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._352346639lorder1;
            if (_local_2 !== _arg_1)
            {
                this._352346639lorder1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lorder1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lorder2():RoundedLabel
        {
            return (this._352346640lorder2);
        }

        [Bindable(event="propertyChange")]
        public function get areapoint():RoundedLabel
        {
            return (this._85076701areapoint);
        }

        public function set lorder4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._352346642lorder4;
            if (_local_2 !== _arg_1)
            {
                this._352346642lorder4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lorder4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get arealevel():RoundedLabel
        {
            return (this._89056489arealevel);
        }

        [Bindable(event="propertyChange")]
        public function get c4():Canvas
        {
            return (this._3121c4);
        }

        [Bindable(event="propertyChange")]
        public function get c5():Canvas
        {
            return (this._3122c5);
        }

        public function set areaname(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1665385320areaname;
            if (_local_2 !== _arg_1)
            {
                this._1665385320areaname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaname", _local_2, _arg_1));
            };
        }

        public function set arealevel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._89056489arealevel;
            if (_local_2 !== _arg_1)
            {
                this._89056489arealevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "arealevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get c2():Canvas
        {
            return (this._3119c2);
        }

        public function set areaoccupy(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1617706140areaoccupy;
            if (_local_2 !== _arg_1)
            {
                this._1617706140areaoccupy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaoccupy", _local_2, _arg_1));
            };
        }

        public function onGiveUp(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[137]);
                _local_2 = CrossContentionSinglePanel.mData;
                removeFromMembers();
                _local_3 = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_SINGLE);
                if (_local_3)
                {
                    _local_3.onGetCrossContentionSingleState(CrossContentionSinglePanel.mData);
                };
                showPanel(CrossContentionSinglePanel.mData, 0);
            }
            else
            {
                if (_arg_1.data)
                {
                    _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[_arg_1.data]);
                }
                else
                {
                    _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[138]);
                };
            };
        }

        public function set areapoint(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._85076701areapoint;
            if (_local_2 !== _arg_1)
            {
                this._85076701areapoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areapoint", _local_2, _arg_1));
            };
        }

        private function attack():void
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_FIGHT);
            if (_local_1)
            {
                _local_1.mapData = mapData;
                _local_1.areaId = areaId;
                _local_1.isBoss = false;
                _local_1.mapId = mapData.mid;
                _local_1.showPanel();
            };
        }

        [Bindable(event="propertyChange")]
        public function get c1():Canvas
        {
            return (this._3118c1);
        }

        [Bindable(event="propertyChange")]
        public function get c3():Canvas
        {
            return (this._3120c3);
        }

        public function set areaIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1666485594areaIcon;
            if (_local_2 !== _arg_1)
            {
                this._1666485594areaIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaIcon", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get c6():Canvas
        {
            return (this._3123c6);
        }

        public function set lorder2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._352346640lorder2;
            if (_local_2 !== _arg_1)
            {
                this._352346640lorder2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lorder2", _local_2, _arg_1));
            };
        }

        public function set c1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3118c1;
            if (_local_2 !== _arg_1)
            {
                this._3118c1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get giveUpBtn():BasicGlowButton
        {
            return (this._1446942000giveUpBtn);
        }

        public function set c2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3119c2;
            if (_local_2 !== _arg_1)
            {
                this._3119c2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c2", _local_2, _arg_1));
            };
        }

        public function set lorder5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._352346643lorder5;
            if (_local_2 !== _arg_1)
            {
                this._352346643lorder5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lorder5", _local_2, _arg_1));
            };
        }

        public function set c3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3120c3;
            if (_local_2 !== _arg_1)
            {
                this._3120c3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c3", _local_2, _arg_1));
            };
        }

        public function ___CrossContentionAreaPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set giveUpBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1446942000giveUpBtn;
            if (_local_2 !== _arg_1)
            {
                this._1446942000giveUpBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "giveUpBtn", _local_2, _arg_1));
            };
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

        public function set c6(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3123c6;
            if (_local_2 !== _arg_1)
            {
                this._3123c6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c6", _local_2, _arg_1));
            };
        }

        private function _CrossContentionAreaPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[117];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[31];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[32];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[33];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[34];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[36];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[37];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[38];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[39];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[41];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[42];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[43];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[44];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[45];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[136];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[46];
        }

        public function set c5(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3122c5;
            if (_local_2 !== _arg_1)
            {
                this._3122c5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c5", _local_2, _arg_1));
            };
        }

        private function giveUp():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("crossContentionGiveUp", null, mapId, areaId);
                };
            };
            Alert.show(Language.CROSS_CONTENTION_PANEL_U[143], "", (Alert.YES | Alert.NO), null, func);
        }

        public function set c4(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3121c4;
            if (_local_2 !== _arg_1)
            {
                this._3121c4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c4", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:CrossContentionAreaPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionAreaPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionAreaPanelWatcherSetupUtil");
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
        public function get areaoccupy():RoundedLabel
        {
            return (this._1617706140areaoccupy);
        }

        public function __attackBtn_click(_arg_1:MouseEvent):void
        {
            attack();
        }

        public function set lorderLag(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._697267248lorderLag;
            if (_local_2 !== _arg_1)
            {
                this._697267248lorderLag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lorderLag", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get areaIcon():Image
        {
            return (this._1666485594areaIcon);
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        private function _CrossContentionAreaPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[117];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionAreaPanel_RoundedLabel1.htmlText = _arg_1;
            }, "_CrossContentionAreaPanel_RoundedLabel1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                areaname.htmlText = _arg_1;
            }, "areaname.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionAreaPanel_RoundedLabel3.htmlText = _arg_1;
            }, "_CrossContentionAreaPanel_RoundedLabel3.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                areaoccupy.htmlText = _arg_1;
            }, "areaoccupy.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionAreaPanel_RoundedLabel5.htmlText = _arg_1;
            }, "_CrossContentionAreaPanel_RoundedLabel5.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                areapoint.htmlText = _arg_1;
            }, "areapoint.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionAreaPanel_RoundedLabel7.htmlText = _arg_1;
            }, "_CrossContentionAreaPanel_RoundedLabel7.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                arealevel.htmlText = _arg_1;
            }, "arealevel.htmlText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lorderLag.htmlText = _arg_1;
            }, "lorderLag.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionAreaPanel_RoundedLabel15.htmlText = _arg_1;
            }, "_CrossContentionAreaPanel_RoundedLabel15.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionAreaPanel_RoundedLabel16.htmlText = _arg_1;
            }, "_CrossContentionAreaPanel_RoundedLabel16.htmlText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionAreaPanel_IntroText1.text = _arg_1;
            }, "_CrossContentionAreaPanel_IntroText1.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                attackBtn.label = _arg_1;
            }, "attackBtn.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[136];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                giveUpBtn.label = _arg_1;
            }, "giveUpBtn.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionAreaPanel_LinkButton1.label = _arg_1;
            }, "_CrossContentionAreaPanel_LinkButton1.label");
            result[15] = binding;
            return (result);
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CROSS_CONTENTION_PANEL_U[29].toString();
            _helpAlert = Alert.show(_local_1, Language.CROSS_CONTENTION_PANEL_U[132].toString(), Alert.YES, null, null);
        }

        [Bindable(event="propertyChange")]
        public function get areaname():RoundedLabel
        {
            return (this._1665385320areaname);
        }

        private function _crossContentionGetGroupNum(_arg_1:Object):int
        {
            if (((!(_arg_1)) || (!(_arg_1.head))))
            {
                return (0);
            };
            var _local_2:int;
            var _local_3:* = _arg_1.head;
            while (((_local_3) && (_local_3.obj)))
            {
                _local_2++;
                _local_3 = _local_3.next;
            };
            return (_local_2);
        }

        public function set i1(_arg_1:Image):void
        {
            var _local_2:Object = this._3304i1;
            if (_local_2 !== _arg_1)
            {
                this._3304i1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i1", _local_2, _arg_1));
            };
        }

        public function ___CrossContentionAreaPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        [Bindable(event="propertyChange")]
        public function get lorderLag():RoundedLabel
        {
            return (this._697267248lorderLag);
        }

        public function set i5(_arg_1:Image):void
        {
            var _local_2:Object = this._3308i5;
            if (_local_2 !== _arg_1)
            {
                this._3308i5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i5", _local_2, _arg_1));
            };
        }

        public function __giveUpBtn_click(_arg_1:MouseEvent):void
        {
            giveUp();
        }

        public function set i3(_arg_1:Image):void
        {
            var _local_2:Object = this._3306i3;
            if (_local_2 !== _arg_1)
            {
                this._3306i3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i3", _local_2, _arg_1));
            };
        }

        public function set attackBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._478932236attackBtn;
            if (_local_2 !== _arg_1)
            {
                this._478932236attackBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attackBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get i2():Image
        {
            return (this._3305i2);
        }

        public function set i2(_arg_1:Image):void
        {
            var _local_2:Object = this._3305i2;
            if (_local_2 !== _arg_1)
            {
                this._3305i2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i2", _local_2, _arg_1));
            };
        }

        private function removeFromMembers():void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (((((!(CrossContentionSinglePanel.mData)) || (!(CrossContentionSinglePanel.mData.mData))) || (!(CrossContentionSinglePanel.mData.mData[areaId]))) || (!(CrossContentionSinglePanel.mData.mData[areaId].members))))
            {
                return;
            };
            var _local_1:int = _crossContentionGetGroupNum(CrossContentionSinglePanel.mData.mData[areaId].members);
            if (_local_1 == 1)
            {
                CrossContentionSinglePanel.mData.mData[areaId].osid = 0;
                CrossContentionSinglePanel.mData.mData[areaId].members = null;
                CrossContentionSinglePanel.mData.mData[areaId].state1 = 0;
            }
            else
            {
                _local_2 = CrossContentionSinglePanel.mData.mData[areaId].members.head;
                if (_core.player.id == int(_local_2.obj))
                {
                    CrossContentionSinglePanel.mData.mData[areaId].members.head = _local_2.next;
                }
                else
                {
                    _local_3 = _local_2;
                    _local_2 = _local_2.next;
                    while (((_local_2) && (_local_2.obj)))
                    {
                        if (_core.player.id == int(_local_2.obj))
                        {
                            if (((_local_2.next) && (_local_2.next.obj)))
                            {
                                _local_3.next = _local_2.next;
                            }
                            else
                            {
                                _local_3.next = null;
                            };
                            return;
                        };
                        _local_2 = _local_2.next;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get i3():Image
        {
            return (this._3306i3);
        }

        [Bindable(event="propertyChange")]
        public function get i4():Image
        {
            return (this._3307i4);
        }

        [Bindable(event="propertyChange")]
        public function get i5():Image
        {
            return (this._3308i5);
        }

        [Bindable(event="propertyChange")]
        public function get i1():Image
        {
            return (this._3304i1);
        }

        [Bindable(event="propertyChange")]
        public function get attackBtn():BasicGlowButton
        {
            return (this._478932236attackBtn);
        }


    }
}//package com.qeedoo.ui.view.compDragable

