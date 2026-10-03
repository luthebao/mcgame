// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.InputPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.TextInput;
    import mx.controls.NumericStepper;
    import mx.controls.Image;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.AutoComplete;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.TextCombo;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.system.Core;
    import mx.collections.Sort;
    import mx.collections.SortField;
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

    public class InputPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _94069048btnOK:BasicGlowButton;
        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _100358090input:TextInput;
        private var _itemMaxNum:int = 1;
        private var _470699868inputNum:NumericStepper;
        private var _1969449099imgVerificationCode:Image;
        private var _itemId:int = 0;
        public var hideAble:Boolean = true;
        private var npcInRadar:ArrayCollection;
        private var _callBack:Function;
        private var _1707293932input_npc:AutoComplete;
        private var _837054846map_npc:AutoComplete;
        private var _106934lbl:RoundedLabel;
        private var _1360672740inputCombo:TextCombo;
        private var _117924854btnCancel:BasicGlowButton;
        private var _834773891idMaxNum:BasicGlowButton;

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
                        "id":"lbl",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":34,
                                "width":170,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgVerificationCode",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":52,
                                "y":30,
                                "width":85,
                                "height":30,
                                "visible":false
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
                                "y":62,
                                "width":128,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":AutoComplete,
                        "id":"input_npc",
                        "events":{
                            "enter":"__input_npc_enter",
                            "mouseDown":"__input_npc_mouseDown"
                        },
                        "stylesFactory":function ():void
                        {
                            this.borderThickness = 5;
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "labelField":"name",
                                "y":62,
                                "width":128,
                                "height":20,
                                "IsAutoComplete":true,
                                "IsfocusInDropDown":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":AutoComplete,
                        "id":"map_npc",
                        "events":{
                            "enter":"__map_npc_enter",
                            "mouseDown":"__map_npc_mouseDown"
                        },
                        "stylesFactory":function ():void
                        {
                            this.borderThickness = 5;
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "labelField":"name",
                                "y":62,
                                "width":128,
                                "height":20,
                                "IsAutoComplete":true,
                                "IsfocusInDropDown":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"inputNum",
                        "events":{"mouseDown":"__inputNum_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.backgroundAlpha = 0;
                            this.color = 0xFFFFFF;
                            this.cornerRadius = 0;
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":33.5,
                                "y":62,
                                "width":75,
                                "height":20,
                                "visible":false
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
                                "y":89,
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
                                "y":89,
                                "styleName":"BtnNormalRed",
                                "width":40,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextCombo,
                        "id":"inputCombo",
                        "events":{"mouseDown":"__inputCombo_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "editable":false,
                                "y":63,
                                "width":128,
                                "height":18,
                                "labelField":"name",
                                "x":31
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"idMaxNum",
                        "events":{"click":"__idMaxNum_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":115,
                                "y":62,
                                "width":45,
                                "styleName":"BtnNormalRed",
                                "height":19
                            });
                        }
                    })]
                });
            }
        });
        private var textArray:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function InputPanel()
        {
            mx_internal::_document = this;
            this.width = 190;
            this.height = 126;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___InputPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            InputPanel._watcherSetupUtil = _arg_1;
        }


        public function set map_npc(_arg_1:AutoComplete):void
        {
            var _local_2:Object = this._837054846map_npc;
            if (_local_2 !== _arg_1)
            {
                this._837054846map_npc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map_npc", _local_2, _arg_1));
            };
        }

        public function __map_npc_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set idMaxNum(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._834773891idMaxNum;
            if (_local_2 !== _arg_1)
            {
                this._834773891idMaxNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idMaxNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imgVerificationCode():Image
        {
            return (this._1969449099imgVerificationCode);
        }

        [Bindable(event="propertyChange")]
        public function get idMaxNum():BasicGlowButton
        {
            return (this._834773891idMaxNum);
        }

        override public function initialize():void
        {
            var target:InputPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _InputPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_InputPanelWatcherSetupUtil");
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

        public function set btnOK(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._94069048btnOK;
            if (_local_2 !== _arg_1)
            {
                this._94069048btnOK = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnOK", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get input_npc():AutoComplete
        {
            return (this._1707293932input_npc);
        }

        public function set imgVerificationCode(_arg_1:Image):void
        {
            var _local_2:Object = this._1969449099imgVerificationCode;
            if (_local_2 !== _arg_1)
            {
                this._1969449099imgVerificationCode = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgVerificationCode", _local_2, _arg_1));
            };
        }

        public function __btnCancel_click(_arg_1:MouseEvent):void
        {
            cancel();
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

        [Bindable(event="propertyChange")]
        public function get btnCancel():BasicGlowButton
        {
            return (this._117924854btnCancel);
        }

        public function showPositionInput(_arg_1:String, _arg_2:String, _arg_3:Function=null, _arg_4:ArrayCollection=null, _arg_5:String="", _arg_6:int=50, _arg_7:Boolean=true):void
        {
            var _local_8:String;
            _arg_4.filterFunction = null;
            _arg_4.refresh();
            map_npc.dataProvider = _arg_4;
            lbl.text = _arg_1;
            _callBack = _arg_3;
            imgVerificationCode.visible = false;
            input.visible = false;
            inputNum.visible = false;
            idMaxNum.visible = false;
            inputCombo.visible = false;
            input_npc.visible = false;
            map_npc.visible = true;
            this.hideAble = _arg_7;
            setButtons(true);
            show();
            x = ((stage.stageWidth - width) / 2);
            y = ((stage.stageHeight - height) / 2);
            map_npc.text = "";
            map_npc.prompt = "";
            map_npc.setFocus();
        }

        public function set lbl(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._106934lbl;
            if (_local_2 !== _arg_1)
            {
                this._106934lbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lbl", _local_2, _arg_1));
            };
        }

        private function setInputNumMax():void
        {
            inputNum.value = _itemMaxNum;
        }

        public function __inputNum_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        public function __idMaxNum_click(_arg_1:MouseEvent):void
        {
            setInputNumMax();
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

        [Bindable(event="propertyChange")]
        public function get btnOK():BasicGlowButton
        {
            return (this._94069048btnOK);
        }

        public function showNpcNameInput(_arg_1:String, _arg_2:String, _arg_3:Function=null, _arg_4:String="", _arg_5:int=50, _arg_6:Boolean=true):void
        {
            var _local_7:String;
            lbl.text = _arg_1;
            _callBack = _arg_3;
            imgVerificationCode.visible = false;
            input.visible = false;
            inputNum.visible = false;
            idMaxNum.visible = false;
            inputCombo.visible = false;
            input_npc.visible = true;
            map_npc.visible = false;
            this.hideAble = _arg_6;
            setButtons(true);
            show();
            x = ((stage.stageWidth - width) / 2);
            y = ((stage.stageHeight - height) / 2);
            input_npc.setFocus();
        }

        [Bindable(event="propertyChange")]
        public function get lbl():RoundedLabel
        {
            return (this._106934lbl);
        }

        private function setButtons(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                panelTitle.closeButtonVisible = true;
                btnCancel.visible = true;
                btnOK.x = 42.5;
            }
            else
            {
                panelTitle.closeButtonVisible = false;
                btnCancel.visible = false;
                btnOK.x = 70;
            };
        }

        public function showInputCombo(_arg_1:String, _arg_2:String, _arg_3:Function=null, _arg_4:String="", _arg_5:int=50, _arg_6:ArrayCollection=null, _arg_7:Boolean=true):void
        {
            if (!_arg_1)
            {
                _arg_1 = Language.INPUTPANEL_S[0];
            };
            if (!_arg_2)
            {
                _arg_2 = Language.INPUTPANEL_S[1];
            };
            if (_arg_1 == Language.INPUTPANEL_S[0])
            {
                _arg_1 = Language.INPUTPANEL_S[0];
            };
            if (_arg_2 == Language.INPUTPANEL_S[1])
            {
                _arg_2 = Language.INPUTPANEL_S[1];
            };
            _callBack = _arg_3;
            lbl.text = _arg_1;
            imgVerificationCode.visible = false;
            input.visible = false;
            inputNum.visible = false;
            inputCombo.visible = true;
            input_npc.visible = false;
            map_npc.visible = false;
            inputCombo.text = _arg_4;
            inputCombo.maxChars = _arg_5;
            inputCombo.dataProvider = _arg_6;
            this.hideAble = _arg_7;
            setButtons(true);
            show();
            x = ((stage.stageWidth - width) / 2);
            y = ((stage.stageHeight - height) / 2);
        }

        public function __input_enter(_arg_1:FlexEvent):void
        {
            ok();
        }

        public function showVerificationCode(_arg_1:Object, _arg_2:Function=null, _arg_3:Boolean=true):void
        {
            var _local_4:ByteArray = new ByteArray();
            var _local_5:int;
            while (_local_5 < _arg_1.length)
            {
                _local_4.writeByte(_arg_1[_local_5]);
                _local_5++;
            };
            imgVerificationCode.source = _local_4;
            input.displayAsPassword = false;
            lbl.text = "";
            panelTitle.text = Language.INPUTPANEL_S[2];
            _callBack = _arg_2;
            input.restrict = "[0-9a-z]";
            imgVerificationCode.visible = true;
            input.visible = true;
            inputNum.visible = false;
            idMaxNum.visible = false;
            inputCombo.visible = false;
            input_npc.visible = false;
            map_npc.visible = false;
            input.text = "";
            input.maxChars = 8;
            this.hideAble = _arg_3;
            setButtons(false);
            show();
            x = ((stage.stageWidth - width) / 2);
            y = ((stage.stageHeight - height) / 2);
        }

        public function set inputNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._470699868inputNum;
            if (_local_2 !== _arg_1)
            {
                this._470699868inputNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inputNum", _local_2, _arg_1));
            };
        }

        public function set inputCombo(_arg_1:TextCombo):void
        {
            var _local_2:Object = this._1360672740inputCombo;
            if (_local_2 !== _arg_1)
            {
                this._1360672740inputCombo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inputCombo", _local_2, _arg_1));
            };
        }

        override public function hide():void
        {
            visible = false;
            var _local_1:Event = new Event(DragableCanvas.EVENT_CLOSE);
            dispatchEvent(_local_1);
            input_npc.close();
            map_npc.close();
        }

        public function showInput(_arg_1:String, _arg_2:String, _arg_3:Function=null, _arg_4:String="", _arg_5:int=50, _arg_6:Boolean=true):void
        {
            var _local_8:String;
            var _local_9:*;
            if (_arg_1)
            {
                _local_8 = GamePredef.INPUT_PANEL_TITLE_SPLIT;
                _local_9 = _arg_1.split(_local_8);
                _arg_1 = _local_9[0];
                _itemId = _local_9[1];
            };
            if (!_arg_1)
            {
                _arg_1 = Language.INPUTPANEL_S[0];
            };
            if (!_arg_2)
            {
                _arg_2 = Language.INPUTPANEL_S[1];
            };
            if (_arg_1 == Language.INPUTPANEL_S[0])
            {
                _arg_1 = Language.INPUTPANEL_S[0];
            };
            var _local_7:String;
            if (_arg_1 == Language.DELETE_BY_PASS[0])
            {
                input.displayAsPassword = true;
                lbl.htmlText = _arg_1;
                _arg_5 = 6;
                _local_7 = "[0-9]";
            }
            else
            {
                input.displayAsPassword = false;
                lbl.text = _arg_1;
            };
            if (_arg_2 == Language.INPUTPANEL_S[1])
            {
                _arg_2 = Language.INPUTPANEL_S[1];
            };
            _callBack = _arg_3;
            input.restrict = _local_7;
            imgVerificationCode.visible = false;
            input.visible = true;
            inputNum.visible = false;
            idMaxNum.visible = false;
            inputCombo.visible = false;
            input_npc.visible = false;
            map_npc.visible = false;
            input.text = _arg_4;
            input.maxChars = _arg_5;
            this.hideAble = _arg_6;
            setButtons(true);
            show();
            x = ((stage.stageWidth - width) / 2);
            y = ((stage.stageHeight - height) / 2);
            input.selectionBeginIndex = 0;
            input.selectionEndIndex = input.text.length;
        }

        public function __inputCombo_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
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

        private function ok():void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_1:Core = Core.getInstance();
            if (((!(_itemId)) && (_local_1.haveBadWord(input.text))))
            {
                return;
            };
            if (_callBack != null)
            {
                if (input.visible)
                {
                    _callBack.apply(_callBack, [input.text]);
                }
                else
                {
                    if (inputNum.visible)
                    {
                        _callBack.apply(_callBack, [inputNum.value]);
                    }
                    else
                    {
                        if (input_npc.visible)
                        {
                            if (((!(input_npc.selectedItem)) && (input_npc.text.length == 0)))
                            {
                                return;
                            };
                            if (((input_npc.selectedItem) && (input_npc.selectedItem.hasOwnProperty("name"))))
                            {
                                _local_2 = input_npc.selectedItem.name;
                            }
                            else
                            {
                                if (input_npc.text.length > 0)
                                {
                                    _local_2 = input_npc.text;
                                };
                            };
                            _callBack.apply(_callBack, [_local_2]);
                        }
                        else
                        {
                            if (map_npc.visible)
                            {
                                if (((!(map_npc.selectedItem)) && (map_npc.text.length == 0)))
                                {
                                    return;
                                };
                                if (((map_npc.selectedItem) && (map_npc.selectedItem.hasOwnProperty("name"))))
                                {
                                    _local_3 = map_npc.selectedItem.name;
                                }
                                else
                                {
                                    if (map_npc.text.length > 0)
                                    {
                                        _local_3 = map_npc.text;
                                    };
                                };
                                _callBack.apply(_callBack, [_local_3]);
                            }
                            else
                            {
                                _callBack.apply(_callBack, [inputCombo.text]);
                            };
                        };
                    };
                };
            };
            cancel();
        }

        public function set input_npc(_arg_1:AutoComplete):void
        {
            var _local_2:Object = this._1707293932input_npc;
            if (_local_2 !== _arg_1)
            {
                this._1707293932input_npc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "input_npc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get inputCombo():TextCombo
        {
            return (this._1360672740inputCombo);
        }

        public function __input_npc_enter(_arg_1:FlexEvent):void
        {
            ok();
        }

        private function _InputPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[2];
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
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idMaxNum.label = _arg_1;
            }, "idMaxNum.label");
            result[3] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get inputNum():NumericStepper
        {
            return (this._470699868inputNum);
        }

        public function initNpcList():void
        {
            var _local_2:Object;
            var _local_3:Sort;
            var _local_4:Boolean;
            var _local_5:*;
            var _local_1:Core = Core.getInstance();
            npcInRadar = new ArrayCollection();
            for each (_local_2 in _local_1.data.gameData[GamePredef.TBL_NPC])
            {
                _local_4 = false;
                if (_local_2.fd > 0)
                {
                    for (_local_5 in npcInRadar)
                    {
                        if (npcInRadar.getItemAt(_local_5).name == _local_2.name)
                        {
                            _local_4 = true;
                            break;
                        };
                    };
                    ((!(_local_4)) && (npcInRadar.addItem(_local_2)));
                };
            };
            _local_3 = new Sort();
            _local_3.fields = [new SortField("type", true, false, true)];
            npcInRadar.sort = _local_3;
            npcInRadar.refresh();
            input_npc.dataProvider = npcInRadar;
        }

        public function __btnOK_click(_arg_1:MouseEvent):void
        {
            ok();
        }

        public function ___InputPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initNpcList();
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

        public function __map_npc_enter(_arg_1:FlexEvent):void
        {
            ok();
        }

        public function showInputNum(_arg_1:String="内容：", _arg_2:String="标题", _arg_3:Function=null, _arg_4:int=1, _arg_5:int=0, _arg_6:int=9999, _arg_7:Boolean=true):void
        {
            if (_arg_1 == "内容：")
            {
                _arg_1 = Language.INPUTPANEL_S[0];
            };
            if (!_arg_2)
            {
                _arg_2 = Language.INPUTPANEL_S[1];
            };
            if (_arg_1 == Language.INPUTPANEL_S[0])
            {
                _arg_1 = Language.INPUTPANEL_S[0];
            };
            if (_arg_2 == Language.INPUTPANEL_S[1])
            {
                _arg_2 = Language.INPUTPANEL_S[1];
            };
            _callBack = _arg_3;
            lbl.text = _arg_1;
            imgVerificationCode.visible = false;
            input.visible = false;
            inputNum.visible = true;
            idMaxNum.visible = true;
            inputCombo.visible = false;
            input_npc.visible = false;
            map_npc.visible = false;
            inputNum.value = _arg_4;
            inputNum.minimum = _arg_5;
            inputNum.maximum = _arg_6;
            this.hideAble = _arg_7;
            setButtons(true);
            _itemMaxNum = _arg_6;
            show();
            x = ((stage.stageWidth - width) / 2);
            y = ((stage.stageHeight - height) / 2);
        }

        private function cancel():void
        {
            input.text = "";
            inputNum.value = 1;
            inputNum.visible = false;
            panelTitle.text = Language.INPUTPANEL_U[2];
            hide();
        }

        public function __input_npc_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        override public function show():void
        {
            super.show();
            input.setFocus();
        }

        [Bindable(event="propertyChange")]
        public function get map_npc():AutoComplete
        {
            return (this._837054846map_npc);
        }

        private function _InputPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.INPUTPANEL_U[2];
            _local_1 = Language.INPUTPANEL_U[0];
            _local_1 = Language.INPUTPANEL_U[1];
            _local_1 = Language.INPUTPANEL_U[6];
        }


    }
}//package com.qeedoo.ui.view.compDragable

