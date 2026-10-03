// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.MiniMapCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Button;
    import mx.containers.Canvas;
    import mx.effects.Glow;
    import com.qeedoo.game.object.Player;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Alert;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import com.qeedoo.game.config.Language;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.compDragable.MoneyItemPanel;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.utils.TimeUtil;
    import flash.events.Event;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.binding.Binding;
    import mx.managers.PopUpManager;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
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

    public class MiniMapCanvas extends SimpleCanvas implements IMainUI, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _897323049liveTrials:Label;
        private var _2119526485btn_petArena:BasicGlowButton;
        private var _1714155007btn_changeVisible:Button;
        private var _819791178timeTrials:Label;
        private var _705624208quitTrialsBtn:Button;
        private var _1074097225funCanvas:Canvas;
        private var _serverTime:Number;
        private var _124012844btnChange:Button;
        private var _102401118cav_mini:Canvas;
        internal var startTime:Number;
        private var _oldTime:int = 0;
        private var _207684226glowEffect:Glow;
        private var _1722718208_player:Player;
        private var _385483463btn_battle_copy:Button;
        private var _1271381783flyBtn:BasicGlowButton;
        private var _2108195583btn_life:BasicGlowButton;
        private var _784675189serverClock:Button;
        private var _leftTime:Number = 0;
        private var _469618999delayCanv:Canvas;
        private var _1378827387btnMsg:Button;
        public var _MiniMapCanvas_Button2:Button;
        public var _MiniMapCanvas_Button3:Button;
        private var _206155944btnRank:Button;
        private var _1292664926btn_fazenda:BasicGlowButton;
        private var _584079194btn_exchange:BasicGlowButton;
        private var _531048948btn_product:BasicGlowButton;
        private var INST_MAP_ID:int = 1999999;
        private var _570537338LB_delay:TextArea;
        private var _206557372btn_pet:BasicGlowButton;
        private var _658804109quitBtn:Button;
        private var _1791483012titleLabel:RoundedLabel;
        private var _94069079btnPK:Button;
        private var _trialsAlert:Alert;
        private var teaAble:Boolean = false;
        private var _54214913randomBattleBtn:BasicGlowButton;
        private var _867914997btn_autoExp:BasicGlowButton;
        private var _616749141btn_sys_shop:Button;
        private var _1541853189btn_battle:BasicGlowButton;
        private var _103868960miMap:Button;
        private var _205984880btnLine:Button;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":220,
                    "height":347,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":161,
                                "height":24,
                                "styleName":"MiniMapTitle",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"titleLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "y":4
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"delayCanv",
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "width":161,
                                "height":26,
                                "styleName":"MiniMapTitle",
                                "y":24,
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":TextArea,
                                    "id":"LB_delay",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":161,
                                            "mouseEnabled":false,
                                            "editable":false,
                                            "height":24,
                                            "y":5
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cav_mini",
                        "stylesFactory":function ():void
                        {
                            this.right = "57";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":53,
                                "width":126.9,
                                "height":72,
                                "styleName":"CanvasSystemShopBack",
                                "clipContent":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"miMap",
                                    "events":{"click":"__miMap_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":38.6,
                                            "y":38.5,
                                            "styleName":"BtnMap"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_MiniMapCanvas_Button2",
                                    "events":{"click":"___MiniMapCanvas_Button2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":89.4,
                                            "y":2,
                                            "styleName":"BtnSys"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_MiniMapCanvas_Button3",
                                    "events":{"click":"___MiniMapCanvas_Button3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76.8,
                                            "y":39.5,
                                            "styleName":"BtnHelp"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnPK",
                                    "events":{"click":"__btnPK_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":57.7,
                                            "y":10,
                                            "styleName":"BtnPK"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnRank",
                                    "events":{"click":"__btnRank_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27,
                                            "y":2,
                                            "styleName":"BtnRank"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnMsg",
                                    "events":{"click":"__btnMsg_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":21,
                                            "styleName":"BtnMsg"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":62,
                                "height":72,
                                "styleName":"CanvasSystemShopBack2",
                                "clipContent":false,
                                "y":53,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn_sys_shop",
                                    "events":{"click":"__btn_sys_shop_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":4,
                                            "y":10,
                                            "styleName":"BtnSystemShop"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn_changeVisible",
                        "events":{"click":"__btn_changeVisible_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"MiniCanvaHideBtn",
                                "x":148,
                                "y":78,
                                "width":12.9,
                                "height":27.9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"serverClock",
                        "events":{"mouseOver":"__serverClock_mouseOver"},
                        "stylesFactory":function ():void
                        {
                            this.right = "161";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnServerClock",
                                "y":24
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnLine",
                        "events":{"click":"__btnLine_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "161";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnChangeLine",
                                "width":26,
                                "height":24,
                                "y":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"funCanvas",
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":135,
                                "width":85,
                                "height":262,
                                "styleName":"RightButtonBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_exchange",
                                    "events":{"click":"__btn_exchange_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                        this.paddingTop = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":6,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_product",
                                    "events":{"click":"__btn_product_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":34,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_pet",
                                    "events":{"click":"__btn_pet_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":62,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_life",
                                    "events":{"click":"__btn_life_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":90,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_battle",
                                    "events":{"click":"__btn_battle_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":118,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_autoExp",
                                    "events":{"click":"__btn_autoExp_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":146,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_fazenda",
                                    "events":{"click":"__btn_fazenda_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":174,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_petArena",
                                    "events":{"click":"__btn_petArena_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":202,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"flyBtn",
                                    "events":{"click":"__flyBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":230,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnChange",
                        "events":{"click":"__btnChange_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":124,
                                "y":260,
                                "width":12,
                                "height":25,
                                "styleName":"BtnHideButtons",
                                "visible":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"quitBtn",
                        "events":{"click":"__quitBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":150,
                                "y":423,
                                "styleName":"BtnWbQuit",
                                "height":50,
                                "width":50,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"quitTrialsBtn",
                        "events":{"click":"__quitTrialsBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":150,
                                "y":423,
                                "styleName":"BtnWbQuit",
                                "height":50,
                                "width":50,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"timeTrials",
                        "stylesFactory":function ():void
                        {
                            this.fontWeight = "bold";
                            this.color = 0xFFFFFF;
                            this.fontSize = 15;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":423,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"liveTrials",
                        "stylesFactory":function ():void
                        {
                            this.fontWeight = "bold";
                            this.color = 0xFFFFFF;
                            this.fontSize = 15;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":443,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"randomBattleBtn",
                        "events":{"click":"__randomBattleBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":150,
                                "y":423,
                                "width":60,
                                "styleName":"BtnStdRed",
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn_battle_copy",
                        "events":{"click":"__btn_battle_copy_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":93,
                                "y":440,
                                "styleName":"BtnStdRed",
                                "visible":false
                            });
                        }
                    })]
                });
            }
        });
        private var _vm:ViewManager = ViewManager.getInstance();
        private var _90794110_core:Core = Core.getInstance();
        private var _trialsTimer:Timer = new Timer(1000);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MiniMapCanvas()
        {
            mx_internal::_document = this;
            this.width = 220;
            this.height = 347;
            this.cacheAsBitmap = true;
            this.x = 139.35;
            this.y = 261;
            _MiniMapCanvas_Glow1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MiniMapCanvas._watcherSetupUtil = _arg_1;
        }


        public function set btn_changeVisible(_arg_1:Button):void
        {
            var _local_2:Object = this._1714155007btn_changeVisible;
            if (_local_2 !== _arg_1)
            {
                this._1714155007btn_changeVisible = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_changeVisible", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_product():BasicGlowButton
        {
            return (this._531048948btn_product);
        }

        public function set btn_life(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2108195583btn_life;
            if (_local_2 !== _arg_1)
            {
                this._2108195583btn_life = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_life", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _player():Player
        {
            return (this._1722718208_player);
        }

        public function onTrialsTimerAward(_arg_1:Object):void
        {
            if (((quitTrialsBtn) && (quitTrialsBtn.visible)))
            {
                setTrialsInfoVisible(_arg_1.num, _arg_1.life, true);
            };
        }

        public function set btn_autoExp(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._867914997btn_autoExp;
            if (_local_2 !== _arg_1)
            {
                this._867914997btn_autoExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_autoExp", _local_2, _arg_1));
            };
        }

        public function __quitTrialsBtn_click(_arg_1:MouseEvent):void
        {
            quitTrials();
        }

        public function trialsTimerStart(_arg_1:Number):void
        {
            if (_trialsTimer.running)
            {
                _trialsTimer.stop();
                _trialsTimer.removeEventListener(TimerEvent.TIMER, _trialsTimerStart);
            };
            if (_arg_1 > 0)
            {
                _leftTime = _arg_1;
                _trialsTimer.addEventListener(TimerEvent.TIMER, _trialsTimerStart);
                _trialsTimer.start();
            };
        }

        public function set btn_product(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._531048948btn_product;
            if (_local_2 !== _arg_1)
            {
                this._531048948btn_product = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_product", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get miMap():Button
        {
            return (this._103868960miMap);
        }

        private function showFazendaPanel():void
        {
            if (_core.player.level < 20)
            {
                Alert.show(Language.FAZENDAPANEL_S[11]);
            }
            else
            {
                _core.view.changeVisible(ViewManager.PANEL_FAZENDA);
                _core.nextGuide(ViewManager.PANEL_FAZENDA, "", -1);
            };
            glowEffect.end();
            btn_fazenda.filters = [];
        }

        public function ___MiniMapCanvas_Button2_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_SYSTEM);
        }

        public function __btn_battle_click(_arg_1:MouseEvent):void
        {
            showBattle();
        }

        private function changePKStateNormal():void
        {
            btnPK.selected = (!(btnPK.selected));
            setPKTooltip();
            _core.updateSettingNow("apvp", (!(btnPK.selected)));
        }

        public function __btn_life_click(_arg_1:MouseEvent):void
        {
            showLife();
        }

        [Bindable(event="propertyChange")]
        public function get liveTrials():Label
        {
            return (this._897323049liveTrials);
        }

        private function showBattle():void
        {
            _core.view.changeVisible(ViewManager.PANEL_BATTLESET);
            _core.view.getUI(ViewManager.PANEL_BATTLESET).updateView();
        }

        private function set _player(_arg_1:Player):void
        {
            var _local_2:Object = this._1722718208_player;
            if (_local_2 !== _arg_1)
            {
                this._1722718208_player = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_player", _local_2, _arg_1));
            };
        }

        public function set randomBattleBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._54214913randomBattleBtn;
            if (_local_2 !== _arg_1)
            {
                this._54214913randomBattleBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "randomBattleBtn", _local_2, _arg_1));
            };
        }

        public function __btnMsg_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_GAMEINTRO);
        }

        public function set miMap(_arg_1:Button):void
        {
            var _local_2:Object = this._103868960miMap;
            if (_local_2 !== _arg_1)
            {
                this._103868960miMap = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "miMap", _local_2, _arg_1));
            };
        }

        public function clear():void
        {
        }

        public function set liveTrials(_arg_1:Label):void
        {
            var _local_2:Object = this._897323049liveTrials;
            if (_local_2 !== _arg_1)
            {
                this._897323049liveTrials = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "liveTrials", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cav_mini():Canvas
        {
            return (this._102401118cav_mini);
        }

        public function set btnChange(_arg_1:Button):void
        {
            var _local_2:Object = this._124012844btnChange;
            if (_local_2 !== _arg_1)
            {
                this._124012844btnChange = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnChange", _local_2, _arg_1));
            };
        }

        public function __btn_pet_click(_arg_1:MouseEvent):void
        {
            showPet();
        }

        private function showMove():void
        {
            var _local_1:ArrayCollection = new ArrayCollection();
            var _local_2:Object = new Object();
            _local_2.itemData = {
                "type":29,
                "id":1036
            };
            _local_2.tips = Language.MINIMAPCANVAS_S[13];
            _local_1.addItem(_local_2);
            var _local_3:Object = new Object();
            _local_3.itemData = {
                "type":29,
                "id":1033
            };
            _local_3.tips = Language.MINIMAPCANVAS_S[14];
            _local_1.addItem(_local_3);
            var _local_4:Object = new Object();
            _local_4.itemData = {
                "type":29,
                "id":1034
            };
            _local_4.tips = Language.MINIMAPCANVAS_S[15];
            _local_1.addItem(_local_4);
            var _local_5:MoneyItemPanel = MoneyItemPanel(_core.view.getUI(ViewManager.POPU_MONEYITEM));
            _local_5.title = Language.MINIMAPCANVAS_S[16];
            _local_5.arr = _local_1;
            _local_5.show();
        }

        [Bindable(event="propertyChange")]
        public function get btnLine():Button
        {
            return (this._205984880btnLine);
        }

        public function set btn_battle_copy(_arg_1:Button):void
        {
            var _local_2:Object = this._385483463btn_battle_copy;
            if (_local_2 !== _arg_1)
            {
                this._385483463btn_battle_copy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_battle_copy", _local_2, _arg_1));
            };
        }

        public function setMsgStyleBig():void
        {
            btnMsg.styleName = "BtnMsg";
            btnMsg.height = 72;
            btnMsg.width = 75;
            btnMsg.x = -16;
            btnMsg.y = -13;
        }

        public function __quitBtn_click(_arg_1:MouseEvent):void
        {
            quitWb();
        }

        public function changeFlyingButton():void
        {
            if (!_player)
            {
                return;
            };
            if (((_player.flyingState == GamePredef.FLYING_STATE_ON_GROUND) || (_player.flyingState == GamePredef.FLYING_STATE_LANDING)))
            {
                flyBtn.label = Language.MINIMAPCANVAS_U[7];
            }
            else
            {
                flyBtn.label = Language.MINIMAPCANVAS_U[8];
            };
        }

        private function getLocationInfo(_arg_1:int, _arg_2:int):String
        {
            if (_core.lineInfo)
            {
                return ((((((Number((_core.lineInfo.id + 1)) + Language.MINIMAPCANVAS_S[5]) + _core.data.gameData[GamePredef.TBL_MAP][_player.posMapId].name) + " ") + _arg_1) + ",") + _arg_2);
            };
            return ((((_core.data.gameData[GamePredef.TBL_MAP][_player.posMapId].name + " ") + _arg_1) + ",") + _arg_2);
        }

        [Bindable(event="propertyChange")]
        private function get _core():Core
        {
            return (this._90794110_core);
        }

        private function _trialsTimerStart(_arg_1:Event):void
        {
            if (_leftTime < 0)
            {
                _trialsTimer.stop();
                _trialsTimer.removeEventListener(TimerEvent.TIMER, _trialsTimerStart);
                setTrialsInfoVisible(0, -1, false);
            };
            timeTrials.text = Language.MINIMAPCANVAS_S[41].replace("{num}", TimeUtil.secToTime(_leftTime));
            _leftTime--;
        }

        public function __serverClock_mouseOver(_arg_1:MouseEvent):void
        {
            updateTooltip();
        }

        [Bindable(event="propertyChange")]
        public function get serverClock():Button
        {
            return (this._784675189serverClock);
        }

        public function __btn_exchange_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_EXCHANGE);
        }

        public function __flyBtn_click(_arg_1:MouseEvent):void
        {
            changeFlyingState();
        }

        public function set timeTrials(_arg_1:Label):void
        {
            var _local_2:Object = this._819791178timeTrials;
            if (_local_2 !== _arg_1)
            {
                this._819791178timeTrials = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeTrials", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_exchange():BasicGlowButton
        {
            return (this._584079194btn_exchange);
        }

        public function set btnPK(_arg_1:Button):void
        {
            var _local_2:Object = this._94069079btnPK;
            if (_local_2 !== _arg_1)
            {
                this._94069079btnPK = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPK", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnRank():Button
        {
            return (this._206155944btnRank);
        }

        [Bindable(event="propertyChange")]
        public function get btn_pet():BasicGlowButton
        {
            return (this._206557372btn_pet);
        }

        public function enablePK():void
        {
            btnPK.enabled = true;
            btnPK.selected = (!(getPVPState()));
            setPKTooltip();
        }

        public function __btnPK_click(_arg_1:MouseEvent):void
        {
            changePKState();
        }

        public function set cav_mini(_arg_1:Canvas):void
        {
            var _local_2:Object = this._102401118cav_mini;
            if (_local_2 !== _arg_1)
            {
                this._102401118cav_mini = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav_mini", _local_2, _arg_1));
            };
        }

        public function setMsgStyleNormal():void
        {
            btnMsg.styleName = "BtnMsg2";
            btnMsg.height = 32;
            btnMsg.width = 33;
            btnMsg.x = 7;
            btnMsg.y = 9;
        }

        public function update():void
        {
        }

        public function __btn_fazenda_click(_arg_1:MouseEvent):void
        {
            showFazendaPanel();
        }

        public function __btnChange_click(_arg_1:MouseEvent):void
        {
            change_canFun();
        }

        public function __miMap_click(_arg_1:MouseEvent):void
        {
            onMapCli(_arg_1);
        }

        public function set btnLine(_arg_1:Button):void
        {
            var _local_2:Object = this._205984880btnLine;
            if (_local_2 !== _arg_1)
            {
                this._205984880btnLine = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLine", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get delayCanv():Canvas
        {
            return (this._469618999delayCanv);
        }

        private function showPet():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_PETFUNC);
            if (!_local_1.visible)
            {
                _local_1.show();
            }
            else
            {
                _local_1.hide();
            };
        }

        public function disablePK():void
        {
            btnPK.selected = false;
            btnPK.enabled = false;
            setPKTooltip();
        }

        public function set quitTrialsBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._705624208quitTrialsBtn;
            if (_local_2 !== _arg_1)
            {
                this._705624208quitTrialsBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "quitTrialsBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get flyBtn():BasicGlowButton
        {
            return (this._1271381783flyBtn);
        }

        public function __randomBattleBtn_click(_arg_1:MouseEvent):void
        {
            randomBattle();
        }

        private function _MiniMapCanvas_Glow1_i():Glow
        {
            var _local_1:Glow = new Glow();
            glowEffect = _local_1;
            _local_1.repeatCount = 10000;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 1;
            _local_1.blurXFrom = 0;
            _local_1.blurXTo = 10;
            _local_1.blurYFrom = 0;
            _local_1.blurYTo = 10;
            _local_1.color = 16135947;
            return (_local_1);
        }

        private function showBuff():void
        {
            var _local_1:ArrayCollection = new ArrayCollection();
            var _local_2:Object = new Object();
            _local_2.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":375
            };
            _local_2.tips = Language.MINIMAPCANVAS_S[6];
            _local_1.addItem(_local_2);
            var _local_3:Object = new Object();
            _local_3.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":379
            };
            _local_3.tips = Language.MINIMAPCANVAS_S[7];
            _local_1.addItem(_local_3);
            var _local_4:Object = new Object();
            _local_4.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":384
            };
            _local_4.tips = Language.MINIMAPCANVAS_S[8];
            _local_1.addItem(_local_4);
            var _local_5:Object = new Object();
            _local_5.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":383
            };
            _local_5.tips = Language.MINIMAPCANVAS_S[9];
            _local_1.addItem(_local_5);
            var _local_6:Object = new Object();
            _local_6.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":382
            };
            _local_6.tips = Language.MINIMAPCANVAS_S[10];
            _local_1.addItem(_local_6);
            var _local_7:MoneyItemPanel = MoneyItemPanel(_core.view.getUI(ViewManager.POPU_MONEYITEM));
            if (((_local_7.visible) && (_local_7.title == Language.MINIMAPCANVAS_S[11])))
            {
                _local_7.hide();
            }
            else
            {
                _local_7.title = Language.MINIMAPCANVAS_S[12];
                _local_7.arr = _local_1;
                _local_7.show();
            };
        }

        private function onMapCli(_arg_1:MouseEvent):void
        {
            if (_arg_1.ctrlKey)
            {
                _core.view.changeVisible(ViewManager.POPU_WORLDMAP);
            }
            else
            {
                _vm.changeVisible(ViewManager.PANEL_MAP);
            };
        }

        public function set LB_delay(_arg_1:TextArea):void
        {
            var _local_2:Object = this._570537338LB_delay;
            if (_local_2 !== _arg_1)
            {
                this._570537338LB_delay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "LB_delay", _local_2, _arg_1));
            };
        }

        private function updateTooltip():void
        {
            var _local_1:Date = new Date();
            var _local_2:String = TimeUtil.dateFormatter.format(_local_1);
            _local_1.setTime(((new Date().getTime() + _core.timeLag) + TimeUtil.timeOSOffSet));
            var _local_3:String = TimeUtil.dateFormatter.format(_local_1);
            var _local_4:String = Language.MINIMAPCANVAS_S[40].toString().replace("{ltime}", _local_2).replace("{stime}", _local_3);
            serverClock.toolTip = _local_4;
        }

        private function getPVPState():Boolean
        {
            return (GamePredef.GLOBAL_SETTING.apvp);
        }

        public function change_canFun():*
        {
            if (funCanvas.visible)
            {
                funCanvas.visible = false;
                btnChange.x = 208;
                btnChange.styleName = "BtnShowButtons";
            }
            else
            {
                funCanvas.visible = true;
                btnChange.x = 124;
                btnChange.styleName = "BtnHideButtons";
            };
        }

        [Bindable(event="propertyChange")]
        public function get randomBattleBtn():BasicGlowButton
        {
            return (this._54214913randomBattleBtn);
        }

        [Bindable(event="propertyChange")]
        public function get btn_life():BasicGlowButton
        {
            return (this._2108195583btn_life);
        }

        public function set btnMsg(_arg_1:Button):void
        {
            var _local_2:Object = this._1378827387btnMsg;
            if (_local_2 !== _arg_1)
            {
                this._1378827387btnMsg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnMsg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_autoExp():BasicGlowButton
        {
            return (this._867914997btn_autoExp);
        }

        private function checkNetDelay():void
        {
            if (_core.remote.nc.connected)
            {
                startTime = new Date().getTime();
                _core.remote.call("checkNetDelay", new Responder(onCheckNetDelay));
            };
        }

        private function selectLine(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.view.changeVisible(ViewManager.MAIN_LINE);
            };
        }

        private function _MiniMapCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = getLocationInfo((_player.posX / 10), (_player.posY / 10));
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = ((_core.by_session != "renren") ? Language.MINIMAPCANVAS_S[25] : Language.MINIMAPCANVAS_S[30]);
            _local_1 = Language.MINIMAPCANVAS_S[26];
            _local_1 = Language.MINIMAPCANVAS_S[27];
            _local_1 = Language.MINIMAPCANVAS_S[29];
            _local_1 = Language.MINIMAPCANVAS_S[37];
            _local_1 = Language.MINIMAPCANVAS_S[28];
            _local_1 = Language.MINIMAPCANVAS_S[24];
            _local_1 = Language.MINIMAPCANVAS_U[1];
            _local_1 = Language.MINIMAPCANVAS_U[0];
            _local_1 = Language.MINIMAPCANVAS_U[2];
            _local_1 = Language.MINIMAPCANVAS_U[10];
            _local_1 = Language.MINIMAPCANVAS_U[3];
            _local_1 = Language.MINIMAPCANVAS_U[5];
            _local_1 = Language.MINIMAPCANVAS_U[16];
            _local_1 = Language.MINIMAPCANVAS_U[30];
            _local_1 = Language.MINIMAPCANVAS_U[7];
            _local_1 = Language.MINIMAPCANVAS_U[17];
            _local_1 = Language.MINIMAPCANVAS_U[20];
            _local_1 = Language.MINIMAPCANVAS_U[18];
        }

        public function set serverClock(_arg_1:Button):void
        {
            var _local_2:Object = this._784675189serverClock;
            if (_local_2 !== _arg_1)
            {
                this._784675189serverClock = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "serverClock", _local_2, _arg_1));
            };
        }

        public function set glowEffect(_arg_1:Glow):void
        {
            var _local_2:Object = this._207684226glowEffect;
            if (_local_2 !== _arg_1)
            {
                this._207684226glowEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local_2, _arg_1));
            };
        }

        public function __btnLine_click(_arg_1:MouseEvent):void
        {
            switchLine();
        }

        public function set quitBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._658804109quitBtn;
            if (_local_2 !== _arg_1)
            {
                this._658804109quitBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "quitBtn", _local_2, _arg_1));
            };
        }

        public function __btn_battle_copy_click(_arg_1:MouseEvent):void
        {
            showBattle();
        }

        public function set titleLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1791483012titleLabel;
            if (_local_2 !== _arg_1)
            {
                this._1791483012titleLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleLabel", _local_2, _arg_1));
            };
        }

        private function set _core(_arg_1:Core):void
        {
            var _local_2:Object = this._90794110_core;
            if (_local_2 !== _arg_1)
            {
                this._90794110_core = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_core", _local_2, _arg_1));
            };
        }

        private function _MiniMapCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = getLocationInfo((_player.posX / 10), (_player.posY / 10));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                titleLabel.text = _arg_1;
            }, "titleLabel.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                LB_delay.filters = _arg_1;
            }, "LB_delay.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((_core.by_session != "renren") ? Language.MINIMAPCANVAS_S[25] : Language.MINIMAPCANVAS_S[30]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                miMap.toolTip = _arg_1;
            }, "miMap.toolTip");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MiniMapCanvas_Button2.toolTip = _arg_1;
            }, "_MiniMapCanvas_Button2.toolTip");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_S[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MiniMapCanvas_Button3.toolTip = _arg_1;
            }, "_MiniMapCanvas_Button3.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_S[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPK.toolTip = _arg_1;
            }, "btnPK.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_S[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnRank.toolTip = _arg_1;
            }, "btnRank.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnMsg.toolTip = _arg_1;
            }, "btnMsg.toolTip");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_sys_shop.toolTip = _arg_1;
            }, "btn_sys_shop.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_exchange.label = _arg_1;
            }, "btn_exchange.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_product.label = _arg_1;
            }, "btn_product.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_pet.label = _arg_1;
            }, "btn_pet.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_life.label = _arg_1;
            }, "btn_life.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_battle.label = _arg_1;
            }, "btn_battle.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_autoExp.label = _arg_1;
            }, "btn_autoExp.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_fazenda.label = _arg_1;
            }, "btn_fazenda.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_petArena.label = _arg_1;
            }, "btn_petArena.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                flyBtn.label = _arg_1;
            }, "flyBtn.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                flyBtn.toolTip = _arg_1;
            }, "flyBtn.toolTip");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                randomBattleBtn.label = _arg_1;
            }, "randomBattleBtn.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_battle_copy.label = _arg_1;
            }, "btn_battle_copy.label");
            result[20] = binding;
            return (result);
        }

        private function showProduct():void
        {
            if (!_core.productFlag)
            {
                return;
            };
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_EQUIPTFUNC);
            if (((_local_1.isFirst.indexOf(_core.player.id) <= 0) || (!(_local_1.lastLineId == _core.lineInfo.id))))
            {
                _core.remote.call("checkEquipEdit", null, 1);
                _core.remote.call("checkEquipEdit", null, 3);
                _local_1.lastLineId = _core.lineInfo.id;
                if (_local_1.isFirst.indexOf(_core.player.id) <= 0)
                {
                    _local_1.isFirst = ((_local_1.isFirst + _core.player.id) + "|");
                };
            };
            if (!_local_1.visible)
            {
                _local_1.show();
                _local_1.unselectAutoBuy();
            }
            else
            {
                _local_1.hide();
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_battle_copy():Button
        {
            return (this._385483463btn_battle_copy);
        }

        public function showFuncBtn(_arg_1:Boolean):void
        {
            this.funCanvas.visible = _arg_1;
        }

        private function changeMiniCanvaVisible():void
        {
            cav_mini.visible = (!(cav_mini.visible));
            if (cav_mini.visible)
            {
                btn_changeVisible.styleName = "MiniCanvaHideBtn";
            }
            else
            {
                btn_changeVisible.styleName = "MiniCanvaShowBtn";
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnChange():Button
        {
            return (this._124012844btnChange);
        }

        private function showPetArena():void
        {
            var _local_1:Object;
            if (((_core.player) && (_core.player.level >= 35)))
            {
                _local_1 = _core.view.getUI(ViewManager.PANEL_PET_ARENA);
                if (((_local_1.initialized) && (!(_local_1.first))))
                {
                    if (!_local_1.visible)
                    {
                        _local_1.show();
                    }
                    else
                    {
                        _local_1.hide();
                    };
                }
                else
                {
                    _core.remote.call("getPetArenaData", null, true);
                };
            }
            else
            {
                Alert.show(Language.MINIMAPCANVAS_S[39]);
            };
        }

        private function switchLine():void
        {
            if (((_core.player.posMapId > INST_MAP_ID) && (!(_core.player.mapData.templateId === 49))))
            {
                if (_core.view.getUI(ViewManager.MAIN_TEMP_BAG_WARN).warnState)
                {
                    Alert.show(Language.MINIMAPCANVAS_U[15], "", (Alert.YES | Alert.NO), null, doSelect);
                }
                else
                {
                    Alert.show(Language.MINIMAPCANVAS_U[12], "", (Alert.YES | Alert.NO), null, doSelect);
                };
            }
            else
            {
                if (((_core.player.posMapId > 535) && (_core.player.posMapId <= 557)))
                {
                    if (_core.view.getUI(ViewManager.MAIN_TEMP_BAG_WARN).warnState)
                    {
                        Alert.show(Language.MINIMAPCANVAS_U[15], "", (Alert.YES | Alert.NO), null, doSelect);
                    }
                    else
                    {
                        Alert.show(Language.MINIMAPCANVAS_U[12], "", (Alert.YES | Alert.NO), null, doSelect);
                    };
                }
                else
                {
                    if (_core.view.getUI(ViewManager.MAIN_TEMP_BAG_WARN).warnState)
                    {
                        Alert.show(Language.TEMPORARYBAGWARNCANVAS_U[1], "", (Alert.YES | Alert.NO), null, doSelect);
                    }
                    else
                    {
                        _core.view.changeVisible(ViewManager.MAIN_LINE);
                    };
                };
            };
        }

        private function delayFlyButton():Boolean
        {
            var _local_1:*;
            if (_oldTime == 0)
            {
                _local_1 = new Date();
                _oldTime = _local_1.time;
                return (true);
            };
            _local_1 = new Date();
            if ((_local_1.time - _oldTime) > 3000)
            {
                _oldTime = _local_1.time;
                return (true);
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get timeTrials():Label
        {
            return (this._819791178timeTrials);
        }

        public function set btn_fazenda(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1292664926btn_fazenda;
            if (_local_2 !== _arg_1)
            {
                this._1292664926btn_fazenda = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_fazenda", _local_2, _arg_1));
            };
        }

        public function setTrialsInfoVisible(_arg_1:Number, _arg_2:Number, _arg_3:Boolean):void
        {
            if (_trialsTimer.running)
            {
                _trialsTimer.stop();
                _trialsTimer.removeEventListener(TimerEvent.TIMER, _trialsTimerStart);
            };
            if (_arg_3)
            {
                trialsTimerStart(Math.floor((_arg_1 / 1000)));
            };
            if (_arg_2 >= 0)
            {
                liveTrials.text = Language.MINIMAPCANVAS_S[42].replace("{num}", _arg_2);
            };
            quitTrialsBtn.visible = _arg_3;
            timeTrials.visible = _arg_3;
            liveTrials.visible = _arg_3;
        }

        public function reset():void
        {
            _player = null;
        }

        public function __btnRank_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_ACTIVE);
        }

        private function quitTrials():void
        {
            var handler:Function;
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("trialsOut", null);
                };
            };
            if (_trialsAlert)
            {
                PopUpManager.removePopUp(_trialsAlert);
                _trialsAlert = null;
            };
            var str:String = Language.TRIALS_MAIN_PANEL[8];
            _trialsAlert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
        }

        public function enableUI():void
        {
            this.btn_sys_shop.enabled = true;
            this.btn_exchange.enabled = true;
            this.btn_product.enabled = true;
            this.btn_pet.enabled = true;
            this.btn_life.enabled = true;
            this.btn_autoExp.enabled = true;
            this.btnLine.enabled = true;
            this.flyBtn.enabled = true;
            this.btnRank.enabled = true;
            this.btn_fazenda.enabled = true;
            this.btn_petArena.enabled = true;
        }

        public function showNewGuide():void
        {
            navigateToURL(new URLRequest(GamePredef.SERVER_ADD_ACTIVE), "_blank");
        }

        public function set btn_petArena(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2119526485btn_petArena;
            if (_local_2 !== _arg_1)
            {
                this._2119526485btn_petArena = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_petArena", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnPK():Button
        {
            return (this._94069079btnPK);
        }

        public function set btnRank(_arg_1:Button):void
        {
            var _local_2:Object = this._206155944btnRank;
            if (_local_2 !== _arg_1)
            {
                this._206155944btnRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnRank", _local_2, _arg_1));
            };
        }

        private function showAward():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_AWARD_ALL);
            if (!_local_1.visible)
            {
                _local_1.show();
            }
            else
            {
                _local_1.hide();
            };
        }

        public function randomBattle():void
        {
            _core.remote.call("autoBattleByRandom", null, _core.player.id);
        }

        public function set btn_exchange(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._584079194btn_exchange;
            if (_local_2 !== _arg_1)
            {
                this._584079194btn_exchange = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_exchange", _local_2, _arg_1));
            };
        }

        public function set btn_sys_shop(_arg_1:Button):void
        {
            var _local_2:Object = this._616749141btn_sys_shop;
            if (_local_2 !== _arg_1)
            {
                this._616749141btn_sys_shop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_sys_shop", _local_2, _arg_1));
            };
        }

        private function setPKTooltip():void
        {
            if (btnPK.selected)
            {
                btnPK.toolTip = Language.MINIMAPCANVAS_S[35];
            }
            else
            {
                btnPK.toolTip = Language.MINIMAPCANVAS_S[34];
            };
        }

        private function doSelect(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.view.changeVisible(ViewManager.MAIN_LINE);
            }
            else
            {
                return;
            };
        }

        public function __btn_changeVisible_click(_arg_1:MouseEvent):void
        {
            changeMiniCanvaVisible();
        }

        public function set funCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1074097225funCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1074097225funCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "funCanvas", _local_2, _arg_1));
            };
        }

        private function onCheckNetDelay(_arg_1:Number):void
        {
            _serverTime = _arg_1;
            _core.timeLag = (_arg_1 - new Date().getTime());
            var _local_2:Number = new Date().getTime();
            var _local_3:Number = Math.round(((_local_2 - startTime) / 2));
            var _local_4:int = _core.getNetDelayState(_local_3);
            var _local_5:String = Language.NET_DELAY_STATE_S[_local_4];
            var _local_6:String = GamePredef.NET_DELAY_COLOR[_local_4];
            var _local_7:String = Language.MINIMAPCANVAS_S[38].toString().replace("{state}", _local_5).replace("{delay}", _local_3).replace("{color}", _local_6);
            LB_delay.htmlText = _local_7;
            ((!(delayCanv.visible)) && (delayCanv.visible = true));
        }

        public function ___MiniMapCanvas_Button3_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_HELP);
        }

        public function __btn_autoExp_click(_arg_1:MouseEvent):void
        {
            autoExp();
        }

        [Bindable(event="propertyChange")]
        public function get quitTrialsBtn():Button
        {
            return (this._705624208quitTrialsBtn);
        }

        public function set btn_pet(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._206557372btn_pet;
            if (_local_2 !== _arg_1)
            {
                this._206557372btn_pet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_pet", _local_2, _arg_1));
            };
        }

        public function quitWb():void
        {
            _core.remote.call("wbLeaveMap", null, _core.player.id);
        }

        public function disableUI():void
        {
            this.btn_sys_shop.enabled = false;
            this.btn_exchange.enabled = false;
            this.btn_product.enabled = false;
            this.btn_pet.enabled = false;
            this.btn_life.enabled = false;
            this.btn_autoExp.enabled = false;
            this.btnLine.enabled = false;
            this.flyBtn.enabled = false;
            this.btnRank.enabled = false;
            this.btn_fazenda.enabled = false;
            this.btn_petArena.enabled = false;
        }

        public function changeFlyingState():void
        {
            if (delayFlyButton())
            {
                if (_core.player.flyingState == GamePredef.FLYING_STATE_ON_GROUND)
                {
                    _core.player.beginFlying();
                }
                else
                {
                    if (_player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)
                    {
                        _core.player.stopFlying();
                    };
                };
                changeFlyingButton();
            };
        }

        [Bindable(event="propertyChange")]
        public function get titleLabel():RoundedLabel
        {
            return (this._1791483012titleLabel);
        }

        [Bindable(event="propertyChange")]
        public function get btnMsg():Button
        {
            return (this._1378827387btnMsg);
        }

        [Bindable(event="propertyChange")]
        public function get LB_delay():TextArea
        {
            return (this._570537338LB_delay);
        }

        [Bindable(event="propertyChange")]
        public function get glowEffect():Glow
        {
            return (this._207684226glowEffect);
        }

        override public function initialize():void
        {
            var target:MiniMapCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MiniMapCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_MiniMapCanvasWatcherSetupUtil");
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

        public function set delayCanv(_arg_1:Canvas):void
        {
            var _local_2:Object = this._469618999delayCanv;
            if (_local_2 !== _arg_1)
            {
                this._469618999delayCanv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delayCanv", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get quitBtn():Button
        {
            return (this._658804109quitBtn);
        }

        private function showLife():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_LIFESKILL);
            if (!_local_1.visible)
            {
                _local_1.show();
            }
            else
            {
                _local_1.hide();
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_fazenda():BasicGlowButton
        {
            return (this._1292664926btn_fazenda);
        }

        private function changePKState():void
        {
            btnPK.selected = (!(btnPK.selected));
            setPKTooltip();
            _core.updateSettingNow("apvp", (!(btnPK.selected)));
        }

        [Bindable(event="propertyChange")]
        public function get btn_petArena():BasicGlowButton
        {
            return (this._2119526485btn_petArena);
        }

        [Bindable(event="propertyChange")]
        public function get btn_sys_shop():Button
        {
            return (this._616749141btn_sys_shop);
        }

        public function __btn_product_click(_arg_1:MouseEvent):void
        {
            showProduct();
        }

        [Bindable(event="propertyChange")]
        public function get funCanvas():Canvas
        {
            return (this._1074097225funCanvas);
        }

        public function showExit():void
        {
            teaAble = true;
        }

        public function changeWbBtn(_arg_1:int):void
        {
            if (_arg_1 == 1)
            {
                this.quitBtn.visible = false;
                this.btn_battle_copy.visible = false;
                this.btnChange.visible = true;
                showFuncBtn(true);
            }
            else
            {
                if (_arg_1 == 2)
                {
                    this.quitBtn.visible = true;
                    this.btn_battle_copy.visible = true;
                    this.btnChange.visible = false;
                    showFuncBtn(false);
                }
                else
                {
                    if (_arg_1 == 4)
                    {
                        this.randomBattleBtn.visible = true;
                    }
                    else
                    {
                        if (_arg_1 == 5)
                        {
                            this.randomBattleBtn.visible = false;
                        }
                        else
                        {
                            this.quitBtn.visible = false;
                            this.btn_battle_copy.visible = false;
                            this.btnChange.visible = true;
                            showFuncBtn(true);
                        };
                    };
                };
            };
        }

        public function enterWb():void
        {
            _core.remote.call("canEnterWbMap", null, _core.player.id);
        }

        private function changeLine():void
        {
            var _local_1:Player = _core.player;
            var _local_2:int;
            if (_local_1 != null)
            {
                _local_2 = _local_1.posMapId;
            };
            _core.remote.call("inInstanceMap", new Responder(lineSelectResponder), _local_2);
        }

        public function handleDelayTimer(_arg_1:TimerEvent):void
        {
            checkNetDelay();
        }

        private function lineSelectResponder(_arg_1:Object):void
        {
            if (_arg_1 == true)
            {
                Alert.show(Language.MINIMAPCANVAS_U[6], "", (Alert.YES | Alert.NO), null, selectLine);
            }
            else
            {
                _core.view.changeVisible(ViewManager.MAIN_LINE);
            };
        }

        public function __btn_sys_shop_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_SYSTEM_SHOP);
        }

        public function initView():void
        {
            _player = _core.player;
            btnPK.selected = (!(getPVPState()));
            setPKTooltip();
            if (_core.lineInfo)
            {
                btnLine.toolTip = ((((Language.MINIMAPCANVAS_S[0] + _core.lineInfo.name) + "\n") + Language.MINIMAPCANVAS_S[1]) + Language.MINIMAPCANVAS_S[2]);
            }
            else
            {
                btnLine.toolTip = (Language.MINIMAPCANVAS_S[3] + Language.MINIMAPCANVAS_S[4]);
            };
            changeFlyingButton();
        }

        public function playGlowEffect():void
        {
            if (!glowEffect.isPlaying)
            {
                glowEffect.play([btn_fazenda]);
            };
        }

        public function __btn_petArena_click(_arg_1:MouseEvent):void
        {
            showPetArena();
        }

        private function showExp():void
        {
            var _local_1:ArrayCollection = new ArrayCollection();
            var _local_2:Object = new Object();
            _local_2.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":1141
            };
            _local_2.tips = Language.MINIMAPCANVAS_S[17];
            var _local_3:Object = new Object();
            _local_3.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":368
            };
            _local_3.tips = Language.MINIMAPCANVAS_S[18];
            var _local_4:Object = new Object();
            _local_4.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":369
            };
            _local_4.tips = Language.MINIMAPCANVAS_S[19];
            var _local_5:Object = new Object();
            _local_5.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":1140
            };
            _local_5.tips = Language.MINIMAPCANVAS_S[20];
            var _local_6:Object = new Object();
            _local_6.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":298
            };
            _local_6.tips = Language.MINIMAPCANVAS_S[21];
            var _local_7:Object = new Object();
            _local_7.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":1857
            };
            _local_7.tips = Language.MINIMAPCANVAS_S[31];
            var _local_8:Object = new Object();
            _local_8.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":328
            };
            _local_8.tips = Language.MINIMAPCANVAS_S[32];
            var _local_9:Object = new Object();
            _local_9.itemData = {
                "type":GamePredef.TBL_ITEM_TEMPLATE,
                "id":0x0808
            };
            _local_9.tips = Language.MINIMAPCANVAS_S[33];
            _local_1.addItem(_local_4);
            _local_1.addItem(_local_5);
            _local_1.addItem(_local_2);
            _local_1.addItem(_local_7);
            _local_1.addItem(_local_8);
            _local_1.addItem(_local_9);
            var _local_10:MoneyItemPanel = MoneyItemPanel(_core.view.getUI(ViewManager.POPU_MONEYITEM));
            if (((_local_10.visible) && (_local_10.title == Language.MINIMAPCANVAS_S[22])))
            {
                _local_10.hide();
            }
            else
            {
                _local_10.title = Language.MINIMAPCANVAS_S[23];
                _local_10.arr = _local_1;
                _local_10.show();
            };
        }

        public function set flyBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1271381783flyBtn;
            if (_local_2 !== _arg_1)
            {
                this._1271381783flyBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "flyBtn", _local_2, _arg_1));
            };
        }

        private function autoExp():void
        {
            _core.view.changeVisible(ViewManager.MAIN_AUTO_EXP);
        }

        public function set btn_battle(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1541853189btn_battle;
            if (_local_2 !== _arg_1)
            {
                this._1541853189btn_battle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_battle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_battle():BasicGlowButton
        {
            return (this._1541853189btn_battle);
        }

        [Bindable(event="propertyChange")]
        public function get btn_changeVisible():Button
        {
            return (this._1714155007btn_changeVisible);
        }


    }
}//package com.qeedoo.ui.view.compMain

