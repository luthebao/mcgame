// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.AISkillComp

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.predef.GamePredef;
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

    public class AISkillComp extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3675sn:BasicTxtButton;
        private var _114597tar:BasicTxtButton;
        private var _115s:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":150,
                    "height":45,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"s",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":6,
                                "movable":false,
                                "acceptable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"sn",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":2
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"tar",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":23
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AISkillComp()
        {
            mx_internal::_document = this;
            this.width = 150;
            this.height = 45;
            this.styleName = "CanvasShopSlot";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AISkillComp._watcherSetupUtil = _arg_1;
        }


        private function _AISkillComp_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                s.slotType = _arg_1;
            }, "s.slotType");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get s():ItemSlot
        {
            return (this._115s);
        }

        public function set nm(_arg_1:String):void
        {
            sn.text = _arg_1;
        }

        public function clean():void
        {
            s.clean();
            sn.text = "";
            tar.text = "";
        }

        public function set tar(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._114597tar;
            if (_local_2 !== _arg_1)
            {
                this._114597tar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tar", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:AISkillComp;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AISkillComp_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_AISkillCompWatcherSetupUtil");
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

        public function get sk():Number
        {
            return (0);
        }

        [Bindable(event="propertyChange")]
        public function get sn():BasicTxtButton
        {
            return (this._3675sn);
        }

        private function _AISkillComp_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Slot.SLOT_PET_AI;
        }

        public function set sn(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._3675sn;
            if (_local_2 !== _arg_1)
            {
                this._3675sn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tar():BasicTxtButton
        {
            return (this._114597tar);
        }

        public function set s(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._115s;
            if (_local_2 !== _arg_1)
            {
                this._115s = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s", _local_2, _arg_1));
            };
        }

        public function set sk(_arg_1:Number):void
        {
            s.type = GamePredef.TBL_SKILL;
            s.giid = _arg_1;
        }

        public function get giid():Number
        {
            return (s.giid);
        }

        public function set tarType(_arg_1:String):void
        {
            tar.text = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.comp

