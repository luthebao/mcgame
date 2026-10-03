// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PRSSlotItem

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.DataManager;
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

    public class PRSSlotItem extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var chipId:int = 0;
        public var _PRSSlotItem_BasicGlowButton1:BasicGlowButton;
        private var _1475234682needNumLbl:Label;
        private var _306294705prsSlot:ItemSlot;
        private var _1721933611nameLbl:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":199,
                    "height":60,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"prsSlot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "acceptable":false,
                                "x":10,
                                "y":13
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameLbl",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":52,
                                "y":9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"needNumLbl",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":53,
                                "y":34
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_PRSSlotItem_BasicGlowButton1",
                        "events":{"click":"___PRSSlotItem_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "7";
                            this.right = "9";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnStdGreen"});
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

        public function PRSSlotItem()
        {
            mx_internal::_document = this;
            this.width = 199;
            this.height = 60;
            this.styleName = "CanvasBorder";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PRSSlotItem._watcherSetupUtil = _arg_1;
        }


        public function ___PRSSlotItem_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            exchangeChip();
        }

        [Bindable(event="propertyChange")]
        public function get needNumLbl():Label
        {
            return (this._1475234682needNumLbl);
        }

        public function exchangeChip():void
        {
            if (chipId)
            {
                _core.remote.call("exchangePRSChip", null, _core.cid, chipId);
            };
        }

        override public function initialize():void
        {
            var target:PRSSlotItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PRSSlotItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PRSSlotItemWatcherSetupUtil");
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

        public function set nameLbl(_arg_1:Label):void
        {
            var _local_2:Object = this._1721933611nameLbl;
            if (_local_2 !== _arg_1)
            {
                this._1721933611nameLbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLbl", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prsSlot():ItemSlot
        {
            return (this._306294705prsSlot);
        }

        public function set needNumLbl(_arg_1:Label):void
        {
            var _local_2:Object = this._1475234682needNumLbl;
            if (_local_2 !== _arg_1)
            {
                this._1475234682needNumLbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needNumLbl", _local_2, _arg_1));
            };
        }

        public function set prsSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._306294705prsSlot;
            if (_local_2 !== _arg_1)
            {
                this._306294705prsSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prsSlot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nameLbl():Label
        {
            return (this._1721933611nameLbl);
        }

        private function _PRSSlotItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PRS_PANEL[16];
        }

        private function _PRSSlotItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRS_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PRSSlotItem_BasicGlowButton1.label = _arg_1;
            }, "_PRSSlotItem_BasicGlowButton1.label");
            result[0] = binding;
            return (result);
        }

        public function updateItem():void
        {
            var _local_1:Object;
            if (chipId)
            {
                _local_1 = DataManager.getInstance().gameData[GamePredef.TBL_PRS_CHIP][chipId];
                nameLbl.text = _local_1["name"];
                needNumLbl.text = Language.PRS_PANEL[20].toString().replace("{num}", _local_1["costCrystal"]);
                prsSlot.clean();
                prsSlot.slotData = _local_1;
                prsSlot.type = GamePredef.TBL_PRS_CHIP;
                prsSlot.giid = chipId;
                prsSlot.stackNum = 1;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

