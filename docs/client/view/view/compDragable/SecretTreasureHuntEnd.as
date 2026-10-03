// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SecretTreasureHuntEnd

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
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

    public class SecretTreasureHuntEnd extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1241479642goExit:BasicGlowButton;
        public var _SecretTreasureHuntEnd_Image1:Image;
        private var _164628312goAgain:BasicGlowButton;
        private var _3242771item:ItemSlot;
        private var _itemNum:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":279,
                    "height":180,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":150,
                                "y":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_SecretTreasureHuntEnd_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":0,
                                            "width":270,
                                            "height":145
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"goAgain",
                                    "events":{"click":"__goAgain_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":28,
                                            "y":105,
                                            "width":74,
                                            "height":31,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"item",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":122.5,
                                            "y":47,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"goExit",
                                    "events":{"click":"__goExit_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":175,
                                            "y":109,
                                            "width":74,
                                            "height":31,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                })]
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

        public function SecretTreasureHuntEnd()
        {
            mx_internal::_document = this;
            this.width = 279;
            this.height = 180;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SecretTreasureHuntEnd._watcherSetupUtil = _arg_1;
        }


        public function showPanel():*
        {
            initView();
            visible = true;
        }

        public function __goAgain_click(_arg_1:MouseEvent):void
        {
            goAgainFunc();
        }

        public function set item(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3242771item;
            if (_local_2 !== _arg_1)
            {
                this._3242771item = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item", _local_2, _arg_1));
            };
        }

        public function goExitFunc():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            visible = false;
        }

        private function _SecretTreasureHuntEnd_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getIconUrl(4130220000670);
            _local_1 = Language.SEC_TREA_HUNT[9];
            _local_1 = Language.SEC_TREA_HUNT[10];
        }

        public function __goExit_click(_arg_1:MouseEvent):void
        {
            goExitFunc();
        }

        public function set goExit(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1241479642goExit;
            if (_local_2 !== _arg_1)
            {
                this._1241479642goExit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goExit", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            this.itemNum = _itemNum;
        }

        override public function initialize():void
        {
            var target:SecretTreasureHuntEnd;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SecretTreasureHuntEnd_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SecretTreasureHuntEndWatcherSetupUtil");
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
        public function get item():ItemSlot
        {
            return (this._3242771item);
        }

        public function set itemNum(_arg_1:Number):void
        {
            _itemNum = _arg_1;
            if (initialized)
            {
                item.type = GamePredef.TBL_ITEM_TEMPLATE;
                item.giid = _arg_1;
                item.slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_1];
            };
        }

        [Bindable(event="propertyChange")]
        public function get goAgain():BasicGlowButton
        {
            return (this._164628312goAgain);
        }

        public function set goAgain(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._164628312goAgain;
            if (_local_2 !== _arg_1)
            {
                this._164628312goAgain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goAgain", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goExit():BasicGlowButton
        {
            return (this._1241479642goExit);
        }

        private function _SecretTreasureHuntEnd_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000670));
            }, function (_arg_1:Object):void
            {
                _SecretTreasureHuntEnd_Image1.source = _arg_1;
            }, "_SecretTreasureHuntEnd_Image1.source");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goAgain.label = _arg_1;
            }, "goAgain.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goExit.label = _arg_1;
            }, "goExit.label");
            result[2] = binding;
            return (result);
        }

        public function goAgainFunc():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT);
            if (_local_1)
            {
                _local_1.showPanel();
            };
            visible = false;
        }


    }
}//package com.qeedoo.ui.view.compDragable

