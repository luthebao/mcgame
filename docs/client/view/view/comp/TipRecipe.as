// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipRecipe

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Text;
    import mx.controls.Image;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ResizeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
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

    public class TipRecipe extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _351679175recipeName:Label;
        private var _351815844recipeInfo:Text;
        private var _351826137recipeIcon:Image;
        private var _1092797764closeBtn:Button;
        private var _recipeId:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"recipeIcon",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":10,
                                "width":32,
                                "height":32
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"recipeName",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"recipeInfo",
                        "stylesFactory":function ():void
                        {
                            this.color = 16773307;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":50,
                                "width":180,
                                "mouseEnabled":false,
                                "mouseChildren":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"closeBtn",
                        "events":{"click":"__closeBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.top = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "styleName":"BtnToolTipClose",
                                "width":15,
                                "height":15
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipRecipe()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipRecipe_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipRecipe._watcherSetupUtil = _arg_1;
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
        public function get closeBtn():Button
        {
            return (this._1092797764closeBtn);
        }

        override public function initialize():void
        {
            var target:TipRecipe;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipRecipe_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipRecipeWatcherSetupUtil");
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

        public function ___TipRecipe_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function _TipRecipe_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function set closeBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1092797764closeBtn;
            if (_local_2 !== _arg_1)
            {
                this._1092797764closeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeBtn", _local_2, _arg_1));
            };
        }

        public function set recipeId(_arg_1:Number):void
        {
            if (_recipeId == _arg_1)
            {
                return;
            };
            _recipeId = _arg_1;
            this.updateView();
        }

        private function updateView():void
        {
            if (!this.initialized)
            {
                this.callLater(updateView);
                return;
            };
            if (!_recipeId)
            {
                this.cleanView();
                return;
            };
            var _local_1:Object = GameData.d[GamePredef.TBL_RECIPE][_recipeId];
            if (!_local_1)
            {
                this.cleanView();
                return;
            };
            var _local_2:int = _local_1.color;
            if ((_local_2 < 0))
            {
                _local_2 = 0;
            };
            recipeIcon.source = ResManager.getIconUrl(_local_1.iconCode);
            recipeName.htmlText = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_2]) + "'>") + _local_1.name) + "</font>");
            recipeInfo.text = _local_1.desc;
        }

        [Bindable(event="propertyChange")]
        public function get recipeInfo():Text
        {
            return (this._351815844recipeInfo);
        }

        private function cleanView():void
        {
            recipeIcon.source = null;
            recipeName.htmlText = "";
            recipeInfo.text = "";
        }

        public function set recipeIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._351826137recipeIcon;
            if (_local_2 !== _arg_1)
            {
                this._351826137recipeIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeIcon", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get recipeIcon():Image
        {
            return (this._351826137recipeIcon);
        }

        public function __closeBtn_click(_arg_1:MouseEvent):void
        {
            this.visible = false;
        }

        public function set recipeInfo(_arg_1:Text):void
        {
            var _local_2:Object = this._351815844recipeInfo;
            if (_local_2 !== _arg_1)
            {
                this._351815844recipeInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get recipeName():Label
        {
            return (this._351679175recipeName);
        }

        private function _TipRecipe_bindingsSetup():Array
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
                recipeInfo.filters = _arg_1;
            }, "recipeInfo.filters");
            result[1] = binding;
            return (result);
        }

        override public function show(_arg_1:Object=null):void
        {
            super.show(_arg_1);
            closeBtn.visible = (!(_arg_1 == null));
        }


    }
}//package com.qeedoo.ui.view.comp

