// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TripleTownPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.FilterButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.FilterTextArea;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.compGameStage.NPCView;
    import flash.events.Event;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.LanguageUtil;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.utils.ObjectUtil;
    import com.qeedoo.game.object.Npc;
    import mx.core.ClassFactory;
    import mx.binding.Binding;
    import flash.display.BitmapData;
    import flash.display.LoaderInfo;
    import flash.display.MovieClip;
    import flash.utils.getDefinitionByName;
    import flash.net.Responder;
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

    public class TripleTownPanel extends DragableCanvas implements IBindingClient 
    {

        public static var bombDict:*;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const ALPHA_ADD:Number = 0.03;
        private const RANK_LIMIT:int = 10;
        private const EFFECT_CODE:Number = 2080130101005;
        private var _1584105757viewStack:ViewStack;
        private var triplePlaza:Object;
        private var _rankArray:Array;
        public var _TripleTownPanel_FilterButton1:FilterButton;
        public var _TripleTownPanel_FilterButton2:FilterButton;
        private var tripleConfig:Object;
        public var _TripleTownPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _killCombo:int;
        private var _1497492550myScore:Label;
        private var _803559802pageTab:HButtonTab;
        private var _tripleKilling:Boolean;
        private var _978073671rankBar:List;
        public var _TripleTownPanel_FilterTextArea1:FilterTextArea;
        private var _broadInfo:Object;
        private var _loadState:int;
        private var _tripleArray:Array;
        public var _TripleTownPanel_Label1:Label;
        public var _TripleTownPanel_Label3:Label;
        public var _TripleTownPanel_Label4:Label;
        public var _TripleTownPanel_Label5:Label;
        public var _TripleTownPanel_Label6:Label;
        public var _TripleTownPanel_Label2:Label;
        private var _1488574086myIndex:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_TripleTownPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTab",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":23,
                                "y":47,
                                "selectedIndex":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"viewStack",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":67,
                                "width":480,
                                "height":340,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "width":480,
                                            "height":325,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "clipContent":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TripleTownPanel_Label1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 14;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":8});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":FilterTextArea,
                                                "id":"_TripleTownPanel_FilterTextArea1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.borderStyle = "none";
                                                    this.backgroundAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":38,
                                                        "width":445,
                                                        "height":260,
                                                        "selectable":false,
                                                        "editable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":FilterButton,
                                                "id":"_TripleTownPanel_FilterButton1",
                                                "events":{"click":"___TripleTownPanel_FilterButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":331,
                                                        "width":60,
                                                        "height":22,
                                                        "styleName":"BtnStdGreen"
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
                                            "width":480,
                                            "height":340,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "clipContent":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TripleTownPanel_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 14;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":8});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":30,
                                                        "y":29,
                                                        "clipContent":false,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_TripleTownPanel_Label3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalCenter = "0";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"width":70});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_TripleTownPanel_Label4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalCenter = "0";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":70,
                                                                    "width":164
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_TripleTownPanel_Label5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalCenter = "0";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":234,
                                                                    "width":96
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_TripleTownPanel_Label6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalCenter = "0";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":330,
                                                                    "width":70
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":List,
                                                "id":"rankBar",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":30,
                                                        "y":47,
                                                        "width":430,
                                                        "height":260,
                                                        "selectable":false,
                                                        "itemRenderer":_TripleTownPanel_ClassFactory1_c()
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"myIndex",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":33,
                                                        "y":311
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"myScore",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":160,
                                                        "y":311
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":FilterButton,
                                                "id":"_TripleTownPanel_FilterButton2",
                                                "events":{"click":"___TripleTownPanel_FilterButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":343,
                                                        "y":311,
                                                        "width":60,
                                                        "height":22,
                                                        "styleName":"BtnStdGreen"
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
        private const CHANGABLE_DICT:Object = {
            "0":{
                "x":0,
                "y":-1
            },
            "1":{
                "x":0,
                "y":1
            },
            "2":{
                "x":-1,
                "y":0
            },
            "3":{
                "x":1,
                "y":0
            }
        };
        private var COMBO_CODE_ARRAY:Array = [0, 2060090400043, 2060090400044, 2060090400045, 2060090400046, 2060090400047, 2060090400048, 2060090400049, 2060090400050, 2060090400051, 2060090400052, 2060090400053, 2060090400054, 2060090400055, 2060090400056, 2060090400057, 2060090400058, 2060090400059, 2060090400060, 2060090400061, 2060090400062, 2060090400063, 2060090400064, 2060090400065, 2060090400066, 2060090400067, 2060090400068, 2060090400069, 2060090400070, 2060090400071, 2060090400072];
        private const STATE_DICT:Object = [0, GamePredef.ST_TRIPLE_TOWN_BOMB, GamePredef.ST_TRIPLE_TOWN_DOUBLE, GamePredef.ST_TRIPLE_TOWN_TOP, GamePredef.ST_TRIPLE_TOWN_LEFT, GamePredef.ST_TRIPLE_TOWN_BOTTOM, GamePredef.ST_TRIPLE_TOWN_RIGHT];
        private const INST_DICT:Object = {
            "0":[{
                "x":810,
                "y":790
            }, {
                "x":888,
                "y":746
            }, {
                "x":967,
                "y":703
            }, {
                "x":1046,
                "y":660
            }, {
                "x":1125,
                "y":617
            }, {
                "x":1204,
                "y":574
            }],
            "1":[{
                "x":888,
                "y":833
            }, {
                "x":967,
                "y":790
            }, {
                "x":1046,
                "y":746
            }, {
                "x":1125,
                "y":703
            }, {
                "x":1204,
                "y":660
            }, {
                "x":1283,
                "y":617
            }],
            "2":[{
                "x":967,
                "y":876
            }, {
                "x":1046,
                "y":833
            }, {
                "x":1125,
                "y":790
            }, {
                "x":1204,
                "y":746
            }, {
                "x":1283,
                "y":703
            }, {
                "x":1362,
                "y":660
            }],
            "3":[{
                "x":1046,
                "y":919
            }, {
                "x":1125,
                "y":876
            }, {
                "x":1204,
                "y":833
            }, {
                "x":1283,
                "y":790
            }, {
                "x":1362,
                "y":746
            }, {
                "x":1441,
                "y":703
            }],
            "4":[{
                "x":1125,
                "y":962
            }, {
                "x":1204,
                "y":919
            }, {
                "x":1283,
                "y":876
            }, {
                "x":1362,
                "y":833
            }, {
                "x":1441,
                "y":790
            }, {
                "x":1520,
                "y":746
            }],
            "5":[{
                "x":1204,
                "y":1005
            }, {
                "x":1283,
                "y":962
            }, {
                "x":1362,
                "y":919
            }, {
                "x":1441,
                "y":876
            }, {
                "x":1520,
                "y":833
            }, {
                "x":1599,
                "y":790
            }]
        };
        private const TOP_DICT:Object = {
            "0":[{
                "x":652,
                "y":703
            }, {
                "x":731,
                "y":660
            }, {
                "x":810,
                "y":617
            }, {
                "x":888,
                "y":574
            }, {
                "x":967,
                "y":531
            }, {
                "x":1046,
                "y":487
            }],
            "1":[{
                "x":573,
                "y":660
            }, {
                "x":652,
                "y":617
            }, {
                "x":731,
                "y":574
            }, {
                "x":810,
                "y":531
            }, {
                "x":888,
                "y":487
            }, {
                "x":967,
                "y":444
            }],
            "2":[{
                "x":494,
                "y":617
            }, {
                "x":573,
                "y":574
            }, {
                "x":652,
                "y":531
            }, {
                "x":731,
                "y":487
            }, {
                "x":810,
                "y":444
            }, {
                "x":888,
                "y":401
            }]
        };
        private const BOTTOM_DICT:Object = {
            "0":[{
                "x":1362,
                "y":1092
            }, {
                "x":1441,
                "y":1048
            }, {
                "x":1520,
                "y":1005
            }, {
                "x":1599,
                "y":962
            }, {
                "x":1678,
                "y":919
            }, {
                "x":1757,
                "y":876
            }],
            "1":[{
                "x":1441,
                "y":1135
            }, {
                "x":1520,
                "y":1092
            }, {
                "x":1599,
                "y":1048
            }, {
                "x":1678,
                "y":1005
            }, {
                "x":1757,
                "y":962
            }, {
                "x":1836,
                "y":919
            }],
            "2":[{
                "x":1599,
                "y":1221
            }, {
                "x":1678,
                "y":1178
            }, {
                "x":1757,
                "y":1135
            }, {
                "x":1836,
                "y":1092
            }, {
                "x":1915,
                "y":1048
            }, {
                "x":1994,
                "y":1005
            }]
        };
        private const LEFT_DICT:Object = {
            "0":[{
                "x":647,
                "y":878
            }, {
                "x":568,
                "y":921
            }, {
                "x":489,
                "y":964
            }],
            "1":[{
                "x":726,
                "y":921
            }, {
                "x":647,
                "y":964
            }, {
                "x":568,
                "y":1008
            }],
            "2":[{
                "x":805,
                "y":964
            }, {
                "x":726,
                "y":1008
            }, {
                "x":647,
                "y":1051
            }],
            "3":[{
                "x":884,
                "y":1008
            }, {
                "x":805,
                "y":1051
            }, {
                "x":726,
                "y":1094
            }],
            "4":[{
                "x":963,
                "y":1051
            }, {
                "x":884,
                "y":1094
            }, {
                "x":805,
                "y":1137
            }],
            "5":[{
                "x":1042,
                "y":1094
            }, {
                "x":963,
                "y":1137
            }, {
                "x":884,
                "y":1180
            }]
        };
        private const RIGHT_DICT:Object = {
            "0":[{
                "x":1367,
                "y":485
            }, {
                "x":1446,
                "y":442
            }, {
                "x":1604,
                "y":356
            }],
            "1":[{
                "x":1446,
                "y":528
            }, {
                "x":1525,
                "y":485
            }, {
                "x":1683,
                "y":399
            }],
            "2":[{
                "x":1525,
                "y":571
            }, {
                "x":1604,
                "y":528
            }, {
                "x":1762,
                "y":442
            }],
            "3":[{
                "x":1604,
                "y":615
            }, {
                "x":1683,
                "y":571
            }, {
                "x":1841,
                "y":485
            }],
            "4":[{
                "x":1683,
                "y":658
            }, {
                "x":1762,
                "y":615
            }, {
                "x":1920,
                "y":528
            }],
            "5":[{
                "x":1762,
                "y":701
            }, {
                "x":1841,
                "y":658
            }, {
                "x":1999,
                "y":571
            }]
        };
        private var _moveNpcDict:Object = {};
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TripleTownPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 430;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TripleTownPanel._watcherSetupUtil = _arg_1;
        }


        public function tripleTwonTurnInfo(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:Object;
            if ((((!(triplePlaza)) || (!(triplePlaza.instDict))) || (!(_arg_1))))
            {
                return;
            };
            if (((_arg_1.hasOwnProperty("npcDir")) && (!(_arg_1.npcDir == triplePlaza.npcDir))))
            {
                triplePlaza.npcDir = _arg_1.npcDir;
                tripleChangeDir();
            };
            for (_local_2 in _arg_1)
            {
                if (triplePlaza.hasOwnProperty(_local_2))
                {
                    triplePlaza[_local_2] = _arg_1[_local_2];
                };
            };
            _local_3 = _core.view.getUI(ViewManager.PANEL_TRIPLE_TURN);
            ((_local_3) && (_local_3.updateView(triplePlaza)));
        }

        public function set myIndex(_arg_1:Label):void
        {
            var _local_2:Object = this._1488574086myIndex;
            if (_local_2 !== _arg_1)
            {
                this._1488574086myIndex = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myIndex", _local_2, _arg_1));
            };
        }

        public function set pageTab(_arg_1:HButtonTab):void
        {
            var _local_2:Object = this._803559802pageTab;
            if (_local_2 !== _arg_1)
            {
                this._803559802pageTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTab", _local_2, _arg_1));
            };
        }

        private function makeAndMoveNpc(_arg_1:Object, _arg_2:int, _arg_3:int):void
        {
            var _local_4:Object;
            var _local_5:Object;
            if (((((_arg_2 >= 0) && (_arg_3 >= 0)) && (_arg_2 < tripleConfig.npcLen)) && (_arg_3 < tripleConfig.npcLen)))
            {
                _arg_1.xpos = _arg_2;
                _arg_1.ypos = _arg_3;
                _arg_1.isStandBy = false;
                triplePlaza.instDict[_arg_1.instId] = _arg_1;
                _local_4 = INST_DICT[_arg_2][_arg_3];
            };
            if (triplePlaza.npcDir == 1)
            {
                _local_5 = TOP_DICT[tripleConfig.standLen][_arg_3];
            }
            else
            {
                if (triplePlaza.npcDir == 5)
                {
                    _local_5 = BOTTOM_DICT[tripleConfig.standLen][_arg_3];
                }
                else
                {
                    if (triplePlaza.npcDir == 3)
                    {
                        _local_5 = LEFT_DICT[_arg_2][tripleConfig.standLen];
                    }
                    else
                    {
                        if (triplePlaza.npcDir == 7)
                        {
                            _local_5 = RIGHT_DICT[_arg_2][tripleConfig.standLen];
                        };
                    };
                };
            };
            createTripleTownNpc(_arg_1, _local_5.x, _local_5.y, triplePlaza.npcDir);
            var _local_6:NPCView = (_core.view.getN(_arg_1.instId) as NPCView);
            if (!_local_6)
            {
                return;
            };
            _local_6.alpha = 0;
            _local_6.addEventListener(Event.ENTER_FRAME, gradiantHandler);
            if (_arg_2 < 0)
            {
                _arg_2 = Math.abs((_arg_2 + 1));
                _local_4 = TOP_DICT[_arg_2][_arg_3];
            }
            else
            {
                if (_arg_2 >= tripleConfig.npcLen)
                {
                    _arg_2 = (_arg_2 - int(tripleConfig.npcLen));
                    _local_4 = BOTTOM_DICT[_arg_2][_arg_3];
                }
                else
                {
                    if (_arg_3 < 0)
                    {
                        _arg_3 = Math.abs((_arg_3 + 1));
                        _local_4 = LEFT_DICT[_arg_2][_arg_3];
                    }
                    else
                    {
                        if (_arg_3 >= tripleConfig.npcLen)
                        {
                            _arg_3 = (_arg_3 - int(tripleConfig.npcLen));
                            _local_4 = RIGHT_DICT[_arg_2][_arg_3];
                        };
                    };
                };
            };
            NpcViewWlakTo(_local_6, _local_4.x, _local_4.y);
        }

        private function loadEffect():void
        {
            if (_loadState != 0)
            {
                return;
            };
            _loadState = 1;
            var _local_1:Loader = new Loader();
            _local_1.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadEffect);
            _local_1.load(new URLRequest(ResManager.getResUrl(EFFECT_CODE)));
        }

        private function updateTripleNpcPos(_arg_1:Object, _arg_2:Object):void
        {
            var _local_3:Boolean;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:Object;
            var _local_14:Object;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            var _local_18:int;
            var _local_19:int;
            if (_arg_2.oldDir != triplePlaza.npcDir)
            {
                triplePlaza.npcDir = _arg_2.oldDir;
                tripleChangeDir();
            };
            if (triplePlaza.npcDir == 1)
            {
                _local_4 = 0;
                while (_local_4 < tripleConfig.standLen)
                {
                    _local_6 = -(_local_4 + 1);
                    _arg_1[_local_6] = {};
                    _local_7 = 0;
                    while (_local_7 < tripleConfig.npcLen)
                    {
                        _arg_1[_local_6][_local_7] = triplePlaza.topDict[_local_4][_local_7];
                        _local_7++;
                    };
                    _local_4++;
                };
                _local_5 = 0;
                while (_local_5 < tripleConfig.npcLen)
                {
                    _local_8 = 0;
                    _local_9 = (tripleConfig.npcLen - 1);
                    while (_local_9 >= -(tripleConfig.standLen))
                    {
                        if (((!(_arg_1[_local_9])) || (!(_arg_1[_local_9][_local_5]))))
                        {
                            _local_3 = true;
                            _local_8++;
                        }
                        else
                        {
                            if (_local_8 > 0)
                            {
                                _local_12 = (_local_9 + _local_8);
                                _local_13 = _arg_1[_local_9][_local_5];
                                moveNpcViewTo(_local_13, _local_12, _local_5);
                                _arg_1[_local_12][_local_5] = _local_13;
                                _arg_1[_local_9][_local_5] = null;
                            };
                        };
                        _local_9--;
                    };
                    _local_10 = ((_local_8 - tripleConfig.standLen) - 1);
                    _local_11 = _local_10;
                    while (_local_11 >= -(tripleConfig.standLen))
                    {
                        if (_local_11 >= 0)
                        {
                            _local_14 = npcByPosition(_arg_2.instDict, _local_11, _local_5);
                        }
                        else
                        {
                            _local_15 = Math.abs(-(_local_11 + 1));
                            _local_14 = _arg_2.topDict[_local_15][_local_5];
                        };
                        makeAndMoveNpc(_local_14, _local_11, _local_5);
                        _arg_1[_local_11][_local_5] = _local_14;
                        _local_11--;
                    };
                    _local_5++;
                };
                triplePlaza.topDict = _arg_2.topDict;
            }
            else
            {
                if (triplePlaza.npcDir == 5)
                {
                    _local_4 = 0;
                    while (_local_4 < tripleConfig.standLen)
                    {
                        _local_17 = (tripleConfig.npcLen + _local_4);
                        _arg_1[_local_17] = {};
                        _local_7 = 0;
                        while (_local_7 < tripleConfig.npcLen)
                        {
                            _arg_1[_local_17][_local_7] = triplePlaza.bottomDict[_local_4][_local_7];
                            _local_7++;
                        };
                        _local_4++;
                    };
                    _local_16 = (tripleConfig.npcLen + tripleConfig.standLen);
                    _local_5 = 0;
                    while (_local_5 < tripleConfig.npcLen)
                    {
                        _local_8 = 0;
                        _local_9 = 0;
                        while (_local_9 < _local_16)
                        {
                            if (((!(_arg_1[_local_9])) || (!(_arg_1[_local_9][_local_5]))))
                            {
                                _local_3 = true;
                                _local_8++;
                            }
                            else
                            {
                                if (_local_8 > 0)
                                {
                                    _local_12 = (_local_9 - _local_8);
                                    _local_13 = _arg_1[_local_9][_local_5];
                                    moveNpcViewTo(_local_13, _local_12, _local_5);
                                    _arg_1[_local_12][_local_5] = _local_13;
                                    _arg_1[_local_9][_local_5] = null;
                                };
                            };
                            _local_9++;
                        };
                        _local_10 = (_local_16 - _local_8);
                        _local_11 = _local_10;
                        while (_local_11 < _local_16)
                        {
                            if (_local_11 < tripleConfig.npcLen)
                            {
                                _local_14 = npcByPosition(_arg_2.instDict, _local_11, _local_5);
                            }
                            else
                            {
                                _local_15 = (_local_11 - tripleConfig.npcLen);
                                _local_14 = _arg_2.bottomDict[_local_15][_local_5];
                            };
                            makeAndMoveNpc(_local_14, _local_11, _local_5);
                            _arg_1[_local_11][_local_5] = _local_14;
                            _local_11++;
                        };
                        _local_5++;
                    };
                    triplePlaza.bottomDict = _arg_2.bottomDict;
                };
            };
            if (triplePlaza.npcDir == 3)
            {
                _local_4 = 0;
                while (_local_4 < tripleConfig.npcLen)
                {
                    _local_7 = 0;
                    while (_local_7 < tripleConfig.standLen)
                    {
                        _local_18 = -(_local_7 + 1);
                        _arg_1[_local_4][_local_18] = triplePlaza.leftDict[_local_4][_local_7];
                        _local_7++;
                    };
                    _local_4++;
                };
                _local_5 = 0;
                while (_local_5 < tripleConfig.npcLen)
                {
                    _local_8 = 0;
                    _local_9 = (tripleConfig.npcLen - 1);
                    while (_local_9 >= -(tripleConfig.standLen))
                    {
                        if (((!(_arg_1[_local_5])) || (!(_arg_1[_local_5][_local_9]))))
                        {
                            _local_3 = true;
                            _local_8++;
                        }
                        else
                        {
                            if (_local_8 > 0)
                            {
                                _local_12 = (_local_9 + _local_8);
                                _local_13 = _arg_1[_local_5][_local_9];
                                moveNpcViewTo(_local_13, _local_5, _local_12);
                                _arg_1[_local_5][_local_12] = _local_13;
                                _arg_1[_local_5][_local_9] = null;
                            };
                        };
                        _local_9--;
                    };
                    _local_10 = ((_local_8 - tripleConfig.standLen) - 1);
                    _local_11 = _local_10;
                    while (_local_11 >= -(tripleConfig.standLen))
                    {
                        if (_local_11 >= 0)
                        {
                            _local_14 = npcByPosition(_arg_2.instDict, _local_5, _local_11);
                        }
                        else
                        {
                            _local_19 = Math.abs(-(_local_11 + 1));
                            _local_14 = _arg_2.leftDict[_local_5][_local_19];
                        };
                        makeAndMoveNpc(_local_14, _local_5, _local_11);
                        _arg_1[_local_5][_local_11] = _local_14;
                        _local_11--;
                    };
                    _local_5++;
                };
                triplePlaza.leftDict = _arg_2.leftDict;
            };
            if (triplePlaza.npcDir == 7)
            {
                _local_4 = 0;
                while (_local_4 < tripleConfig.npcLen)
                {
                    _local_7 = 0;
                    while (_local_7 < tripleConfig.standLen)
                    {
                        _local_18 = (tripleConfig.npcLen + _local_7);
                        _arg_1[_local_4][_local_18] = triplePlaza.rightDict[_local_4][_local_7];
                        _local_7++;
                    };
                    _local_4++;
                };
                _local_16 = (tripleConfig.npcLen + tripleConfig.standLen);
                _local_5 = 0;
                while (_local_5 < tripleConfig.npcLen)
                {
                    _local_8 = 0;
                    _local_9 = 0;
                    while (_local_9 < _local_16)
                    {
                        if (((!(_arg_1[_local_5])) || (!(_arg_1[_local_5][_local_9]))))
                        {
                            _local_3 = true;
                            _local_8++;
                        }
                        else
                        {
                            if (_local_8 > 0)
                            {
                                _local_12 = (_local_9 - _local_8);
                                _local_13 = _arg_1[_local_5][_local_9];
                                moveNpcViewTo(_local_13, _local_5, _local_12);
                                _arg_1[_local_5][_local_12] = _local_13;
                                _arg_1[_local_5][_local_9] = null;
                            };
                        };
                        _local_9++;
                    };
                    _local_10 = (_local_16 - _local_8);
                    _local_11 = _local_10;
                    while (_local_11 < _local_16)
                    {
                        if (_local_11 < tripleConfig.npcLen)
                        {
                            _local_14 = npcByPosition(_arg_2.instDict, _local_5, _local_11);
                        }
                        else
                        {
                            _local_19 = (_local_11 - tripleConfig.npcLen);
                            _local_14 = _arg_2.rightDict[_local_5][_local_19];
                        };
                        makeAndMoveNpc(_local_14, _local_5, _local_11);
                        _arg_1[_local_5][_local_11] = _local_14;
                        _local_11++;
                    };
                    _local_5++;
                };
                triplePlaza.rightDict = _arg_2.rightDict;
            };
            _broadInfo = _arg_2;
            triplePlaza.instDict = _arg_2.instDict;
            ((!(_local_3)) && (checkContinue()));
        }

        public function onTripleKill(_arg_1:Object):void
        {
            var _local_5:String;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            var _local_18:int;
            var _local_19:Object;
            var _local_20:int;
            var _local_21:Object;
            if (((!(triplePlaza)) || (!(triplePlaza.instDict))))
            {
                return;
            };
            if (_tripleKilling)
            {
                _tripleArray = ((_tripleArray) || ([]));
                _tripleArray.push(_arg_1);
                return;
            };
            _killCombo++;
            _tripleKilling = true;
            var _local_2:Object = {};
            var _local_3:int;
            while (_local_3 < int(tripleConfig.npcLen))
            {
                _local_2[_local_3] = {};
                _local_3++;
            };
            var _local_4:Object = triplePlaza.instDict;
            for (_local_5 in _local_4)
            {
                _local_8 = _local_4[_local_5];
                if (_local_8)
                {
                    _local_2[_local_8.xpos][_local_8.ypos] = _local_8;
                };
            };
            _local_6 = {};
            _local_7 = 0;
            while (_local_7 < tripleConfig.npcLen)
            {
                _local_9 = 0;
                while (_local_9 < (tripleConfig.npcLen - 2))
                {
                    if (((equalByPos(_local_2, _local_7, _local_9, _local_7, (_local_9 + 1))) && (equalByPos(_local_2, _local_7, _local_9, _local_7, (_local_9 + 2)))))
                    {
                        _local_6[_local_2[_local_7][_local_9].instId] = true;
                        _local_6[_local_2[_local_7][(_local_9 + 1)].instId] = true;
                        _local_6[_local_2[_local_7][(_local_9 + 2)].instId] = true;
                        if ((_local_9 + 3) >= tripleConfig.npcLen) break;
                        _local_9 = (_local_9 + 2);
                        _local_10 = (_local_9 + 1);
                        while (equalByPos(_local_2, _local_7, _local_9, _local_7, _local_10))
                        {
                            _local_9 = _local_10;
                            _local_6[_local_2[_local_7][_local_10].instId] = true;
                            if ((_local_10 + 1) >= tripleConfig.npcLen) break;
                            _local_10++;
                        };
                    };
                    _local_9++;
                };
                _local_7++;
            };
            _local_7 = 0;
            while (_local_7 < tripleConfig.npcLen)
            {
                _local_9 = 0;
                while (_local_9 < (tripleConfig.npcLen - 2))
                {
                    if (((equalByPos(_local_2, _local_9, _local_7, (_local_9 + 1), _local_7)) && (equalByPos(_local_2, _local_9, _local_7, (_local_9 + 2), _local_7))))
                    {
                        _local_6[_local_2[_local_9][_local_7].instId] = true;
                        _local_6[_local_2[(_local_9 + 1)][_local_7].instId] = true;
                        _local_6[_local_2[(_local_9 + 2)][_local_7].instId] = true;
                        if ((_local_9 + 3) >= tripleConfig.npcLen) break;
                        _local_9 = (_local_9 + 2);
                        _local_10 = (_local_9 + 1);
                        while (equalByPos(_local_2, _local_9, _local_7, _local_10, _local_7))
                        {
                            _local_9 = _local_10;
                            _local_6[_local_2[_local_10][_local_7].instId] = true;
                            if ((_local_10 + 1) >= tripleConfig.npcLen) break;
                            _local_10++;
                        };
                    };
                    _local_9++;
                };
                _local_7++;
            };
            for (_local_5 in _local_6)
            {
                _local_11 = _local_4[_local_5];
                _local_12 = int(_local_11.specType);
                _local_13 = int(_local_11.xpos);
                _local_14 = int(_local_11.ypos);
                if (_local_12 == 1)
                {
                    _local_15 = -1;
                    while (_local_15 <= 1)
                    {
                        _local_16 = -1;
                        while (_local_16 <= 1)
                        {
                            _local_17 = (_local_13 + _local_15);
                            _local_18 = (_local_13 + _local_16);
                            if (!((_local_17 == _local_13) && (_local_18 == _local_14)))
                            {
                                _local_19 = this.tripleNpcByPos(_local_17, _local_18);
                                if (!((!(_local_19)) || (_local_6[_local_19.instId])))
                                {
                                    removeNpcByInstId(_local_19.instId);
                                    _local_2[_local_19.xpos][_local_19.ypos] = null;
                                };
                            };
                            _local_16++;
                        };
                        _local_15++;
                    };
                };
                removeNpcByInstId(int(_local_5));
                _local_2[_local_13][_local_14] = null;
            };
            if (_killCombo >= 1)
            {
                _local_20 = (_killCombo - 1);
                _local_21 = _core.view.getUI(ViewManager.MAIN_CNOTICE);
                _local_21.addNotice({
                    "delay":2000,
                    "effect":COMBO_CODE_ARRAY[_local_20],
                    "msg":""
                });
            };
            this.updateTripleNpcPos(_local_2, _arg_1);
        }

        public function tripleSwapNpc(_arg_1:int):void
        {
            var _local_7:String;
            var _local_8:Object;
            var _local_9:String;
            var _local_12:Object;
            var _local_13:Object;
            var _local_14:Object;
            var _local_15:String;
            var _local_16:String;
            var _local_2:Object = triplePlaza.instDict;
            var _local_3:* = _local_2[_arg_1];
            if (((!(_local_3)) || (_local_3.isLockUp)))
            {
                return;
            };
            var _local_4:int = _local_3.xpos;
            var _local_5:int = _local_3.ypos;
            var _local_6:Array = [];
            for (_local_7 in CHANGABLE_DICT)
            {
                _local_12 = CHANGABLE_DICT[_local_7];
                _local_13 = tripleNpcByPos((_local_4 + _local_12.x), (_local_5 + _local_12.y));
                if (!((!(_local_13)) || (_local_13.isLockUp)))
                {
                    _local_14 = GameData.d[GamePredef.TBL_NPC][_local_13.npcId];
                    _local_15 = (_local_14.name + _local_13.index);
                    _local_16 = LanguageUtil.replace(Language.TRIPLE_TOWN_PANEL[14], {"name":_local_15});
                    _local_6.push({
                        "func":"tripleTownNpcSwap",
                        "label":_local_16,
                        "param":_local_13.instId
                    });
                };
            };
            _local_8 = GameData.d[GamePredef.TBL_NPC][_local_3.npcId];
            _local_9 = ((_local_8) ? _local_8.onServiceText : "");
            var _local_10:String = (_local_8.name + _local_3.index);
            var _local_11:Object = _core.view.getUI(ViewManager.PANEL_NPCSCRIPT);
            _local_11.setInfo(_arg_1, _local_10, _local_9, _local_6);
        }

        public function onSyncRankList(_arg_1:Array):void
        {
            var _local_6:int;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:Object;
            if (!this.initialized)
            {
                this.callLater(onSyncRankList, [_arg_1]);
                return;
            };
            if (_tripleKilling)
            {
                _rankArray = _arg_1;
                return;
            };
            _rankArray = null;
            var _local_2:Array = [];
            var _local_3:* = "";
            var _local_4:* = "";
            var _local_5:String = ((triplePlaza) ? triplePlaza.leaderId : null);
            if (((_arg_1) && (_arg_1.length > 0)))
            {
                _local_6 = _arg_1.length;
                _local_7 = 0;
                while (_local_7 < _local_6)
                {
                    _local_8 = _arg_1[_local_7];
                    if (((_local_5) && (_local_8.leaderId == _local_5)))
                    {
                        _local_3 = String((_local_7 + 1));
                        _local_4 = _local_8.score;
                    };
                    if (_local_2.length < RANK_LIMIT)
                    {
                        _local_9 = {
                            "id":(_local_7 + 1),
                            "leader":_local_8.leader,
                            "member":_local_8.member,
                            "score":_local_8.score
                        };
                        _local_2.push(_local_9);
                    };
                    _local_7++;
                };
            };
            myIndex.htmlText = (Language.TRIPLE_TOWN_PANEL[10] + _local_3);
            myScore.htmlText = (Language.TRIPLE_TOWN_PANEL[11] + _local_4);
            rankBar.dataProvider = _local_2;
        }

        public function ___TripleTownPanel_FilterButton2_click(_arg_1:MouseEvent):void
        {
            gainHandler(_arg_1);
        }

        public function createTripleTownNpc(_arg_1:Object, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_5:Object = GameData.d[GamePredef.TBL_NPC][_arg_1.npcId];
            if (!_local_5)
            {
                return;
            };
            var _local_6:Object = ObjectUtil.copy(_local_5);
            _local_6.id = _arg_1.instId;
            _local_6.type = GamePredef.NPC_TYPE_TRIPLE_TOWN;
            _local_6.posX = _arg_2;
            _local_6.posY = _arg_3;
            _local_6.nid = _arg_1.npcId;
            _local_6.busy = false;
            _local_6.name = (_local_6.name + _arg_1.index);
            _core.createNpc(_local_6);
            var _local_7:Npc = _core.getNpc(_arg_1.instId);
            if (!_local_7)
            {
                return;
            };
            _local_7.tripleNpc = _arg_1;
            _local_7.state = STATE_DICT[_arg_1.specType];
            var _local_8:NPCView = (_core.view.getN(_local_7.id) as NPCView);
            ((_local_8) && (_local_8.dotaFaceTo(_arg_4)));
        }

        public function removeNpcByInstId(_arg_1:Number):void
        {
            if (((triplePlaza.instDict) && (triplePlaza.instDict[_arg_1])))
            {
                triplePlaza.instDict[_arg_1] = null;
                delete triplePlaza.instDict[_arg_1];
            };
            var _local_2:NPCView = (_core.view.getN(_arg_1) as NPCView);
            ((_local_2) && (_local_2.hulaDead(3)));
            _core.view.removeN(_arg_1);
        }

        private function _TripleTownPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = TripleTownItemRenderer;
            return (_local_1);
        }

        private function _TripleTownPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TRIPLE_TOWN_PANEL[0];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[1];
            _local_1 = pageTab.selectedIndex;
            _local_1 = Language.TRIPLE_TOWN_PANEL[2];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[3];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[4];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[5];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[6];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[7];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[8];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[9];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[10];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[11];
            _local_1 = Language.TRIPLE_TOWN_PANEL[12];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
        }

        private function swapHandler(_arg_1:NPCView):void
        {
            _arg_1.moveEndCall = null;
            _arg_1.dotaFaceTo(triplePlaza.npcDir);
        }

        private function NpcViewWlakTo(_arg_1:NPCView, _arg_2:int, _arg_3:int):void
        {
            var _local_4:Object = _arg_1.gameObject.tripleNpc;
            _moveNpcDict[_local_4.instId] = _arg_1;
            _arg_1.moveEndCall = stopHandler;
            _arg_1.walkTo(_arg_2, _arg_3);
        }

        private function _TripleTownPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_TripleTownPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTab.filters = _arg_1;
            }, "pageTab.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.TRIPLE_TOWN_PANEL[1]);
            }, function (_arg_1:Array):void
            {
                pageTab.dataArray = _arg_1;
            }, "pageTab.dataArray");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTab.selectedIndex);
            }, function (_arg_1:int):void
            {
                viewStack.selectedIndex = _arg_1;
            }, "viewStack.selectedIndex");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_Label1.text = _arg_1;
            }, "_TripleTownPanel_Label1.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownPanel_Label1.filters = _arg_1;
            }, "_TripleTownPanel_Label1.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_FilterTextArea1.htmlText = _arg_1;
            }, "_TripleTownPanel_FilterTextArea1.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownPanel_FilterTextArea1.filters = _arg_1;
            }, "_TripleTownPanel_FilterTextArea1.filters");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_FilterButton1.label = _arg_1;
            }, "_TripleTownPanel_FilterButton1.label");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownPanel_FilterButton1.filters = _arg_1;
            }, "_TripleTownPanel_FilterButton1.filters");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_Label2.text = _arg_1;
            }, "_TripleTownPanel_Label2.text");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownPanel_Label2.filters = _arg_1;
            }, "_TripleTownPanel_Label2.filters");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownPanel_Label3.filters = _arg_1;
            }, "_TripleTownPanel_Label3.filters");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_Label3.text = _arg_1;
            }, "_TripleTownPanel_Label3.text");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownPanel_Label4.filters = _arg_1;
            }, "_TripleTownPanel_Label4.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_Label4.text = _arg_1;
            }, "_TripleTownPanel_Label4.text");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownPanel_Label5.filters = _arg_1;
            }, "_TripleTownPanel_Label5.filters");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_Label5.text = _arg_1;
            }, "_TripleTownPanel_Label5.text");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownPanel_Label6.filters = _arg_1;
            }, "_TripleTownPanel_Label6.filters");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_Label6.text = _arg_1;
            }, "_TripleTownPanel_Label6.text");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                myIndex.filters = _arg_1;
            }, "myIndex.filters");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myIndex.htmlText = _arg_1;
            }, "myIndex.htmlText");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                myScore.filters = _arg_1;
            }, "myScore.filters");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myScore.htmlText = _arg_1;
            }, "myScore.htmlText");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownPanel_FilterButton2.label = _arg_1;
            }, "_TripleTownPanel_FilterButton2.label");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownPanel_FilterButton2.filters = _arg_1;
            }, "_TripleTownPanel_FilterButton2.filters");
            result[25] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get myScore():Label
        {
            return (this._1497492550myScore);
        }

        public function tripleNpcScript(_arg_1:Number, _arg_2:Object):void
        {
            if (_tripleKilling)
            {
                _core.sysMsg(Language.TRIPLE_TOWN_PANEL[15]);
                return;
            };
            var _local_3:String = _arg_2.func;
            if (_local_3 == "changePrompt")
            {
                tripleSwapNpc(_arg_1);
                return;
            };
            _core.remote.call(_local_3, null, _arg_1, _arg_2.param);
        }

        private function enterHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            _core.remote.call("tripleTownEnter", null);
        }

        private function onLoadEffect(_arg_1:Event):void
        {
            var _local_6:BitmapData;
            var _local_2:LoaderInfo = (_arg_1.currentTarget as LoaderInfo);
            if (!_local_2)
            {
                return;
            };
            _local_2.removeEventListener(Event.COMPLETE, onLoadEffect);
            bombDict = [];
            var _local_3:Class = (_local_2.applicationDomain.getDefinition("bomb") as Class);
            var _local_4:MovieClip = new (_local_3)();
            var _local_5:int = 1;
            while (_local_5 <= _local_4.totalFrames)
            {
                _local_4.gotoAndStop(_local_5);
                _local_6 = new BitmapData(160, 160, true, 0xFFFFFF);
                _local_6.draw(_local_4);
                bombDict.push(_local_6);
                _local_5++;
            };
            _loadState = 2;
        }

        [Bindable(event="propertyChange")]
        public function get rankBar():List
        {
            return (this._978073671rankBar);
        }

        private function npcByPosition(_arg_1:Object, _arg_2:uint, _arg_3:uint):Object
        {
            var _local_4:String;
            var _local_5:Object;
            for (_local_4 in _arg_1)
            {
                _local_5 = _arg_1[_local_4];
                if (_local_5)
                {
                    if (((_local_5.xpos == _arg_2) && (_local_5.ypos == _arg_3)))
                    {
                        return (_local_5);
                    };
                };
            };
            return (null);
        }

        private function onTripleSyncRankList(_arg_1:Object):void
        {
            var _local_2:Array = _arg_1.rankList;
            if (_arg_1.hasOwnProperty("leaderId"))
            {
                triplePlaza = ((triplePlaza) || ({}));
                triplePlaza.leaderId = _arg_1["leaderId"];
            };
            onSyncRankList(_local_2);
        }

        private function moveNpcViewTo(_arg_1:Object, _arg_2:int, _arg_3:int):void
        {
            var _local_4:Object;
            var _local_5:Number = _arg_1.instId;
            if (((((_arg_2 >= 0) && (_arg_3 >= 0)) && (_arg_2 < tripleConfig.npcLen)) && (_arg_3 < tripleConfig.npcLen)))
            {
                _arg_1.xpos = _arg_2;
                _arg_1.ypos = _arg_3;
                _arg_1.isStandBy = false;
                triplePlaza.instDict[_local_5] = _arg_1;
                _local_4 = INST_DICT[_arg_2][_arg_3];
            };
            var _local_6:NPCView = (_core.view.getN(_local_5) as NPCView);
            if (!_local_6)
            {
                return;
            };
            if (_local_6.gameObject)
            {
                _local_6.gameObject.tripleNpc = _arg_1;
            };
            if (_arg_2 < 0)
            {
                _arg_2 = Math.abs((_arg_2 + 1));
                _local_4 = TOP_DICT[_arg_2][_arg_3];
            }
            else
            {
                if (_arg_2 >= tripleConfig.npcLen)
                {
                    _arg_2 = (_arg_2 - int(tripleConfig.npcLen));
                    _local_4 = BOTTOM_DICT[_arg_2][_arg_3];
                }
                else
                {
                    if (_arg_3 < 0)
                    {
                        _arg_3 = Math.abs((_arg_3 + 1));
                        _local_4 = LEFT_DICT[_arg_2][_arg_3];
                    }
                    else
                    {
                        if (_arg_3 >= tripleConfig.npcLen)
                        {
                            _arg_3 = (_arg_3 - int(tripleConfig.npcLen));
                            _local_4 = RIGHT_DICT[_arg_2][_arg_3];
                        };
                    };
                };
            };
            NpcViewWlakTo(_local_6, _local_4.x, _local_4.y);
        }

        private function gradiantHandler(_arg_1:Event):void
        {
            var _local_2:NPCView = (_arg_1.currentTarget as NPCView);
            var _local_3:Number = (_local_2.alpha + ALPHA_ADD);
            if (_local_3 >= 1)
            {
                _local_3 = 1;
                _local_2.removeEventListener(Event.ENTER_FRAME, gradiantHandler);
            };
            _local_2.alpha = _local_3;
        }

        [Bindable(event="propertyChange")]
        public function get myIndex():Label
        {
            return (this._1488574086myIndex);
        }

        public function set myScore(_arg_1:Label):void
        {
            var _local_2:Object = this._1497492550myScore;
            if (_local_2 !== _arg_1)
            {
                this._1497492550myScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myScore", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        public function set rankBar(_arg_1:List):void
        {
            var _local_2:Object = this._978073671rankBar;
            if (_local_2 !== _arg_1)
            {
                this._978073671rankBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankBar", _local_2, _arg_1));
            };
        }

        private function tripleNpcByPos(_arg_1:uint, _arg_2:uint):Object
        {
            if (((!(triplePlaza)) || (!(triplePlaza.instDict))))
            {
                return (null);
            };
            var _local_3:Object = triplePlaza.instDict;
            return (npcByPosition(_local_3, _arg_1, _arg_2));
        }

        override public function initialize():void
        {
            var target:TripleTownPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TripleTownPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TripleTownPanelWatcherSetupUtil");
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

        public function onSwapTripleNpc(_arg_1:Object):void
        {
            var _local_7:Object;
            var _local_8:Object;
            if (((!(triplePlaza)) || (!(triplePlaza.instDict))))
            {
                return;
            };
            var _local_2:Object = triplePlaza.instDict;
            var _local_3:Object = _arg_1.tripleNpc;
            var _local_4:Object = _arg_1.swapNpc;
            _local_2[_local_3.instId] = _local_3;
            _local_2[_local_4.instId] = _local_4;
            var _local_5:NPCView = (_core.view.getN(_local_3.instId) as NPCView);
            if (_local_5)
            {
                if (_local_5.gameObject)
                {
                    _local_5.gameObject.tripleNpc = _local_3;
                };
                _local_7 = INST_DICT[_local_3.xpos][_local_3.ypos];
                _local_5.moveEndCall = swapHandler;
                _local_5.walkTo(_local_7.x, _local_7.y);
            };
            var _local_6:NPCView = (_core.view.getN(_local_4.instId) as NPCView);
            if (_local_6)
            {
                if (_local_6.gameObject)
                {
                    _local_6.gameObject.tripleNpc = _local_4;
                };
                _local_8 = INST_DICT[_local_4.xpos][_local_4.ypos];
                _local_6.moveEndCall = swapHandler;
                _local_6.walkTo(_local_8.x, _local_8.y);
            };
        }

        private function equalByPos(_arg_1:Object, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            if (((((!(_arg_1[_arg_2])) || (!(_arg_1[_arg_2][_arg_3]))) || (!(_arg_1[_arg_4]))) || (!(_arg_1[_arg_4][_arg_5]))))
            {
                return (false);
            };
            var _local_6:Number = Number(_arg_1[_arg_2][_arg_3].npcId);
            var _local_7:Number = Number(_arg_1[_arg_4][_arg_5].npcId);
            return (_local_6 == _local_7);
        }

        private function gainHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            _core.remote.call("tripleTownTakeAward", null);
        }

        public function set viewStack(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1584105757viewStack;
            if (_local_2 !== _arg_1)
            {
                this._1584105757viewStack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewStack", _local_2, _arg_1));
            };
        }

        private function checkContinue():void
        {
            var _local_1:Object;
            tripleTwonTurnInfo(_broadInfo);
            _moveNpcDict = {};
            _broadInfo = null;
            _tripleKilling = false;
            if (((_tripleArray) && (_tripleArray.length > 0)))
            {
                _local_1 = _tripleArray.shift();
                this.onTripleKill(_local_1);
            }
            else
            {
                _killCombo = 0;
                ((_rankArray) && (onSyncRankList(_rankArray)));
                _core.sysMsg(Language.TRIPLE_TOWN_PANEL[28]);
            };
        }

        public function tripleTownBattleEnd(_arg_1:Object):void
        {
            var _local_2:Object;
            if (((!(triplePlaza)) || (!(triplePlaza.instDict))))
            {
                return;
            };
            if (_arg_1.npcDir != triplePlaza.npcDir)
            {
                triplePlaza.npcDir = _arg_1.npcDir;
                tripleChangeDir();
                _local_2 = _core.view.getUI(ViewManager.PANEL_TRIPLE_TURN);
                ((_local_2) && (_local_2.updateView(triplePlaza)));
            };
            removeNpcByInstId(_arg_1.instId);
        }

        public function tripleTwonSync(_arg_1:Object):void
        {
            var _local_4:String;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:int;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:int;
            var _local_13:int;
            var _local_14:*;
            var _local_15:Object;
            var _local_16:int;
            var _local_17:int;
            var _local_18:Object;
            var _local_19:Object;
            _killCombo = 0;
            _tripleKilling = false;
            _broadInfo = null;
            _tripleArray = null;
            _rankArray = null;
            _moveNpcDict = {};
            this.loadEffect();
            triplePlaza = _arg_1.plaza;
            tripleConfig = _arg_1.config;
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_TRIPLE_TURN);
            ((_local_2) && (_local_2.updateView(triplePlaza)));
            var _local_3:Object = triplePlaza.instDict;
            for (_local_4 in _local_3)
            {
                _local_10 = _local_3[_local_4];
                if (_local_10)
                {
                    _local_11 = INST_DICT[_local_10.xpos][_local_10.ypos];
                    createTripleTownNpc(_local_10, _local_11.x, _local_11.y, triplePlaza.npcDir);
                };
            };
            _local_5 = triplePlaza.topDict;
            _local_6 = triplePlaza.bottomDict;
            _local_7 = 0;
            while (_local_7 < int(tripleConfig.standLen))
            {
                _local_12 = 0;
                while (_local_12 < int(tripleConfig.npcLen))
                {
                    if (!((!(_local_5[_local_7])) || (!(_local_5[_local_7][_local_12]))))
                    {
                        _local_14 = _local_5[_local_7][_local_12];
                        _local_11 = TOP_DICT[_local_7][_local_12];
                        createTripleTownNpc(_local_14, _local_11.x, _local_11.y, 1);
                    };
                    _local_12++;
                };
                _local_13 = 0;
                while (_local_13 < int(tripleConfig.npcLen))
                {
                    if (!((!(_local_6[_local_7])) || (!(_local_6[_local_7][_local_13]))))
                    {
                        _local_15 = _local_6[_local_7][_local_13];
                        _local_11 = BOTTOM_DICT[_local_7][_local_13];
                        createTripleTownNpc(_local_15, _local_11.x, _local_11.y, 5);
                    };
                    _local_13++;
                };
                _local_7++;
            };
            var _local_8:Object = triplePlaza.leftDict;
            var _local_9:Object = triplePlaza.rightDict;
            _local_7 = 0;
            while (_local_7 < int(tripleConfig.npcLen))
            {
                _local_16 = 0;
                while (_local_16 < int(tripleConfig.standLen))
                {
                    if (!((!(_local_8[_local_7])) || (!(_local_8[_local_7][_local_16]))))
                    {
                        _local_18 = _local_8[_local_7][_local_16];
                        _local_11 = LEFT_DICT[_local_7][_local_16];
                        createTripleTownNpc(_local_18, _local_11.x, _local_11.y, 3);
                    };
                    _local_16++;
                };
                _local_17 = 0;
                while (_local_17 < int(tripleConfig.standLen))
                {
                    if (!((!(_local_9[_local_7])) || (!(_local_9[_local_7][_local_17]))))
                    {
                        _local_19 = _local_9[_local_7][_local_17];
                        _local_11 = RIGHT_DICT[_local_7][_local_17];
                        createTripleTownNpc(_local_19, _local_11.x, _local_11.y, 7);
                    };
                    _local_17++;
                };
                _local_7++;
            };
        }

        private function stopHandler(_arg_1:NPCView):void
        {
            var _local_4:String;
            var _local_5:NPCView;
            var _local_2:Object = _arg_1.gameObject.tripleNpc;
            _moveNpcDict[_local_2.instId] = null;
            delete _moveNpcDict[_local_2.instId];
            _arg_1.moveEndCall = null;
            var _local_3:int;
            for (_local_4 in _moveNpcDict)
            {
                _local_5 = _moveNpcDict[_local_4];
                if (_local_5)
                {
                    if (!_local_5.isWalking)
                    {
                        _local_5.moveEndCall = null;
                        _moveNpcDict[_local_4] = null;
                        delete _moveNpcDict[_local_4];
                    }
                    else
                    {
                        _local_3++;
                    };
                };
            };
            ((_local_3 <= 0) && (checkContinue()));
        }

        public function ___TripleTownPanel_FilterButton1_click(_arg_1:MouseEvent):void
        {
            enterHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get viewStack():ViewStack
        {
            return (this._1584105757viewStack);
        }

        override public function show():void
        {
            super.show();
            _core.remote.call("tripleSyncRankList", new Responder(onTripleSyncRankList));
        }

        public function tripleChangeDir():void
        {
            var _local_3:String;
            var _local_4:Object;
            var _local_5:NPCView;
            var _local_1:int = int(triplePlaza.npcDir);
            var _local_2:Object = triplePlaza.instDict;
            for (_local_3 in _local_2)
            {
                _local_4 = _local_2[_local_3];
                if (_local_4)
                {
                    _local_5 = (_core.view.getN(Number(_local_3)) as NPCView);
                    ((_local_5) && (_local_5.dotaFaceTo(_local_1)));
                };
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

