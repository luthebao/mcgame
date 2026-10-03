// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FazendaPorTraitCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.ItemConfig;
    import com.qeedoo.game.data.GameData;
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

    public class FazendaPorTraitCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _790207134rl_playerLevel:RoundedLabel;
        private var _742552512rl_movepnt:Label;
        private var _205996609btnLvUp:BasicGlowButton;
        private var _695119652img_head:Image;
        private var _856830001rl_playerName:RoundedLabel;
        private var _639103497rl_actpnt:Label;
        private var _1289197386expBar:Property;
        private var _1000667455rl_level:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":250,
                    "height":57,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":192,
                                "height":57,
                                "styleName":"fazendaCharCanva",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"img_head",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":49,
                                            "x":5,
                                            "height":47,
                                            "y":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl_playerName",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.right = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":1,
                                            "width":86,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl_playerLevel",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.left = "60";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":1,
                                            "width":45,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "0";
                                        this.right = "5";
                                        this.left = "60";
                                        this.top = "20";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"fazendaCharDataCanva",
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"rl_level",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "left";
                                                    this.fontSize = 12;
                                                    this.left = "0";
                                                    this.top = "-2";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"庄园等级:",
                                                        "height":16,
                                                        "width":125
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"rl_movepnt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "left";
                                                    this.fontSize = 12;
                                                    this.left = "0";
                                                    this.top = "13";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"行动力:",
                                                        "height":16,
                                                        "width":125
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"rl_actpnt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "left";
                                                    this.fontSize = 12;
                                                    this.left = "0";
                                                    this.top = "13";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"活力:",
                                                        "height":16,
                                                        "width":125,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Property,
                                                "id":"expBar",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "2";
                                                    this.right = "5";
                                                    this.left = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":6,
                                                        "styleName":"ProgressExp"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnLvUp",
                        "events":{"click":"__btnLvUp_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":198,
                                "y":0,
                                "styleName":"BtnLevelUp",
                                "width":46,
                                "height":22
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FazendaPorTraitCanvas()
        {
            mx_internal::_document = this;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.cacheAsBitmap = true;
            this.width = 250;
            this.height = 57;
            this.x = 61.95;
            this.y = 1;
            this.addEventListener("creationComplete", ___FazendaPorTraitCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FazendaPorTraitCanvas._watcherSetupUtil = _arg_1;
        }


        public function set btnLvUp(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._205996609btnLvUp;
            if (_local_2 !== _arg_1)
            {
                this._205996609btnLvUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLvUp", _local_2, _arg_1));
            };
        }

        public function set rl_level(_arg_1:Label):void
        {
            var _local_2:Object = this._1000667455rl_level;
            if (_local_2 !== _arg_1)
            {
                this._1000667455rl_level = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_level", _local_2, _arg_1));
            };
        }

        public function set rl_movepnt(_arg_1:Label):void
        {
            var _local_2:Object = this._742552512rl_movepnt;
            if (_local_2 !== _arg_1)
            {
                this._742552512rl_movepnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_movepnt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rl_actpnt():Label
        {
            return (this._639103497rl_actpnt);
        }

        override public function initialize():void
        {
            var target:FazendaPorTraitCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FazendaPorTraitCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FazendaPorTraitCanvasWatcherSetupUtil");
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

        public function set rl_actpnt(_arg_1:Label):void
        {
            var _local_2:Object = this._639103497rl_actpnt;
            if (_local_2 !== _arg_1)
            {
                this._639103497rl_actpnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_actpnt", _local_2, _arg_1));
            };
        }

        public function onFarmLvUp(_arg_1:int):void
        {
            var _local_2:int = _core.getFazendaLevelByExp(_arg_1);
            if (_arg_1 >= GamePredef.FARM_LVUP_CONFIG[_local_2].exp)
            {
                btnLvUp.visible = true;
            }
            else
            {
                btnLvUp.visible = false;
            };
            rl_level.text = (Language.FAZENDAPANEL_U[1] + _local_2);
            expBar.setProgress(_arg_1, GamePredef.FARM_LVUP_CONFIG[_local_2].exp);
            expBar.toolTip = (((Language.FAZENDAPANEL_U[2] + _arg_1) + "/") + GamePredef.FARM_LVUP_CONFIG[_local_2].exp);
        }

        [Bindable(event="propertyChange")]
        public function get rl_playerLevel():RoundedLabel
        {
            return (this._790207134rl_playerLevel);
        }

        public function init():void
        {
        }

        public function ___FazendaPorTraitCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __btnLvUp_click(_arg_1:MouseEvent):void
        {
            levelUp();
        }

        private function _FazendaPorTraitCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAZENDAPANEL_S[9];
            _local_1 = Language.PORTRAITCANVAS_U[0];
        }

        [Bindable(event="propertyChange")]
        public function get rl_playerName():RoundedLabel
        {
            return (this._856830001rl_playerName);
        }

        [Bindable(event="propertyChange")]
        public function get expBar():Property
        {
            return (this._1289197386expBar);
        }

        public function set img_head(_arg_1:Image):void
        {
            var _local_2:Object = this._695119652img_head;
            if (_local_2 !== _arg_1)
            {
                this._695119652img_head = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_head", _local_2, _arg_1));
            };
        }

        public function hideHeadImage():void
        {
            img_head.source = ResManager.getIconUrl(GamePredef.DEFAULT_FARM_HEAD_ICON_CODE);
        }

        public function set rl_playerLevel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._790207134rl_playerLevel;
            if (_local_2 !== _arg_1)
            {
                this._790207134rl_playerLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_playerLevel", _local_2, _arg_1));
            };
        }

        public function levelUp():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.farmLvUp();
                };
            };
            var lvStr:String = rl_level.text.toString();
            var lv:int = parseInt(lvStr.substr((lvStr.length - 1), 1));
            var money:int = GamePredef.FARM_LVUP_CONFIG[lv].money;
            var str:String = Language.FAZENDAPANEL_S[20].toString().replace("{num}", money);
            Alert.show(str, "", (Alert.YES | Alert.NO), this, func);
        }

        [Bindable(event="propertyChange")]
        public function get btnLvUp():BasicGlowButton
        {
            return (this._205996609btnLvUp);
        }

        public function updateCharProp(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1)
            {
                _local_2 = _core.getFazendaLevelByExp(_arg_1.exp);
                rl_playerName.text = _arg_1.name;
                rl_playerLevel.text = ("Lv:" + _arg_1.level);
                rl_level.text = (Language.FAZENDAPANEL_U[1] + _local_2);
                rl_movepnt.text = (((Language.FAZENDAPANEL_U[3] + _arg_1.movePnt) + "/") + _arg_1.maxMovePnt);
                expBar.setProgress(_arg_1.exp, GamePredef.FARM_LVUP_CONFIG[_local_2].exp);
                expBar.toolTip = (((Language.FAZENDAPANEL_U[2] + _arg_1.exp) + "/") + GamePredef.FARM_LVUP_CONFIG[_local_2].exp);
                if (_arg_1.name == _core.player.name)
                {
                    img_head.source = ResManager.getIconUrl(_core.player.iconCode);
                };
                if ((((_arg_1.exp >= GamePredef.FARM_LVUP_CONFIG[_local_2].exp) && (_arg_1.name == _core.player.name)) && (GamePredef.FARM_LVUP_CONFIG[(_local_2 + 1)])))
                {
                    btnLvUp.visible = true;
                }
                else
                {
                    btnLvUp.visible = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get rl_level():Label
        {
            return (this._1000667455rl_level);
        }

        [Bindable(event="propertyChange")]
        public function get rl_movepnt():Label
        {
            return (this._742552512rl_movepnt);
        }

        private function _FazendaPorTraitCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDAPANEL_S[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rl_movepnt.toolTip = _arg_1;
            }, "rl_movepnt.toolTip");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PORTRAITCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnLvUp.label = _arg_1;
            }, "btnLvUp.label");
            result[1] = binding;
            return (result);
        }

        public function set rl_playerName(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._856830001rl_playerName;
            if (_local_2 !== _arg_1)
            {
                this._856830001rl_playerName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_playerName", _local_2, _arg_1));
            };
        }

        public function updateCharHeadImage(_arg_1:Number):void
        {
            img_head.source = ResManager.getIconUrl(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get img_head():Image
        {
            return (this._695119652img_head);
        }

        public function set expBar(_arg_1:Property):void
        {
            var _local_2:Object = this._1289197386expBar;
            if (_local_2 !== _arg_1)
            {
                this._1289197386expBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expBar", _local_2, _arg_1));
            };
        }

        public function changeActpntAndMovePntVisible():void
        {
            var _local_1:Object;
            if (rl_playerName.text == _core.player.name)
            {
                _local_1 = _core.view.getUI(ViewManager.PANEL_FAZENDA);
                if (_local_1._ownerId == _core.player.id)
                {
                    rl_actpnt.visible = true;
                    rl_movepnt.visible = false;
                    rl_actpnt.text = ((((Language.GAMEPREDEF_S[0x0101] + "：") + _core.player.actpoint) + "/") + _core.player.maxActpoint);
                }
                else
                {
                    rl_actpnt.visible = false;
                    rl_movepnt.visible = true;
                };
            };
        }

        public function updateMovePoint():void
        {
            rl_movepnt.text = (((Language.FAZENDAPANEL_U[3] + _core.player.movePnt) + "/") + _core.player.maxMovePnt);
        }

        public function addActpoint():void
        {
            var shopData:Object;
            var func:Function = function (_arg_1:CloseEvent):*
            {
                var _local_2:Object;
                if (_arg_1.detail)
                {
                    _local_2 = {
                        "tid":ItemConfig.ITEM_ACTPOINT_WATER,
                        "sid":shopData.id
                    };
                    _core.remote.useItemGold2(_local_2);
                };
            };
            var i:int;
            while (i <= GameData.d[GamePredef.TBL_SHOP_SLOT].length)
            {
                if (GameData.d[GamePredef.TBL_SHOP_SLOT][i])
                {
                    if (((GameData.d[GamePredef.TBL_SHOP_SLOT][i].type == GamePredef.TBL_ITEM_TEMPLATE) && (GameData.d[GamePredef.TBL_SHOP_SLOT][i].itemId == ItemConfig.ITEM_ACTPOINT_WATER)))
                    {
                        shopData = GameData.d[GamePredef.TBL_SHOP_SLOT][i];
                        break;
                    };
                };
                i = (i + 1);
            };
            var str:String = Language.MONEYITEMPANEL_S[0].toString().replace("{shopData.gold}", shopData.gold).replace("{name}", GameData.d[GamePredef.TBL_ITEM_TEMPLATE][ItemConfig.ITEM_ACTPOINT_WATER].name);
            Alert.show(str, "", (Alert.OK | Alert.CANCEL), this, func);
        }


    }
}//package com.qeedoo.ui.view.comp

