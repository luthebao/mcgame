// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GuessNumberPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import com.qeedoo.game.system.Core;
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

    public class GuessNumberPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var maxNum:int;
        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _100358090input:TextInput;
        private var isMomoNpc:Boolean;
        private var _94069048btnOK:BasicGlowButton;
        public var hideAble:Boolean = true;
        private var answer:int;
        private var _607740351labelText:RoundedLabel;
        private var funcname:String;
        private var minNum:int;
        private var _117924854btnCancel:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":190,
                    "height":126,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"labelText",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":40,
                                "width":170,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"input",
                        "events":{
                            "enter":"__input_enter",
                            "mouseDown":"__input_mouseDown"
                        },
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":68,
                                "width":128,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnOK",
                        "events":{"click":"__btnOK_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "-29";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":42.5,
                                "y":95,
                                "styleName":"BtnNormalRed",
                                "width":40,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnCancel",
                        "events":{"click":"__btnCancel_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "29";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":95,
                                "styleName":"BtnNormalRed",
                                "width":40,
                                "height":19
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

        public function GuessNumberPanel()
        {
            mx_internal::_document = this;
            this.width = 190;
            this.height = 126;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___GuessNumberPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuessNumberPanel._watcherSetupUtil = _arg_1;
        }


        private function cancel():void
        {
            labelText.text = "";
            input.text = "";
            answer = -1;
            minNum = 0;
            maxNum = 0;
            funcname = null;
            hide();
        }

        public function set labelText(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._607740351labelText;
            if (_local_2 !== _arg_1)
            {
                this._607740351labelText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelText", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:GuessNumberPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuessNumberPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GuessNumberPanelWatcherSetupUtil");
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

        public function set input(_arg_1:TextInput):void
        {
            var _local_2:Object = this._100358090input;
            if (_local_2 !== _arg_1)
            {
                this._100358090input = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "input", _local_2, _arg_1));
            };
        }

        public function __btnCancel_click(_arg_1:MouseEvent):void
        {
            cancel();
        }

        private function _GuessNumberPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUESS_NUMBER_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnOK.label = _arg_1;
            }, "btnOK.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnCancel.label = _arg_1;
            }, "btnCancel.label");
            result[2] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        [Bindable(event="propertyChange")]
        public function get btnOK():BasicGlowButton
        {
            return (this._94069048btnOK);
        }

        [Bindable(event="propertyChange")]
        public function get labelText():RoundedLabel
        {
            return (this._607740351labelText);
        }

        override public function hide():void
        {
            visible = false;
            var _local_1:Event = new Event(DragableCanvas.EVENT_CLOSE);
            dispatchEvent(_local_1);
        }

        public function showGuessNumber(_arg_1:String, _arg_2:int, _arg_3:int=100, _arg_4:int=500):void
        {
            labelText.text = Language.GUESS_NUMBER_PANEL_U[1];
            answer = _arg_2;
            minNum = _arg_3;
            maxNum = _arg_4;
            funcname = _arg_1;
            input.text = "";
            input.restrict = "[0-9]";
            input.maxChars = 3;
            panelTitle.closeButtonVisible = true;
            btnCancel.visible = true;
            isMomoNpc = false;
            show();
        }

        [Bindable(event="propertyChange")]
        public function get input():TextInput
        {
            return (this._100358090input);
        }

        public function __input_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function __input_enter(_arg_1:FlexEvent):void
        {
            ok();
        }

        private function ok():void
        {
            if (input.text.length == 0)
            {
                return;
            };
            var _local_1:Number = Number(input.text);
            var _local_2:Core = Core.getInstance();
            if (((_local_1 < minNum) || (_local_1 > maxNum)))
            {
                _local_2.sysMsg(Language.GUESS_NUMBER_PANEL_U[2]);
                return;
            };
            if (_local_1 < answer)
            {
                _local_2.sysMsg(Language.GUESS_NUMBER_PANEL_U[3]);
                return;
            };
            if (_local_1 > answer)
            {
                _local_2.sysMsg(Language.GUESS_NUMBER_PANEL_U[4]);
                return;
            };
            if (!isMomoNpc)
            {
                _local_2.sysMsg(Language.GUESS_NUMBER_PANEL_U[5]);
            };
            _local_2.remote.npcScript(funcname);
            cancel();
        }

        public function showMomoGuessNumber(_arg_1:String, _arg_2:int, _arg_3:int=100, _arg_4:int=500):void
        {
            labelText.text = Language.GUESS_NUMBER_PANEL_U[1];
            answer = _arg_2;
            minNum = _arg_3;
            maxNum = _arg_4;
            funcname = _arg_1;
            input.text = "";
            input.restrict = "[0-9]";
            input.maxChars = 3;
            panelTitle.closeButtonVisible = true;
            btnCancel.visible = true;
            isMomoNpc = true;
            show();
        }

        public function __btnOK_click(_arg_1:MouseEvent):void
        {
            ok();
        }

        public function ___GuessNumberPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initNumber();
        }

        public function set btnCancel(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._117924854btnCancel;
            if (_local_2 !== _arg_1)
            {
                this._117924854btnCancel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnCancel", _local_2, _arg_1));
            };
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        public function set btnOK(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._94069048btnOK;
            if (_local_2 !== _arg_1)
            {
                this._94069048btnOK = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnOK", _local_2, _arg_1));
            };
        }

        private function _GuessNumberPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GUESS_NUMBER_PANEL_U[0];
            _local_1 = Language.INPUTPANEL_U[0];
            _local_1 = Language.INPUTPANEL_U[1];
        }

        [Bindable(event="propertyChange")]
        public function get btnCancel():BasicGlowButton
        {
            return (this._117924854btnCancel);
        }

        private function initNumber():void
        {
            answer = -1;
            minNum = 0;
            maxNum = 0;
            funcname = null;
            input.text = "";
        }

        override public function show():void
        {
            super.show();
            input.setFocus();
        }


    }
}//package com.qeedoo.ui.view.compDragable

