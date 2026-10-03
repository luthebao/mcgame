// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BasicTitleCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
    import mx.events.PropertyChangeEvent;
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

    public class BasicTitleCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1969543397titleWrapper:Canvas;
        private var _2082343164btnClose:Button;
        private var _205861821btnHelp:Button;
        private var _110371416title:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":31,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"titleWrapper",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":15,
                                "y":9,
                                "styleName":"StandardTitle",
                                "horizontalScrollPolicy":"off"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"title",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":8,
                                "styleName":"LabelTitle"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnHelp",
                        "events":{
                            "mouseDown":"__btnHelp_mouseDown",
                            "click":"__btnHelp_click"
                        },
                        "stylesFactory":function ():void
                        {
                            this.right = "38";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":9,
                                "visible":false,
                                "styleName":"BtnPanelHelp"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnClose",
                        "events":{
                            "mouseDown":"__btnClose_mouseDown",
                            "click":"__btnClose_click"
                        },
                        "stylesFactory":function ():void
                        {
                            this.right = "12";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":9,
                                "styleName":"BtnPanelClose"
                            });
                        }
                    })]
                });
            }
        });
        public var closeFunc:Function = closeFuncDefault;
        public var helpFunc:Function = helpFuncDefault;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function BasicTitleCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.textAlign = "center";
            };
            this.percentWidth = 100;
            this.height = 31;
            this.x = 0;
            this.y = 0;
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BasicTitleCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get btnClose():Button
        {
            return (this._2082343164btnClose);
        }

        public function __btnHelp_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function __btnClose_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function closeFuncDefault():void
        {
            this.parentDocument.hide();
        }

        public function set closeButtonVisible(_arg_1:Boolean):void
        {
            btnClose.visible = _arg_1;
        }

        private function _BasicTitleCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                title.filters = _arg_1;
            }, "title.filters");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get btnHelp():Button
        {
            return (this._205861821btnHelp);
        }

        public function set text(_arg_1:String):void
        {
            title.text = _arg_1;
            titleWrapper.width = ((_arg_1.length * 17) + 90);
            titleWrapper.x = ((this.parentDocument.width - titleWrapper.width) / 2);
        }

        [Bindable(event="propertyChange")]
        public function get titleWrapper():Canvas
        {
            return (this._1969543397titleWrapper);
        }

        public function helpFuncDefault():void
        {
            Core.getInstance().view.getUI(ViewManager.PANEL_HELP).show();
        }

        private function _BasicTitleCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_TITLE];
        }

        override public function initialize():void
        {
            var target:BasicTitleCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BasicTitleCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_BasicTitleCanvasWatcherSetupUtil");
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

        public function __btnHelp_click(_arg_1:MouseEvent):void
        {
            helpFunc();
        }

        [Bindable(event="propertyChange")]
        public function get title():Label
        {
            return (this._110371416title);
        }

        public function get text():String
        {
            return (title.text);
        }

        public function set closeButtonEnabled(_arg_1:Boolean):void
        {
            btnClose.enabled = _arg_1;
        }

        public function set titleWrapper(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1969543397titleWrapper;
            if (_local_2 !== _arg_1)
            {
                this._1969543397titleWrapper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleWrapper", _local_2, _arg_1));
            };
        }

        public function set title(_arg_1:Label):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function set titleStyle(_arg_1:String):void
        {
            title.styleName = _arg_1;
        }

        public function __btnClose_click(_arg_1:MouseEvent):void
        {
            closeFunc();
        }

        public function set btnHelp(_arg_1:Button):void
        {
            var _local_2:Object = this._205861821btnHelp;
            if (_local_2 !== _arg_1)
            {
                this._205861821btnHelp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnHelp", _local_2, _arg_1));
            };
        }

        public function set btnClose(_arg_1:Button):void
        {
            var _local_2:Object = this._2082343164btnClose;
            if (_local_2 !== _arg_1)
            {
                this._2082343164btnClose = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnClose", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

