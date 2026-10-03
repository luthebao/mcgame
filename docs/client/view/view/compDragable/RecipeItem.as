// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.RecipeItem

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.FilterButton;
    import com.qeedoo.ui.view.comp.RecipeCell;
    import mx.controls.Alert;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.LanguageUtil;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.system.Core;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
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

    public class RecipeItem extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _351679175recipeName:Label;
        public var _RecipeItem_FilterButton1:FilterButton;
        private var _351993221recipeCost:Label;
        private var _352003056recipeCell:RecipeCell;
        private var _exchangeAlert:Alert;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":250,
                    "height":45,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":RecipeCell,
                        "id":"recipeCell",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"recipeName",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "-8";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "mouseEnabled":false,
                                "mouseChildren":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"recipeCost",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "8";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":45});
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"_RecipeItem_FilterButton1",
                        "events":{"click":"___RecipeItem_FilterButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
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

        public function RecipeItem()
        {
            mx_internal::_document = this;
            this.width = 250;
            this.height = 45;
            this.styleName = "InputContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RecipeItem._watcherSetupUtil = _arg_1;
        }


        public function set recipeName(_arg_1:Label):void
        {
            var _local_2:Object = this._351679175recipeName;
            if (_local_2 !== _arg_1)
            {
                this._351679175recipeName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get recipeCost():Label
        {
            return (this._351993221recipeCost);
        }

        public function set recipeCost(_arg_1:Label):void
        {
            var _local_2:Object = this._351993221recipeCost;
            if (_local_2 !== _arg_1)
            {
                this._351993221recipeCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCost", _local_2, _arg_1));
            };
        }

        public function updateView(_arg_1:Number):void
        {
            if (!_arg_1)
            {
                this.clean();
                return;
            };
            recipeCell.stackNum = -1;
            recipeCell.recipeId = _arg_1;
            var _local_2:Object = GameData.d[GamePredef.TBL_RECIPE][_arg_1];
            if (!_local_2)
            {
                this.clean();
                return;
            };
            var _local_3:int = int(_local_2.color);
            if (((!(_local_3)) || (_local_3 < 0)))
            {
                _local_3 = 0;
            };
            recipeName.htmlText = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_3]) + "'>") + _local_2.name) + "</font>");
            recipeCost.text = LanguageUtil.replace(Language.DRESS_PANEL[42], {"score":_local_2.money});
        }

        private function _RecipeItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                recipeName.filters = _arg_1;
            }, "recipeName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                recipeCost.filters = _arg_1;
            }, "recipeCost.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RecipeItem_FilterButton1.label = _arg_1;
            }, "_RecipeItem_FilterButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _RecipeItem_FilterButton1.filters = _arg_1;
            }, "_RecipeItem_FilterButton1.filters");
            result[3] = binding;
            return (result);
        }

        private function exchangeHanlder(event:Event):void
        {
            event.stopImmediatePropagation();
            if (!recipeCell.recipeId)
            {
                return;
            };
            if (_exchangeAlert)
            {
                PopUpManager.removePopUp(_exchangeAlert);
                _exchangeAlert = null;
            };
            var closeHandler:Function = function (_arg_1:CloseEvent):void
            {
                ((_arg_1.detail == Alert.YES) && (Core.getInstance().remote.call("exchangeRecipe", new Responder(DressLogic.updateDressInfo), recipeCell.recipeId)));
            };
            var recipeMeta:Object = GameData.d[GamePredef.TBL_RECIPE][recipeCell.recipeId];
            var popStr:String = LanguageUtil.replace(Language.DRESS_PANEL[47], {"score":recipeMeta.money});
            _exchangeAlert = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _exchangeAlert.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        public function clean():void
        {
            recipeCell.clean();
            this.visible = false;
            recipeCost.text = "";
            recipeName.htmlText = "";
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

        override public function initialize():void
        {
            var target:RecipeItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RecipeItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_RecipeItemWatcherSetupUtil");
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

        public function ___RecipeItem_FilterButton1_click(_arg_1:MouseEvent):void
        {
            exchangeHanlder(_arg_1);
        }

        private function _RecipeItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[43];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get recipeName():Label
        {
            return (this._351679175recipeName);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell():RecipeCell
        {
            return (this._352003056recipeCell);
        }


    }
}//package com.qeedoo.ui.view.compDragable

