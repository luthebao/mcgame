// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.FazendaPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.FazendaPorTraitCanvas;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.FazendaFarm;
    import mx.effects.Move;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.containers.Canvas;
    import mx.effects.Fade;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.FriendCanvas;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.effects.Parallel;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.utils.ArrayQueue;
    import mx.core.mx_internal;
    import mx.events.EffectEvent;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.data.GameData;
    import mx.managers.CursorManager;
    import mx.binding.Binding;
    import flash.events.Event;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.FlexEvent;
    import flash.events.TimerEvent;
    import mx.binding.BindingManager;
    import flash.utils.getDefinitionByName;
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

    public class FazendaPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const MIN_LIMIT_INTERVAL:Number = 60000;
        private var _779863925btnFazendaSelf:Button;
        private var _1825424707charProCanv:FazendaPorTraitCanvas;
        public var _FazendaPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _97201859farm9:FazendaFarm;
        private var _529048897btnFazendaBag:Button;
        private var _128572838palEff_move:Move;
        private var _timer:Timer;
        private var _1281709865farm12:FazendaFarm;
        private var _97201856farm6:FazendaFarm;
        private var _farmData:Object;
        private var _1022448295eff_mvoe:Move;
        private var _97201853farm3:FazendaFarm;
        private var _1281709862farm15:FazendaFarm;
        private var _107332log:LinkTextArea;
        private var _795753972fridProCanv:FazendaPorTraitCanvas;
        private var _1281709867farm10:FazendaFarm;
        private var _1264843059btnGetMine:Button;
        private var _1042049322moveCanva:Canvas;
        private var _128350289palEff_fade:Fade;
        private var _820043980imgEffect:Image;
        private var _97201857farm7:FazendaFarm;
        private var _1281709864farm13:FazendaFarm;
        private var _779866911btnFazendaShop:Button;
        private var _97201854farm4:FazendaFarm;
        private var _1191416940btnGetMineAll:Button;
        private var _2082333005btnClean:Button;
        private var _1757185436friendCanv:FriendCanvas;
        private var _97201851farm1:FazendaFarm;
        private var _1281709861farm16:FazendaFarm;
        private var _194320021btnEvents:Button;
        private var _1243540683moveBtn:Button;
        private var _1916398857imgCanv:SimpleCanvas;
        private var _updateFlag:Boolean = false;
        private var _fazendaDataSelf:Object;
        private var _995633846palEff:Parallel;
        private var _1281709866farm11:FazendaFarm;
        private var _97201858farm8:FazendaFarm;
        private var _1460358754btnPlantMine:Button;
        private var _97201855farm5:FazendaFarm;
        private var _1281709863farm14:FazendaFarm;
        private var _97201852farm2:FazendaFarm;
        private var _1185079743img_bg:Image;
        private var _lastTime:Number = 0;
        private var _529035306btnFazendaPet:Button;
        private var _mineData:Object;
        public var _ownerId:int;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":770,
                    "height":510,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FazendaPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"imgCanv",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.top = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":750,
                                "height":460,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"img_bg",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":99,
                                            "percentHeight":99
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":303,
                                            "height":65,
                                            "label":"操作区",
                                            "styleName":"fazendaMenuCanva",
                                            "x":307,
                                            "y":395,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnPlantMine",
                                                "events":{"click":"__btnPlantMine_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                    this.left = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"plantMine",
                                                        "width":58,
                                                        "height":59
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnGetMine",
                                                "events":{"click":"__btnGetMine_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                    this.left = "66";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"getMine",
                                                        "width":58,
                                                        "height":59
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnGetMineAll",
                                                "events":{"click":"__btnGetMineAll_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                    this.left = "123";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"getMineAll",
                                                        "width":58,
                                                        "height":59
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnClean",
                                                "events":{"click":"__btnClean_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                    this.left = "181";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"plantClean",
                                                        "width":58,
                                                        "height":59
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnEvents",
                                                "events":{"click":"__btnEvents_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                    this.left = "239";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"fazendaEvents",
                                                        "width":58,
                                                        "height":59,
                                                        "enabled":true
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm1",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":1});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm2",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":2});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm3",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":3});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm4",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":4});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm5",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":5});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm6",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":6});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm7",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":7});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm8",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":8});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm9",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":9});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm10",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":10});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm11",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":11});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm12",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":12});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm13",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":13});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm14",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":14});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm15",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":15});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaFarm,
                        "id":"farm16",
                        "propertiesFactory":function ():Object
                        {
                            return ({"idx":16});
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaPorTraitCanvas,
                        "id":"charProCanv",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":39
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FazendaPorTraitCanvas,
                        "id":"fridProCanv",
                        "stylesFactory":function ():void
                        {
                            this.top = "100";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":15});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.top = "39";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":300,
                                "height":60,
                                "label":"商店区",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnFazendaSelf",
                                    "events":{"click":"__btnFazendaSelf_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                        this.right = "210";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"fazendaSelf",
                                            "width":58,
                                            "height":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnFazendaShop",
                                    "events":{"click":"__btnFazendaShop_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                        this.right = "144";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"fazendaShop",
                                            "width":58,
                                            "height":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnFazendaBag",
                                    "events":{"click":"__btnFazendaBag_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                        this.right = "78";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"fazendaBag",
                                            "width":58,
                                            "height":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnFazendaPet",
                                    "events":{"click":"__btnFazendaPet_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"fazendaPet",
                                            "width":58,
                                            "height":59
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"moveCanva",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":147,
                                "width":170,
                                "height":270,
                                "x":590,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"moveBtn",
                                    "events":{"click":"__moveBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"fazendaFrientsHide",
                                            "x":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FriendCanvas,
                                    "id":"friendCanv",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"styleName":"fazendaMenuCanva"});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgEffect",
                        "propertiesFactory":function ():Object
                        {
                            return ({"visible":false});
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkTextArea,
                        "id":"log",
                        "stylesFactory":function ():void
                        {
                            this.backgroundAlpha = 0.3;
                            this.backgroundColor = 0;
                            this.borderStyle = "none";
                            this.color = 16774324;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":13,
                                "y":350,
                                "width":300,
                                "height":140,
                                "mouseEnabled":false,
                                "editable":false,
                                "enabled":true,
                                "selectable":false
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _farmLog:ArrayQueue = new ArrayQueue(20);
        private var _fids:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FazendaPanel()
        {
            mx_internal::_document = this;
            this.width = 770;
            this.height = 510;
            this.styleName = "StandardContent";
            _FazendaPanel_Move1_i();
            _FazendaPanel_Parallel1_i();
            this.addEventListener("creationComplete", ___FazendaPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FazendaPanel._watcherSetupUtil = _arg_1;
        }


        public function __eff_mvoe_effectEnd(_arg_1:EffectEvent):void
        {
            moveEnd();
        }

        public function onMineTimeOut(_arg_1:int):void
        {
            if (this[("farm" + _arg_1)].getHavestFlag())
            {
                this[("farm" + _arg_1)].onMineTimeOut();
                if (_ownerId == _core.player.id)
                {
                    this[("farm" + _arg_1)].updateView();
                };
            };
        }

        public function set imgCanv(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._1916398857imgCanv;
            if (_local_2 !== _arg_1)
            {
                this._1916398857imgCanv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgCanv", _local_2, _arg_1));
            };
        }

        private function _FazendaPanel_Parallel1_i():Parallel
        {
            var _local_1:Parallel = new Parallel();
            palEff = _local_1;
            _local_1.duration = 2000;
            _local_1.children = [_FazendaPanel_Move2_i(), _FazendaPanel_Fade1_i()];
            _local_1.addEventListener("effectEnd", __palEff_effectEnd);
            return (_local_1);
        }

        public function onFarmLvUp(_arg_1:Number):void
        {
            _fazendaDataSelf.farm.exp = _arg_1;
            charProCanv.onFarmLvUp(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get fridProCanv():FazendaPorTraitCanvas
        {
            return (this._795753972fridProCanv);
        }

        public function __btnFazendaSelf_click(_arg_1:MouseEvent):void
        {
            enterSelfFazenda();
        }

        public function set fridProCanv(_arg_1:FazendaPorTraitCanvas):void
        {
            var _local_2:Object = this._795753972fridProCanv;
            if (_local_2 !== _arg_1)
            {
                this._795753972fridProCanv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fridProCanv", _local_2, _arg_1));
            };
        }

        public function __btnClean_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, GamePredef.ACTION_CLEAR_PLANT);
        }

        public function updateActpoint():void
        {
            if (initialized)
            {
                charProCanv.changeActpntAndMovePntVisible();
            };
        }

        public function __btnFazendaBag_click(_arg_1:MouseEvent):void
        {
            openFazendaBag();
        }

        private function openPetFightPanel():void
        {
            var _local_2:String;
            var _local_3:Object;
            var _local_1:Boolean;
            for (_local_2 in _core.player.petList)
            {
                _local_1 = true;
                break;
            };
            if (_local_1)
            {
                _core.nextGuide(ViewManager.PANEL_PETFIGHT_CONF, "", -1);
                _local_3 = _core.view.getUI(ViewManager.PANEL_PETFIGHT_CONF);
                _local_3.visible = (!(_local_3.visible));
                _local_3.petCrossConf = {
                    "f":false,
                    "t":false
                };
            }
            else
            {
                Alert.show(Language.FAZENDAPANEL_S[12]);
            };
        }

        public function set btnFazendaShop(_arg_1:Button):void
        {
            var _local_2:Object = this._779866911btnFazendaShop;
            if (_local_2 !== _arg_1)
            {
                this._779866911btnFazendaShop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFazendaShop", _local_2, _arg_1));
            };
        }

        public function onAddMineral(_arg_1:Object):void
        {
            var _local_4:String;
            if (!_arg_1.f)
            {
                return;
            };
            var _local_2:Object = {};
            _local_2.id = _arg_1.mid;
            _local_2.maxNum = GameData.d[GamePredef.TBL_MINERAL_TEMPLATE][_arg_1.mid].num;
            _local_2.num = GameData.d[GamePredef.TBL_MINERAL_TEMPLATE][_arg_1.mid].num;
            _local_2.time = _arg_1.time;
            _fazendaDataSelf.mine[_arg_1.fid] = _local_2;
            var _local_3:int = (_arg_1.exp - _fazendaDataSelf.farm.exp);
            if (_local_3 < 1)
            {
                addFarmLog((Language.FAZENDAPANEL_S[19] + "\n"));
            }
            else
            {
                _local_4 = Language.FAZENDAPANEL_S[14].toString().replace("{num}", _local_3);
                addFarmLog(_local_4);
            };
            charProCanv.onFarmLvUp(_arg_1.exp);
            _fazendaDataSelf.farm.exp = _arg_1.exp;
            this[("farm" + _arg_1.fid)].setMid(_arg_1.mid);
            this[("farm" + _arg_1.fid)].setMineState(GamePredef.MINE_GROW_UP);
            this[("farm" + _arg_1.fid)].setNum(_local_2.num);
            this[("farm" + _arg_1.fid)].setTime(_local_2.time);
            this[("farm" + _arg_1.fid)].updateView();
        }

        public function handleClick(_arg_1:MouseEvent):void
        {
            _core.view.resoreMouse();
            CursorManager.removeAllCursors();
        }

        [Bindable(event="propertyChange")]
        public function get img_bg():Image
        {
            return (this._1185079743img_bg);
        }

        [Bindable(event="propertyChange")]
        public function get palEff_fade():Fade
        {
            return (this._128350289palEff_fade);
        }

        public function set moveCanva(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1042049322moveCanva;
            if (_local_2 !== _arg_1)
            {
                this._1042049322moveCanva = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCanva", _local_2, _arg_1));
            };
        }

        public function updateFriendsData(_arg_1:Object):void
        {
            friendCanv.initFriendsData(_arg_1);
        }

        public function __btnFazendaShop_click(_arg_1:MouseEvent):void
        {
            openFazendaShop();
        }

        [Bindable(event="propertyChange")]
        public function get btnPlantMine():Button
        {
            return (this._1460358754btnPlantMine);
        }

        [Bindable(event="propertyChange")]
        public function get friendCanv():FriendCanvas
        {
            return (this._1757185436friendCanv);
        }

        public function set imgEffect(_arg_1:Image):void
        {
            var _local_2:Object = this._820043980imgEffect;
            if (_local_2 !== _arg_1)
            {
                this._820043980imgEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgEffect", _local_2, _arg_1));
            };
        }

        private function openFazendaShop():void
        {
            _core.view.changeVisible(ViewManager.PANEL_FAZENDA_SHOP);
        }

        public function playerAction(_arg_1:int, _arg_2:Object, _arg_3:Array):void
        {
            palEff.end();
            imgEffect.source = _arg_2;
            imgEffect.filters = _arg_3;
            imgEffect.visible = true;
            var _local_4:uint = uint((this[("farm" + 2)].x + (this[("farm" + 2)].width / 2)));
            var _local_5:uint = uint((this[("farm" + 2)].y + (this[("farm" + 2)].height / 2)));
            palEff.target = imgEffect;
            palEff_move.xFrom = ((this[("farm" + _arg_1)].x + (this[("farm" + _arg_1)].width / 2)) - _local_4);
            palEff_move.yFrom = ((this[("farm" + _arg_1)].y + (this[("farm" + _arg_1)].height / 2)) - _local_5);
            palEff_move.yBy = -(_local_5);
            palEff_move.xBy = 0;
            palEff.play();
        }

        public function set log(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._107332log;
            if (_local_2 !== _arg_1)
            {
                this._107332log = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "log", _local_2, _arg_1));
            };
        }

        public function set img_bg(_arg_1:Image):void
        {
            var _local_2:Object = this._1185079743img_bg;
            if (_local_2 !== _arg_1)
            {
                this._1185079743img_bg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_bg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnEvents():Button
        {
            return (this._194320021btnEvents);
        }

        public function set btnClean(_arg_1:Button):void
        {
            var _local_2:Object = this._2082333005btnClean;
            if (_local_2 !== _arg_1)
            {
                this._2082333005btnClean = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnClean", _local_2, _arg_1));
            };
        }

        public function set palEff_fade(_arg_1:Fade):void
        {
            var _local_2:Object = this._128350289palEff_fade;
            if (_local_2 !== _arg_1)
            {
                this._128350289palEff_fade = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "palEff_fade", _local_2, _arg_1));
            };
        }

        public function set palEff(_arg_1:Parallel):void
        {
            var _local_2:Object = this._995633846palEff;
            if (_local_2 !== _arg_1)
            {
                this._995633846palEff = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "palEff", _local_2, _arg_1));
            };
        }

        private function _FazendaPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDAPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FazendaPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_FazendaPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDAPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnGetMineAll.toolTip = _arg_1;
            }, "btnGetMineAll.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 192);
            }, function (_arg_1:Number):void
            {
                farm1.x = _arg_1;
            }, "farm1.x");
            result[2] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 0);
            }, function (_arg_1:Number):void
            {
                farm1.y = _arg_1;
            }, "farm1.y");
            result[3] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 135);
            }, function (_arg_1:Number):void
            {
                farm2.x = _arg_1;
            }, "farm2.x");
            result[4] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 32);
            }, function (_arg_1:Number):void
            {
                farm2.y = _arg_1;
            }, "farm2.y");
            result[5] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 82);
            }, function (_arg_1:Number):void
            {
                farm3.x = _arg_1;
            }, "farm3.x");
            result[6] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 65);
            }, function (_arg_1:Number):void
            {
                farm3.y = _arg_1;
            }, "farm3.y");
            result[7] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 30);
            }, function (_arg_1:Number):void
            {
                farm4.x = _arg_1;
            }, "farm4.x");
            result[8] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 96);
            }, function (_arg_1:Number):void
            {
                farm4.y = _arg_1;
            }, "farm4.y");
            result[9] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 247);
            }, function (_arg_1:Number):void
            {
                farm5.x = _arg_1;
            }, "farm5.x");
            result[10] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 36);
            }, function (_arg_1:Number):void
            {
                farm5.y = _arg_1;
            }, "farm5.y");
            result[11] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 192);
            }, function (_arg_1:Number):void
            {
                farm6.x = _arg_1;
            }, "farm6.x");
            result[12] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 68);
            }, function (_arg_1:Number):void
            {
                farm6.y = _arg_1;
            }, "farm6.y");
            result[13] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 139);
            }, function (_arg_1:Number):void
            {
                farm7.x = _arg_1;
            }, "farm7.x");
            result[14] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 101);
            }, function (_arg_1:Number):void
            {
                farm7.y = _arg_1;
            }, "farm7.y");
            result[15] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 85);
            }, function (_arg_1:Number):void
            {
                farm8.x = _arg_1;
            }, "farm8.x");
            result[16] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 131);
            }, function (_arg_1:Number):void
            {
                farm8.y = _arg_1;
            }, "farm8.y");
            result[17] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 304);
            }, function (_arg_1:Number):void
            {
                farm9.x = _arg_1;
            }, "farm9.x");
            result[18] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 72);
            }, function (_arg_1:Number):void
            {
                farm9.y = _arg_1;
            }, "farm9.y");
            result[19] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 249);
            }, function (_arg_1:Number):void
            {
                farm10.x = _arg_1;
            }, "farm10.x");
            result[20] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 104);
            }, function (_arg_1:Number):void
            {
                farm10.y = _arg_1;
            }, "farm10.y");
            result[21] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 196);
            }, function (_arg_1:Number):void
            {
                farm11.x = _arg_1;
            }, "farm11.x");
            result[22] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 137);
            }, function (_arg_1:Number):void
            {
                farm11.y = _arg_1;
            }, "farm11.y");
            result[23] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 142);
            }, function (_arg_1:Number):void
            {
                farm12.x = _arg_1;
            }, "farm12.x");
            result[24] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 168);
            }, function (_arg_1:Number):void
            {
                farm12.y = _arg_1;
            }, "farm12.y");
            result[25] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 360);
            }, function (_arg_1:Number):void
            {
                farm13.x = _arg_1;
            }, "farm13.x");
            result[26] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 108);
            }, function (_arg_1:Number):void
            {
                farm13.y = _arg_1;
            }, "farm13.y");
            result[27] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 305);
            }, function (_arg_1:Number):void
            {
                farm14.x = _arg_1;
            }, "farm14.x");
            result[28] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 140);
            }, function (_arg_1:Number):void
            {
                farm14.y = _arg_1;
            }, "farm14.y");
            result[29] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 252);
            }, function (_arg_1:Number):void
            {
                farm15.x = _arg_1;
            }, "farm15.x");
            result[30] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 173);
            }, function (_arg_1:Number):void
            {
                farm15.y = _arg_1;
            }, "farm15.y");
            result[31] = binding;
            binding = new Binding(this, function ():Number
            {
                return (91 + 198);
            }, function (_arg_1:Number):void
            {
                farm16.x = _arg_1;
            }, "farm16.x");
            result[32] = binding;
            binding = new Binding(this, function ():Number
            {
                return (140 + 203);
            }, function (_arg_1:Number):void
            {
                farm16.y = _arg_1;
            }, "farm16.y");
            result[33] = binding;
            binding = new Binding(this, function ():Object
            {
                return (moveCanva);
            }, function (_arg_1:Object):void
            {
                eff_mvoe.target = _arg_1;
            }, "eff_mvoe.target");
            result[34] = binding;
            return (result);
        }

        private function onValueCommit(_arg_1:Event):void
        {
            var _local_2:LinkTextArea = (_arg_1.target as LinkTextArea);
            _local_2.verticalScrollPosition = _local_2.maxVerticalScrollPosition;
        }

        public function set eff_mvoe(_arg_1:Move):void
        {
            var _local_2:Object = this._1022448295eff_mvoe;
            if (_local_2 !== _arg_1)
            {
                this._1022448295eff_mvoe = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eff_mvoe", _local_2, _arg_1));
            };
        }

        public function __palEff_effectEnd(_arg_1:EffectEvent):void
        {
            palEffectEnd();
        }

        [Bindable(event="propertyChange")]
        public function get farm1():FazendaFarm
        {
            return (this._97201851farm1);
        }

        [Bindable(event="propertyChange")]
        public function get farm2():FazendaFarm
        {
            return (this._97201852farm2);
        }

        [Bindable(event="propertyChange")]
        public function get charProCanv():FazendaPorTraitCanvas
        {
            return (this._1825424707charProCanv);
        }

        [Bindable(event="propertyChange")]
        public function get btnFazendaBag():Button
        {
            return (this._529048897btnFazendaBag);
        }

        [Bindable(event="propertyChange")]
        public function get farm6():FazendaFarm
        {
            return (this._97201856farm6);
        }

        [Bindable(event="propertyChange")]
        public function get farm7():FazendaFarm
        {
            return (this._97201857farm7);
        }

        [Bindable(event="propertyChange")]
        public function get farm8():FazendaFarm
        {
            return (this._97201858farm8);
        }

        [Bindable(event="propertyChange")]
        public function get farm9():FazendaFarm
        {
            return (this._97201859farm9);
        }

        public function set btnPlantMine(_arg_1:Button):void
        {
            var _local_2:Object = this._1460358754btnPlantMine;
            if (_local_2 !== _arg_1)
            {
                this._1460358754btnPlantMine = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPlantMine", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get farm4():FazendaFarm
        {
            return (this._97201854farm4);
        }

        [Bindable(event="propertyChange")]
        public function get farm5():FazendaFarm
        {
            return (this._97201855farm5);
        }

        [Bindable(event="propertyChange")]
        public function get moveBtn():Button
        {
            return (this._1243540683moveBtn);
        }

        [Bindable(event="propertyChange")]
        public function get farm3():FazendaFarm
        {
            return (this._97201853farm3);
        }

        [Bindable(event="propertyChange")]
        public function get btnGetMine():Button
        {
            return (this._1264843059btnGetMine);
        }

        public function onAddFarmNum(_arg_1:int):void
        {
            _farmData.farmNum = _arg_1;
            updateView();
        }

        public function set friendCanv(_arg_1:FriendCanvas):void
        {
            var _local_2:Object = this._1757185436friendCanv;
            if (_local_2 !== _arg_1)
            {
                this._1757185436friendCanv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "friendCanv", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get farm10():FazendaFarm
        {
            return (this._1281709867farm10);
        }

        [Bindable(event="propertyChange")]
        public function get farm11():FazendaFarm
        {
            return (this._1281709866farm11);
        }

        [Bindable(event="propertyChange")]
        public function get farm12():FazendaFarm
        {
            return (this._1281709865farm12);
        }

        [Bindable(event="propertyChange")]
        public function get farm13():FazendaFarm
        {
            return (this._1281709864farm13);
        }

        [Bindable(event="propertyChange")]
        public function get farm14():FazendaFarm
        {
            return (this._1281709863farm14);
        }

        [Bindable(event="propertyChange")]
        public function get farm15():FazendaFarm
        {
            return (this._1281709862farm15);
        }

        [Bindable(event="propertyChange")]
        public function get farm16():FazendaFarm
        {
            return (this._1281709861farm16);
        }

        public function set btnFazendaSelf(_arg_1:Button):void
        {
            var _local_2:Object = this._779863925btnFazendaSelf;
            if (_local_2 !== _arg_1)
            {
                this._779863925btnFazendaSelf = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFazendaSelf", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:Number;
            super.visible = _arg_1;
            if (_arg_1)
            {
                if (_updateFlag)
                {
                    _ownerId = _core.player.id;
                    updateView();
                };
                _local_2 = new Date().getTime();
                if ((_local_2 - _lastTime) >= MIN_LIMIT_INTERVAL)
                {
                    _core.remote.getFarmByCid(_core.player.id);
                    _core.remote.getFriendFarm();
                    _lastTime = _local_2;
                };
            }
            else
            {
                _core.view.resoreMouse();
                CursorManager.removeAllCursors();
            };
        }

        private function _FazendaPanel_Fade1_i():Fade
        {
            var _local_1:Fade = new Fade();
            palEff_fade = _local_1;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 0;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get imgCanv():SimpleCanvas
        {
            return (this._1916398857imgCanv);
        }

        public function init():void
        {
            img_bg.source = ResManager.hash(GamePredef.RES_FARM_BG);
            log.addEventListener(FlexEvent.VALUE_COMMIT, onValueCommit);
            log.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            imgCanv.addEventListener(MouseEvent.CLICK, handleClick);
        }

        [Bindable(event="propertyChange")]
        public function get btnFazendaShop():Button
        {
            return (this._779866911btnFazendaShop);
        }

        public function reapAllMines():void
        {
            var _local_2:*;
            if (_ownerId != _core.player.id)
            {
                return;
            };
            _fids = [];
            var _local_1:int = 1;
            while (_local_1 <= 16)
            {
                _local_2 = this[("farm" + _local_1)].getMineState();
                if (_local_2 == GamePredef.MINE_GROW_UP)
                {
                    _fids.push(_local_1);
                };
                _local_1++;
            };
            if (_fids.length > 0)
            {
                _timer = new Timer(500, _fids.length);
                _timer.addEventListener(TimerEvent.TIMER, handleReapTimer);
                _timer.addEventListener(TimerEvent.TIMER_COMPLETE, handleReapComplete);
                _timer.start();
            };
        }

        public function set btnEvents(_arg_1:Button):void
        {
            var _local_2:Object = this._194320021btnEvents;
            if (_local_2 !== _arg_1)
            {
                this._194320021btnEvents = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnEvents", _local_2, _arg_1));
            };
        }

        private function openFazendaBag():void
        {
            _core.view.changeVisible(ViewManager.PANEL_FAZENDA_BAG);
        }

        public function palEffectEnd():void
        {
            imgEffect.visible = false;
        }

        public function updateView():void
        {
            var _local_2:Number;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            var _local_1:int = 1;
            while (_local_1 <= GamePredef.MAX_FARM_NUM)
            {
                this[("farm" + _local_1)].reset();
                if (_local_1 <= _farmData.farmNum)
                {
                    this[("farm" + _local_1)].setState(GamePredef.FARM_STATE_OPEN);
                    if (((_mineData) && (_mineData[_local_1])))
                    {
                        this[("farm" + _local_1)].setState(GamePredef.FARM_STATE_OPEN);
                    };
                }
                else
                {
                    if (_local_1 == (Number(_farmData.farmNum) + 1))
                    {
                        this[("farm" + _local_1)].setState(GamePredef.FARM_STATE_CAN_OPEN);
                    }
                    else
                    {
                        this[("farm" + _local_1)].setState(GamePredef.FARM_STATE_CLOSE);
                    };
                };
                if (((_mineData) && (_mineData[_local_1])))
                {
                    if (!_mineData[_local_1]["havestFlag"])
                    {
                        this[("farm" + _local_1)].setNum(_mineData[_local_1].num);
                        this[("farm" + _local_1)].setMid(_mineData[_local_1].id);
                        this[("farm" + _local_1)].setMineState(GamePredef.MINE_GROW_UP);
                    }
                    else
                    {
                        _local_2 = new Date().getTime();
                        if ((_local_2 + _core.timeLag) < _mineData[_local_1].time)
                        {
                            this[("farm" + _local_1)].setState(GamePredef.FARM_STATE_WAIT);
                        }
                        else
                        {
                            this[("farm" + _local_1)].onMineTimeOut();
                        };
                    };
                    this[("farm" + _local_1)].setTime(_mineData[_local_1].time);
                };
                this[("farm" + _local_1)].setOwnerId(_farmData.cid);
                this[("farm" + _local_1)].updateView();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCanva():Canvas
        {
            return (this._1042049322moveCanva);
        }

        public function set btnGetMineAll(_arg_1:Button):void
        {
            var _local_2:Object = this._1191416940btnGetMineAll;
            if (_local_2 !== _arg_1)
            {
                this._1191416940btnGetMineAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGetMineAll", _local_2, _arg_1));
            };
        }

        public function __moveBtn_click(_arg_1:MouseEvent):void
        {
            moveFriendCanva();
        }

        public function getFarmNum():int
        {
            return (_fazendaDataSelf.farm.farmNum);
        }

        private function mouseAction(_arg_1:MouseEvent, _arg_2:int):void
        {
            _arg_1.stopImmediatePropagation();
            _core.view.mouseState = _arg_2;
            CursorManager.setCursor(ResManager.MOUSE_ACTION_IMG[_arg_2]);
        }

        private function handleReapComplete(_arg_1:TimerEvent):void
        {
            _timer.removeEventListener(TimerEvent.TIMER, handleReapTimer);
            _timer = null;
        }

        public function __btnGetMineAll_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, GamePredef.ACTION_REAP_ALL);
        }

        public function ___FazendaPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function updateFazendaData(_arg_1:Object, _arg_2:Boolean):void
        {
            _updateFlag = false;
            if (_arg_1.farm.cid == _core.player.id)
            {
                if (!_arg_1.mine)
                {
                    _arg_1.mine = {};
                };
                _fazendaDataSelf = _arg_1;
            };
            _farmData = _arg_1.farm;
            _mineData = _arg_1.mine;
            _ownerId = _farmData.cid;
            var _local_3:Object = {};
            _local_3.exp = _farmData.exp;
            _local_3.name = _farmData.name;
            if (_ownerId == _core.player.id)
            {
                _local_3.level = _core.player.level;
                _local_3.movePnt = _core.player.movePnt;
                _local_3.maxMovePnt = _core.player.maxMovePnt;
                charProCanv.updateCharProp(_local_3);
                fridProCanv.visible = false;
                btnClean.enabled = true;
                btnPlantMine.enabled = true;
                btnFazendaShop.enabled = true;
                btnGetMineAll.enabled = true;
            }
            else
            {
                btnClean.enabled = false;
                btnPlantMine.enabled = false;
                btnFazendaShop.enabled = false;
                btnGetMineAll.enabled = false;
                if (_arg_1.icon)
                {
                    fridProCanv.updateCharHeadImage(_arg_1.icon);
                }
                else
                {
                    fridProCanv.hideHeadImage();
                };
                if (_arg_1.lv)
                {
                    _local_3.level = _arg_1.lv;
                }
                else
                {
                    _local_3.level = "--";
                };
                _local_3.movePnt = "--";
                _local_3.maxMovePnt = "--";
                fridProCanv.updateCharProp(_local_3);
                fridProCanv.visible = true;
                if (_arg_2)
                {
                    updateFriendFazenda(_arg_1);
                };
            };
            charProCanv.changeActpntAndMovePntVisible();
            updateView();
        }

        public function __btnPlantMine_click(_arg_1:MouseEvent):void
        {
            gotoPlantMine();
        }

        public function addFarmLog(_arg_1:String):void
        {
            _farmLog.push(_arg_1);
            log.htmlText = _farmLog.join();
        }

        public function reset():void
        {
            if (initialized)
            {
                friendCanv.reset();
                log.htmlText = "";
                fridProCanv.visible = false;
            };
            _farmLog.clear();
            _lastTime = 0;
            _updateFlag = true;
            _mineData = {};
            if (_farmData)
            {
                _farmData.farmNum = 2;
            };
        }

        private function moveEnd():void
        {
            if (moveCanva.x > 700)
            {
                friendCanv.visible = false;
            };
        }

        private function gotoPlantMine():void
        {
            _core.view.getUI(ViewManager.PANEL_FAZENDA_SHOP).visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get btnClean():Button
        {
            return (this._2082333005btnClean);
        }

        private function _FazendaPanel_Move2_i():Move
        {
            var _local_1:Move = new Move();
            palEff_move = _local_1;
            return (_local_1);
        }

        public function set palEff_move(_arg_1:Move):void
        {
            var _local_2:Object = this._128572838palEff_move;
            if (_local_2 !== _arg_1)
            {
                this._128572838palEff_move = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "palEff_move", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get log():LinkTextArea
        {
            return (this._107332log);
        }

        [Bindable(event="propertyChange")]
        public function get eff_mvoe():Move
        {
            return (this._1022448295eff_mvoe);
        }

        [Bindable(event="propertyChange")]
        public function get imgEffect():Image
        {
            return (this._820043980imgEffect);
        }

        [Bindable(event="propertyChange")]
        public function get palEff():Parallel
        {
            return (this._995633846palEff);
        }

        [Bindable(event="propertyChange")]
        public function get btnFazendaSelf():Button
        {
            return (this._779863925btnFazendaSelf);
        }

        public function updateMovePoint():void
        {
            if (initialized)
            {
                charProCanv.updateMovePoint();
            };
        }

        public function set farm2(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._97201852farm2;
            if (_local_2 !== _arg_1)
            {
                this._97201852farm2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm2", _local_2, _arg_1));
            };
        }

        private function handleReapTimer(_arg_1:TimerEvent):void
        {
            var _local_2:int = _fids.shift();
            _core.remote.harvestMine(_local_2);
            trace((" ==> 收获 农田_" + _local_2));
        }

        public function __btnGetMine_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, GamePredef.ACTION_REAP_MINE);
        }

        public function __btnEvents_click(_arg_1:MouseEvent):void
        {
            gotoLogPanel();
        }

        public function set farm6(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._97201856farm6;
            if (_local_2 !== _arg_1)
            {
                this._97201856farm6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm6", _local_2, _arg_1));
            };
        }

        public function set charProCanv(_arg_1:FazendaPorTraitCanvas):void
        {
            var _local_2:Object = this._1825424707charProCanv;
            if (_local_2 !== _arg_1)
            {
                this._1825424707charProCanv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charProCanv", _local_2, _arg_1));
            };
        }

        public function set farm7(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._97201857farm7;
            if (_local_2 !== _arg_1)
            {
                this._97201857farm7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm7", _local_2, _arg_1));
            };
        }

        public function set farm4(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._97201854farm4;
            if (_local_2 !== _arg_1)
            {
                this._97201854farm4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm4", _local_2, _arg_1));
            };
        }

        public function set farm1(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._97201851farm1;
            if (_local_2 !== _arg_1)
            {
                this._97201851farm1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm1", _local_2, _arg_1));
            };
        }

        public function set farm9(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._97201859farm9;
            if (_local_2 !== _arg_1)
            {
                this._97201859farm9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm9", _local_2, _arg_1));
            };
        }

        private function _FazendaPanel_Move1_i():Move
        {
            var _local_1:Move = new Move();
            eff_mvoe = _local_1;
            _local_1.duration = 600;
            _local_1.addEventListener("effectEnd", __eff_mvoe_effectEnd);
            BindingManager.executeBindings(this, "eff_mvoe", eff_mvoe);
            return (_local_1);
        }

        public function set farm8(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._97201858farm8;
            if (_local_2 !== _arg_1)
            {
                this._97201858farm8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm8", _local_2, _arg_1));
            };
        }

        public function set btnFazendaBag(_arg_1:Button):void
        {
            var _local_2:Object = this._529048897btnFazendaBag;
            if (_local_2 !== _arg_1)
            {
                this._529048897btnFazendaBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFazendaBag", _local_2, _arg_1));
            };
        }

        public function set farm3(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._97201853farm3;
            if (_local_2 !== _arg_1)
            {
                this._97201853farm3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnGetMineAll():Button
        {
            return (this._1191416940btnGetMineAll);
        }

        override public function initialize():void
        {
            var target:FazendaPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FazendaPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_FazendaPanelWatcherSetupUtil");
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

        public function set btnGetMine(_arg_1:Button):void
        {
            var _local_2:Object = this._1264843059btnGetMine;
            if (_local_2 !== _arg_1)
            {
                this._1264843059btnGetMine = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGetMine", _local_2, _arg_1));
            };
        }

        private function enterSelfFazenda():void
        {
            fridProCanv.visible = false;
            updateFazendaData(_fazendaDataSelf, false);
        }

        private function gotoLogPanel():void
        {
            _core.view.getUI(ViewManager.POP_FAZENDA_LOG).show();
        }

        public function onDelMineral(_arg_1:int):void
        {
            var _local_2:*;
            this[("farm" + _arg_1)].resetMine();
            for (_local_2 in _mineData)
            {
                if (_local_2 == _arg_1)
                {
                    delete _mineData[_local_2];
                    break;
                };
            };
        }

        public function onSteelMine(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:*;
            friendCanv.onSteelMine(_arg_1, _arg_2, _arg_3);
            if (_arg_2 == _ownerId)
            {
                this[("farm" + _arg_1)].onSteelMine(_arg_3);
                for (_local_4 in _mineData)
                {
                    if (_local_4 == _arg_1)
                    {
                        _mineData[_local_4].num = this[("farm" + _arg_1)]["_num"];
                        break;
                    };
                };
            };
        }

        public function set farm10(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._1281709867farm10;
            if (_local_2 !== _arg_1)
            {
                this._1281709867farm10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm10", _local_2, _arg_1));
            };
        }

        public function set farm5(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._97201855farm5;
            if (_local_2 !== _arg_1)
            {
                this._97201855farm5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm5", _local_2, _arg_1));
            };
        }

        public function set btnFazendaPet(_arg_1:Button):void
        {
            var _local_2:Object = this._529035306btnFazendaPet;
            if (_local_2 !== _arg_1)
            {
                this._529035306btnFazendaPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFazendaPet", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get palEff_move():Move
        {
            return (this._128572838palEff_move);
        }

        public function set farm12(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._1281709865farm12;
            if (_local_2 !== _arg_1)
            {
                this._1281709865farm12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm12", _local_2, _arg_1));
            };
        }

        public function set farm13(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._1281709864farm13;
            if (_local_2 !== _arg_1)
            {
                this._1281709864farm13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm13", _local_2, _arg_1));
            };
        }

        public function set farm14(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._1281709863farm14;
            if (_local_2 !== _arg_1)
            {
                this._1281709863farm14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm14", _local_2, _arg_1));
            };
        }

        public function set farm11(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._1281709866farm11;
            if (_local_2 !== _arg_1)
            {
                this._1281709866farm11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm11", _local_2, _arg_1));
            };
        }

        public function set farm15(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._1281709862farm15;
            if (_local_2 !== _arg_1)
            {
                this._1281709862farm15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm15", _local_2, _arg_1));
            };
        }

        public function set farm16(_arg_1:FazendaFarm):void
        {
            var _local_2:Object = this._1281709861farm16;
            if (_local_2 !== _arg_1)
            {
                this._1281709861farm16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "farm16", _local_2, _arg_1));
            };
        }

        public function set moveBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1243540683moveBtn;
            if (_local_2 !== _arg_1)
            {
                this._1243540683moveBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveBtn", _local_2, _arg_1));
            };
        }

        private function updateFriendFazenda(_arg_1:Object):void
        {
            friendCanv.updateSingleFriendData(_arg_1);
        }

        private function _FazendaPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAZENDAPANEL_U[0];
            _local_1 = Language.FAZENDAPANEL_S[21];
            _local_1 = (91 + 192);
            _local_1 = (140 + 0);
            _local_1 = (91 + 135);
            _local_1 = (140 + 32);
            _local_1 = (91 + 82);
            _local_1 = (140 + 65);
            _local_1 = (91 + 30);
            _local_1 = (140 + 96);
            _local_1 = (91 + 247);
            _local_1 = (140 + 36);
            _local_1 = (91 + 192);
            _local_1 = (140 + 68);
            _local_1 = (91 + 139);
            _local_1 = (140 + 101);
            _local_1 = (91 + 85);
            _local_1 = (140 + 131);
            _local_1 = (91 + 304);
            _local_1 = (140 + 72);
            _local_1 = (91 + 249);
            _local_1 = (140 + 104);
            _local_1 = (91 + 196);
            _local_1 = (140 + 137);
            _local_1 = (91 + 142);
            _local_1 = (140 + 168);
            _local_1 = (91 + 360);
            _local_1 = (140 + 108);
            _local_1 = (91 + 305);
            _local_1 = (140 + 140);
            _local_1 = (91 + 252);
            _local_1 = (140 + 173);
            _local_1 = (91 + 198);
            _local_1 = (140 + 203);
            _local_1 = moveCanva;
        }

        public function canBuildFarm():Boolean
        {
            var _local_1:int = _core.getFazendaLevelByExp(_fazendaDataSelf.farm.exp);
            if (_fazendaDataSelf.farm.farmNum >= GamePredef.FARM_LVUP_CONFIG[_local_1].maxFarm)
            {
                return (false);
            };
            return (true);
        }

        override public function initView():void
        {
            updateView();
        }

        [Bindable(event="propertyChange")]
        public function get btnFazendaPet():Button
        {
            return (this._529035306btnFazendaPet);
        }

        private function moveFriendCanva():void
        {
            eff_mvoe.end();
            if (moveCanva.x > 700)
            {
                friendCanv.visible = true;
                moveBtn.styleName = "fazendaFrientsHide";
                eff_mvoe.xTo = (moveCanva.x - (moveCanva.width - 10));
            }
            else
            {
                moveBtn.styleName = "fazendaFrientsShow";
                eff_mvoe.xTo = (moveCanva.x + (moveCanva.width - 10));
            };
            eff_mvoe.play();
        }

        public function onHarvestMine(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            if (_ownerId == _core.player.id)
            {
                this[("farm" + _arg_1.fid)].playerAction();
                for (_local_2 in _mineData)
                {
                    if (_local_2 == _arg_1.fid)
                    {
                        this[("farm" + _arg_1.fid)].setHavestFlag(true);
                        _mineData[_local_2].havestFlag = true;
                        _fazendaDataSelf.mine[_local_2].havestFlag = true;
                        _mineData[_local_2].time = _arg_1.coldTime;
                        _fazendaDataSelf.mine[_local_2].time = _arg_1.coldTime;
                        break;
                    };
                };
                this[("farm" + _arg_1.fid)].setState(GamePredef.FARM_STATE_WAIT);
                this[("farm" + _arg_1.fid)]._time = _arg_1.coldTime;
                this[("farm" + _arg_1.fid)].updateView();
            }
            else
            {
                for (_local_3 in _fazendaDataSelf.mine)
                {
                    if (_local_3 == _arg_1.fid)
                    {
                        delete _fazendaDataSelf.mine[_local_3];
                        break;
                    };
                };
            };
        }

        public function __btnFazendaPet_click(_arg_1:MouseEvent):void
        {
            openPetFightPanel();
        }


    }
}//package com.qeedoo.ui.view.compDragable

