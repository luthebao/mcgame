// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MCZDPetConfigCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.compDragable.MCZDPetFightConf;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import flash.geom.Point;
    import mx.controls.Alert;
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

    public class MCZDPetConfigCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _data:Object;
        private var _110879pet:ItemSlotPet;
        private var _951080088confBtn:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":60,
                    "height":60,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlotPet,
                        "id":"pet",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":0,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"confBtn",
                        "events":{"click":"__confBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "y":36
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

        public function MCZDPetConfigCanvas()
        {
            mx_internal::_document = this;
            this.width = 60;
            this.height = 60;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___MCZDPetConfigCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MCZDPetConfigCanvas._watcherSetupUtil = _arg_1;
        }


        public function __confBtn_click(_arg_1:MouseEvent):void
        {
            showConfDetailPanel();
        }

        public function set pet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._110879pet;
            if (_local_2 !== _arg_1)
            {
                this._110879pet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet", _local_2, _arg_1));
            };
        }

        public function set conf(_arg_1:Object):void
        {
            _data = _arg_1;
        }

        public function get pid():Number
        {
            if (pet.slotData)
            {
                return (pet.slotData.id);
            };
            return (-1);
        }

        public function cleanView():void
        {
            this.pet.clean();
            _data = null;
        }

        public function get tid():Number
        {
            if (pet.slotData)
            {
                return (pet.slotData.tid);
            };
            return (-1);
        }

        private function onPetChange(_arg_1:GameEvent):void
        {
            var _local_2:MCZDPetFightConf = MCZDPetFightConf(_core.view.getUI(ViewManager.PANEL_MCZD_PETFIGHT_CONF));
            var _local_3:Number = Number(this.id.slice(-1));
            if (pet.slotData)
            {
                if (_local_2.duplicatedPet(pet.slotData, _local_3))
                {
                    pet.clean();
                    _core.sysMidNote(Language.PETFIGHT_PANEL_U[21]);
                }
                else
                {
                    _data = _local_2.getCacheConfData(pet.slotData.id);
                    if (!_data)
                    {
                        _data = {
                            "pid":pet.slotData.id,
                            "pos":_local_3,
                            "cmdList":[]
                        };
                        _local_2.saveConfData(_data);
                    };
                };
            };
        }

        private function onPetDoubleClick(_arg_1:GameEvent):void
        {
            var _local_2:MCZDPetFightConf;
            if (pet.slotData)
            {
                _local_2 = MCZDPetFightConf(_core.view.getUI(ViewManager.PANEL_MCZD_PETFIGHT_CONF));
                _local_2.clearCacheConfData(pet.slotData.id);
                pet.clean();
            };
        }

        public function setPet(_arg_1:Number):void
        {
            var _local_2:Object;
            _local_2 = _core.data.gameData[GamePredef.TBL_PET][_arg_1];
            if (pet)
            {
                pet.type = GamePredef.TBL_PET;
                pet.giid = _arg_1;
                pet.slotData = _local_2;
                if (((((!(_local_2)) && (_core.player)) && (_core.player.petList)) && (_core.player.petList[_arg_1])))
                {
                    pet.slotData = _core.player.petList[_arg_1];
                };
            };
        }

        private function _MCZDPetConfigCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PETFIGHT_PANEL_U[1];
        }

        override public function initialize():void
        {
            var target:MCZDPetConfigCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MCZDPetConfigCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_MCZDPetConfigCanvasWatcherSetupUtil");
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

        public function ___MCZDPetConfigCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get pet():ItemSlotPet
        {
            return (this._110879pet);
        }

        [Bindable(event="propertyChange")]
        public function get confBtn():BasicGlowButton
        {
            return (this._951080088confBtn);
        }

        private function _MCZDPetConfigCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                confBtn.label = _arg_1;
            }, "confBtn.label");
            result[0] = binding;
            return (result);
        }

        public function hasSetted():Boolean
        {
            if (((pet.slotData) && (pet.giid > 0)))
            {
                return (true);
            };
            return (false);
        }

        public function set confBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._951080088confBtn;
            if (_local_2 !== _arg_1)
            {
                this._951080088confBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confBtn", _local_2, _arg_1));
            };
        }

        private function showConfDetailPanel():void
        {
            var _local_3:Point;
            var _local_1:MCZDPetAIConfPanel = MCZDPetAIConfPanel(_core.view.getUI(ViewManager.POP_MCZD_PET_PVE_AI_CONFIGURE));
            var _local_2:Number = Number(this.id.slice(-1));
            if ((((((_local_1.visible) && (_local_1.confPos == _local_2)) && (pet)) && (pet.slotData)) && (_local_1.petId == pet.slotData.id)))
            {
                _local_1.visible = false;
            }
            else
            {
                if (pet.slotData)
                {
                    _local_3 = localToGlobal(new Point(confBtn.x, confBtn.y));
                    _local_1.showPanel(_local_2, pet.slotData.id, this, _data);
                    _local_1.x = Math.max(0, (_local_3.x - (_local_1.width / 2)));
                    _local_1.y = Math.max(((_local_3.y - _local_1.height) - 60), 0);
                }
                else
                {
                    Alert.show(Language.PETFIGHT_PANEL_U[13]);
                };
            };
        }

        private function init():void
        {
            pet.addEventListener(GameEvent.SLOT_GIID_CHANGE, onPetChange);
            pet.addEventListener(Slot.EVENT_SLOT_DCLICK, onPetDoubleClick);
        }


    }
}//package com.qeedoo.ui.view.comp

