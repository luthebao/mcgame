// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PetSoulIcon

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
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.events.MouseEvent;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.view.ViewManager;
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

    public class PetSoulIcon extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1891404463soulLevel:Label;
        private var _1740157726soulName:Label;
        private var _1908992068lockIcon:Image;
        private var _805807514helpTip:BasicToolTip;
        private var _677547086petSoul:PetSoulSlot;
        private var _1010174295optBtn:BasicGlowButton;
        public var _index:int;
        private var _197702813levelUpBtn:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":70,
                    "height":65,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":PetSoulSlot,
                        "id":"petSoul",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicToolTip,
                        "id":"helpTip",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"lockIcon",
                        "stylesFactory":function ():void
                        {
                            this.left = "5";
                            this.top = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":13,
                                "height":12,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"optBtn",
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                            this.top = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":16,
                                "height":18,
                                "styleName":"soulOperationBtn",
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"levelUpBtn",
                        "events":{"click":"__levelUpBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                            this.bottom = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":18,
                                "styleName":"soulUpBtn",
                                "height":18,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"soulName",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                            this.horizontalCenter = "0";
                            this.fontSize = 11;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":39,
                                "text":"",
                                "height":15
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"soulLevel",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                            this.horizontalCenter = "0";
                            this.fontSize = 11;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":50,
                                "text":"",
                                "height":15
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var lockImg:Class = PetSoulIcon_lockImg;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetSoulIcon()
        {
            mx_internal::_document = this;
            this.width = 70;
            this.height = 65;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetSoulIcon._watcherSetupUtil = _arg_1;
        }


        public function set lockIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1908992068lockIcon;
            if (_local_2 !== _arg_1)
            {
                this._1908992068lockIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lockIcon", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:PetSoulIcon;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetSoulIcon_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PetSoulIconWatcherSetupUtil");
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

        private function _PetSoulIcon_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = lockImg;
            _local_1 = Language.PET_SOUL_S[43];
            _local_1 = Language.PET_SOUL_S[29];
        }

        [Bindable(event="propertyChange")]
        public function get levelUpBtn():BasicGlowButton
        {
            return (this._197702813levelUpBtn);
        }

        [Bindable(event="propertyChange")]
        public function get soulName():Label
        {
            return (this._1740157726soulName);
        }

        [Bindable(event="propertyChange")]
        public function get helpTip():BasicToolTip
        {
            return (this._805807514helpTip);
        }

        public function set soulLevel(_arg_1:Label):void
        {
            var _local_2:Object = this._1891404463soulLevel;
            if (_local_2 !== _arg_1)
            {
                this._1891404463soulLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get optBtn():BasicGlowButton
        {
            return (this._1010174295optBtn);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul():PetSoulSlot
        {
            return (this._677547086petSoul);
        }

        public function set helpTip(_arg_1:BasicToolTip):void
        {
            var _local_2:Object = this._805807514helpTip;
            if (_local_2 !== _arg_1)
            {
                this._805807514helpTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "helpTip", _local_2, _arg_1));
            };
        }

        public function set levelUpBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._197702813levelUpBtn;
            if (_local_2 !== _arg_1)
            {
                this._197702813levelUpBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelUpBtn", _local_2, _arg_1));
            };
        }

        public function set soulName(_arg_1:Label):void
        {
            var _local_2:Object = this._1740157726soulName;
            if (_local_2 !== _arg_1)
            {
                this._1740157726soulName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulName", _local_2, _arg_1));
            };
        }

        public function setSoulData(_arg_1:Object):void
        {
            var _local_2:Object;
            petSoul.setData(_arg_1);
            if ((((_arg_1.isPet) || (_arg_1.state == 0)) || (_arg_1.soulId < 0)))
            {
                this.optBtn.visible = false;
                lockIcon.visible = false;
                soulName.visible = false;
                soulLevel.visible = false;
                levelUpBtn.visible = false;
            }
            else
            {
                if (!_arg_1.lock)
                {
                    lockIcon.visible = false;
                }
                else
                {
                    lockIcon.visible = true;
                };
                this.optBtn.visible = true;
            };
            if (_arg_1.soulId > 0)
            {
                _local_2 = GameData.d[GamePredef.TBL_PET_SOUL][_arg_1.soulId];
                if (_local_2)
                {
                    if ((((_local_2) && ((int(_core.player.soulExp) + int(_arg_1.exp)) >= _local_2["upExp"])) && (int(_local_2["level"]) < 10)))
                    {
                        this.levelUpBtn.visible = true;
                    }
                    else
                    {
                        this.levelUpBtn.visible = false;
                    };
                    soulName.text = _local_2.name;
                    soulLevel.text = ("Lv." + _local_2.level);
                    soulName.setStyle("color", GamePredef.CODE_SOUL_COLOR[_local_2.color]);
                    soulLevel.setStyle("color", GamePredef.CODE_SOUL_COLOR[_local_2.color]);
                    soulName.visible = true;
                    soulLevel.visible = true;
                };
            };
            if (_index > 100)
            {
                petSoul.slotType = SoulSlot.SLOT_PET_SOUL;
            }
            else
            {
                petSoul.slotType = SoulSlot.SLOT_BAG_SOUL;
            };
            petSoul.index = _index;
            petSoul.state = _arg_1.state;
            optBtn.addEventListener(MouseEvent.CLICK, showOperation);
        }

        [Bindable(event="propertyChange")]
        public function get lockIcon():Image
        {
            return (this._1908992068lockIcon);
        }

        private function soulLevelUp():void
        {
            var temp:Object = GameData.d[GamePredef.TBL_PET_SOUL][petSoul.acceptObj.soulId];
            if (!temp)
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (petSoul.slotType == SoulSlot.SLOT_PET_SOUL)
                    {
                        _core.remote.call("soulLevelUp", null, _index, petSoul.acceptObj.petId);
                    }
                    else
                    {
                        _core.remote.call("soulLevelUp", null, _index);
                    };
                };
            };
            Alert.show(Language.PET_SOUL_S[33].replace("{name}", temp.name), "", (Alert.YES | Alert.NO), null, func);
        }

        public function __levelUpBtn_click(_arg_1:MouseEvent):void
        {
            soulLevelUp();
        }

        [Bindable(event="propertyChange")]
        public function get soulLevel():Label
        {
            return (this._1891404463soulLevel);
        }

        public function set optBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1010174295optBtn;
            if (_local_2 !== _arg_1)
            {
                this._1010174295optBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "optBtn", _local_2, _arg_1));
            };
        }

        public function set petSoul(_arg_1:PetSoulSlot):void
        {
            var _local_2:Object = this._677547086petSoul;
            if (_local_2 !== _arg_1)
            {
                this._677547086petSoul = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul", _local_2, _arg_1));
            };
        }

        public function changeBtnState():void
        {
            var _local_1:Object;
            if (!petSoul.acceptObj)
            {
                return;
            };
            if ((((petSoul.acceptObj.isPet) || (petSoul.acceptObj.state == 0)) || (petSoul.acceptObj.soulId < 0)))
            {
                this.optBtn.visible = false;
                lockIcon.visible = false;
                levelUpBtn.visible = false;
            }
            else
            {
                if (!petSoul.acceptObj.lock)
                {
                    lockIcon.visible = false;
                }
                else
                {
                    lockIcon.visible = true;
                };
                this.optBtn.visible = true;
            };
            if (petSoul.acceptObj.soulId > 0)
            {
                _local_1 = GameData.d[GamePredef.TBL_PET_SOUL][petSoul.acceptObj.soulId];
                if (_local_1)
                {
                    if ((((_local_1) && ((int(_core.player.soulExp) + int(petSoul.acceptObj.exp)) >= _local_1["upExp"])) && (int(_local_1["level"]) < 10)))
                    {
                        this.levelUpBtn.visible = true;
                    }
                    else
                    {
                        this.levelUpBtn.visible = false;
                    };
                };
            };
        }

        public function showOperation(_arg_1:MouseEvent):void
        {
            if (petSoul.index <= 0)
            {
                return;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_PET_SOUL);
            if (_local_2)
            {
                _local_2.showMenu(petSoul.index, _arg_1.stageX, _arg_1.stageY);
            };
        }

        private function _PetSoulIcon_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (lockImg);
            }, function (_arg_1:Object):void
            {
                lockIcon.source = _arg_1;
            }, "lockIcon.source");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lockIcon.toolTip = _arg_1;
            }, "lockIcon.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                levelUpBtn.toolTip = _arg_1;
            }, "levelUpBtn.toolTip");
            result[2] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

