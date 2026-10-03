// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GuidePopPanel

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.RoundedButton;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
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

    public class GuidePopPanel extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1847046761nextBtn:Button;
        private var _1216617090currentGuideId:int = -1;
        private var _2147400797skipBtn:RoundedButton;
        private var _98496596goBtn:RoundedButton;
        private var _3237038info:LinkTextArea;
        private var firstTimeFlag:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":539,
                                "height":211,
                                "styleName":"CanvasGuide",
                                "x":200,
                                "y":150,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"info",
                                    "events":{"mouseMove":"__info_mouseMove"},
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                        this.backgroundAlpha = 0;
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "editable":false,
                                            "height":120,
                                            "width":287,
                                            "x":173,
                                            "y":75,
                                            "selectable":false,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"nextBtn",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":439.8,
                                            "y":162,
                                            "styleName":"BtnNextGuide"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedButton,
                                    "id":"skipBtn",
                                    "events":{"click":"__skipBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnRed",
                                            "x":188,
                                            "y":162,
                                            "width":158.95
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedButton,
                                    "id":"goBtn",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnRed",
                                            "x":395,
                                            "y":162
                                        });
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        private var guideList:Object = {};
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GuidePopPanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0.4;
                this.backgroundColor = 0;
            };
            this.percentWidth = 100;
            this.percentHeight = 100;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuidePopPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get goBtn():RoundedButton
        {
            return (this._98496596goBtn);
        }

        private function set currentGuideId(_arg_1:int):void
        {
            var _local_2:Object = this._1216617090currentGuideId;
            if (_local_2 !== _arg_1)
            {
                this._1216617090currentGuideId = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentGuideId", _local_2, _arg_1));
            };
        }

        public function showGuidePanel(_arg_1:int):void
        {
            if (((_core.player.guideLog) && (_core.player.guideLog.indexOf(String(_arg_1)) < 0)))
            {
                visible = true;
                currentGuideId = _arg_1;
                _core.remote.setGuide(_arg_1);
                updateView();
                if (_arg_1 == 0)
                {
                    visible = false;
                };
            };
        }

        public function __skipBtn_click(_arg_1:MouseEvent):void
        {
            skipAll();
        }

        private function _GuidePopPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GUIDEPOPPANEL_S[2];
            _local_1 = Language.GUIDEPOPPANEL_S[3];
        }

        public function set skipBtn(_arg_1:RoundedButton):void
        {
            var _local_2:Object = this._2147400797skipBtn;
            if (_local_2 !== _arg_1)
            {
                this._2147400797skipBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skipBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get currentGuideId():int
        {
            return (this._1216617090currentGuideId);
        }

        private function updateView():void
        {
            if (currentGuideId >= 0)
            {
                if (currentGuideId == 0)
                {
                    nextBtn.styleName = "BtnNextGuide";
                    info.text = Language.GUIDEPOPPANEL_S[0];
                    goBtn.addEventListener(MouseEvent.CLICK, onNext);
                    nextBtn.visible = false;
                    skipBtn.visible = true;
                    goBtn.visible = true;
                }
                else
                {
                    if (currentGuideId == 21)
                    {
                        info.text = Language.GUIDEPOPPANEL_S[1];
                        nextBtn.addEventListener(MouseEvent.CLICK, onClose);
                        nextBtn.visible = true;
                        skipBtn.visible = false;
                        goBtn.visible = false;
                    }
                    else
                    {
                        if (currentGuideId == 22)
                        {
                            nextBtn.styleName = "BtnLeave";
                            nextBtn.visible = true;
                            skipBtn.visible = false;
                            goBtn.visible = false;
                        };
                    };
                };
            };
        }

        private function _GuidePopPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUIDEPOPPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                skipBtn.label = _arg_1;
            }, "skipBtn.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUIDEPOPPANEL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goBtn.label = _arg_1;
            }, "goBtn.label");
            result[1] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:GuidePopPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuidePopPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GuidePopPanelWatcherSetupUtil");
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

        private function onClose(_arg_1:MouseEvent):void
        {
            nextBtn.removeEventListener(MouseEvent.CLICK, onClose);
            visible = false;
            _core.view.hideAll(ViewManager.TYPE_PANEL);
        }

        [Bindable(event="propertyChange")]
        public function get skipBtn():RoundedButton
        {
            return (this._2147400797skipBtn);
        }

        private function skipAll():void
        {
            _core.remote.setAllGuide();
            this.visible = false;
        }

        public function __info_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set goBtn(_arg_1:RoundedButton):void
        {
            var _local_2:Object = this._98496596goBtn;
            if (_local_2 !== _arg_1)
            {
                this._98496596goBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goBtn", _local_2, _arg_1));
            };
        }

        public function set info(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get info():LinkTextArea
        {
            return (this._3237038info);
        }

        [Bindable(event="propertyChange")]
        public function get nextBtn():Button
        {
            return (this._1847046761nextBtn);
        }

        private function onNext(_arg_1:MouseEvent):void
        {
            goBtn.removeEventListener(MouseEvent.CLICK, onNext);
            visible = false;
        }

        public function set nextBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1847046761nextBtn;
            if (_local_2 !== _arg_1)
            {
                this._1847046761nextBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextBtn", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

