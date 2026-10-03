// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PetPVEKPIcon

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.compDragable.PetPVESystem;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import mx.binding.Binding;
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

    public class PetPVEKPIcon extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _677547086petSoul:Canvas;
        private var _982794599ppIcon:Image;
        public var iconData:Object;
        private var _1891404463soulLevel:RoundedLabel;
        private var _1740157726soulName:RoundedLabel;
        private var _197702813levelUpBtn:BasicDelayButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":70,
                    "height":65,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"petSoul",
                        "events":{"click":"__petSoul_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "styleName":"SoulSlotOpen",
                                "width":66,
                                "height":66,
                                "buttonMode":true,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"ppIcon",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.verticalCenter = "-3";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":46,
                                            "height":46
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"soulName",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontFamily = "宋体";
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":2,
                                "y":39,
                                "text":"",
                                "width":68
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"soulLevel",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontFamily = "宋体";
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":2,
                                "y":50,
                                "text":"",
                                "width":68
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
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
                                "clickDelay":500,
                                "width":18,
                                "styleName":"soulUpBtn",
                                "height":18,
                                "visible":false,
                                "enabled":true
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _KPLEVELLIST:Array = [0, 20, 40, 60, 80, 100];
        private const _KPICONS:Object = {
            "1":4130220002074,
            "4":4130220002075,
            "5":4130220002076,
            "6":4130220002077,
            "7":4130220002078,
            "8":4130220002079,
            "9":4130220002080,
            "11":4130220002081,
            "13":4130220002082,
            "31":4130220002083,
            "32":4130220002084,
            "58":4130220002085
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetPVEKPIcon()
        {
            mx_internal::_document = this;
            this.width = 70;
            this.height = 65;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetPVEKPIcon._watcherSetupUtil = _arg_1;
        }


        public function set soulName(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1740157726soulName;
            if (_local_2 !== _arg_1)
            {
                this._1740157726soulName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulName", _local_2, _arg_1));
            };
        }

        private function soulLevelUp():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("ppLevelUpPetIcon", null, iconData);
                };
            };
            Alert.show(Language.PET_PVE_PANEL[23], "", (Alert.YES | Alert.NO), null, func);
        }

        protected function petSoul_clickHandler(_arg_1:MouseEvent):void
        {
            if (((iconData) && (!(iconData.isLocked))))
            {
                PetPVESystem(parentDocument).ppIconClickHandler(iconData);
            };
        }

        public function setPPKPData(_arg_1:Object):void
        {
            var _local_2:Object;
            iconData = _arg_1;
            if (_arg_1.isLocked)
            {
                petSoul.styleName = "SoulSlotClose";
                soulName.text = Language.PET_PVE_PANEL[25].toString().replace("{num}", _KPLEVELLIST[_arg_1.iconIndex]);
                ppIcon.visible = false;
                soulLevel.visible = false;
                levelUpBtn.visible = false;
            }
            else
            {
                petSoul.styleName = "SoulSlotOpen";
                ppIcon.visible = true;
                soulName.visible = true;
                soulLevel.visible = true;
                levelUpBtn.visible = false;
            };
            if (int(_arg_1.level) > 0)
            {
                _local_2 = GameData.d[GamePredef.TBL_CARVE][int(_arg_1.level)];
                if (_local_2)
                {
                    if (int(_local_2.lev) == 20)
                    {
                        levelUpBtn.visible = false;
                    }
                    else
                    {
                        levelUpBtn.visible = true;
                    };
                    soulName.text = Language.PROP_NAME_U[_local_2.p];
                    soulLevel.text = ("Lv." + _local_2.lev);
                    soulName.visible = true;
                    soulLevel.visible = true;
                };
            }
            else
            {
                if (!_arg_1.isLocked)
                {
                    _local_2 = GameData.d[GamePredef.TBL_CARVE][((((_arg_1.partIndex + 1) * 1000) + ((_arg_1.iconIndex + 1) * 100)) + 1)];
                    if (_local_2)
                    {
                        soulName.text = Language.PROP_NAME_U[_local_2.p];
                        soulLevel.text = "Khóa";
                        levelUpBtn.visible = true;
                        soulName.visible = true;
                        soulLevel.visible = true;
                    };
                };
            };
            if (((!(_arg_1.isLocked)) && (_local_2)))
            {
                ppIcon.source = ResManager.getIconUrl(_KPICONS[_local_2.p]);
            };
        }

        private function _PetPVEKPIcon_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                levelUpBtn.toolTip = _arg_1;
            }, "levelUpBtn.toolTip");
            result[0] = binding;
            return (result);
        }

        public function __levelUpBtn_click(_arg_1:MouseEvent):void
        {
            soulLevelUp();
        }

        override public function initialize():void
        {
            var target:PetPVEKPIcon;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetPVEKPIcon_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PetPVEKPIconWatcherSetupUtil");
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

        public function __petSoul_click(_arg_1:MouseEvent):void
        {
            petSoul_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get levelUpBtn():BasicDelayButton
        {
            return (this._197702813levelUpBtn);
        }

        [Bindable(event="propertyChange")]
        public function get soulName():RoundedLabel
        {
            return (this._1740157726soulName);
        }

        private function _PetPVEKPIcon_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_PVE_PANEL[22];
        }

        public function set petSoul(_arg_1:Canvas):void
        {
            var _local_2:Object = this._677547086petSoul;
            if (_local_2 !== _arg_1)
            {
                this._677547086petSoul = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ppIcon():Image
        {
            return (this._982794599ppIcon);
        }

        [Bindable(event="propertyChange")]
        public function get soulLevel():RoundedLabel
        {
            return (this._1891404463soulLevel);
        }

        public function set soulLevel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1891404463soulLevel;
            if (_local_2 !== _arg_1)
            {
                this._1891404463soulLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petSoul():Canvas
        {
            return (this._677547086petSoul);
        }

        public function set ppIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._982794599ppIcon;
            if (_local_2 !== _arg_1)
            {
                this._982794599ppIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppIcon", _local_2, _arg_1));
            };
        }

        public function set levelUpBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._197702813levelUpBtn;
            if (_local_2 !== _arg_1)
            {
                this._197702813levelUpBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelUpBtn", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

