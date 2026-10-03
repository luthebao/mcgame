// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.RecipeAlertFree

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.RecipeCell;
    import com.qeedoo.ui.view.comp.FilterButton;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.managers.PopUpManager;
    import mx.core.Application;
    import flash.display.DisplayObject;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
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

    public class RecipeAlertFree extends Canvas implements IBindingClient 
    {

        public static var _instance:RecipeAlertFree;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _RecipeAlertFree_Label1:Label;
        private var _352003056recipeCell:RecipeCell;
        public var _RecipeAlertFree_FilterButton1:FilterButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":230,
                    "height":100,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_RecipeAlertFree_Label1",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.color = 0xFFFFFF;
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":10});
                        }
                    }), new UIComponentDescriptor({
                        "type":RecipeCell,
                        "id":"recipeCell",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":30,
                                "inPopUp":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"_RecipeAlertFree_FilterButton1",
                        "events":{"click":"___RecipeAlertFree_FilterButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":66,
                                "styleName":"BtnStdGreen",
                                "width":60,
                                "height":23
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

        public function RecipeAlertFree()
        {
            mx_internal::_document = this;
            this.width = 230;
            this.height = 100;
            this.styleName = "CanvasPopup";
            this.clipContent = false;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RecipeAlertFree._watcherSetupUtil = _arg_1;
        }

        public static function show(_arg_1:Number, _arg_2:Number):void
        {
            _instance = ((_instance) || (new (RecipeAlertFree)()));
            PopUpManager.removePopUp(_instance);
            PopUpManager.addPopUp(_instance, (Application.application as DisplayObject), true);
            PopUpManager.centerPopUp(_instance);
            _instance.updateView(_arg_1, _arg_2);
        }


        private function updateView(_arg_1:Number, _arg_2:Number):void
        {
            recipeCell.stackNum = _arg_2;
            recipeCell.recipeId = _arg_1;
        }

        override public function initialize():void
        {
            var target:RecipeAlertFree;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RecipeAlertFree_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_RecipeAlertFreeWatcherSetupUtil");
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

        public function ___RecipeAlertFree_FilterButton1_click(_arg_1:MouseEvent):void
        {
            closeHandler(_arg_1);
        }

        override protected function createChildren():void
        {
            super.createChildren();
            this.setStyle("modalTransparency", 0);
            this.setStyle("modalTransparencyBlur", 0);
        }

        public function set recipeCell(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._352003056recipeCell;
            if (_local_2 !== _arg_1)
            {
                this._352003056recipeCell = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell():RecipeCell
        {
            return (this._352003056recipeCell);
        }

        private function _RecipeAlertFree_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RecipeAlertFree_Label1.text = _arg_1;
            }, "_RecipeAlertFree_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _RecipeAlertFree_Label1.filters = _arg_1;
            }, "_RecipeAlertFree_Label1.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RecipeAlertFree_FilterButton1.label = _arg_1;
            }, "_RecipeAlertFree_FilterButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _RecipeAlertFree_FilterButton1.filters = _arg_1;
            }, "_RecipeAlertFree_FilterButton1.filters");
            result[3] = binding;
            return (result);
        }

        private function closeHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            PopUpManager.removePopUp(this);
        }

        private function _RecipeAlertFree_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DRESS_PANEL[37];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[38];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }


    }
}//package com.qeedoo.ui.view.compDragable

