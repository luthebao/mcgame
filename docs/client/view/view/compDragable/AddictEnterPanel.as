// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AddictEnterPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.ComboBox;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.game.system.Core;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.controls.Alert;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.utils.StringUtil;
    import flash.net.Responder;
    import flash.events.MouseEvent;
    import mx.events.ListEvent;
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

    public class AddictEnterPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _custom_question:String = "custom";
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1642224713idText1:BasicTxtButton;
        private var _878393397defaultQuestionIndex:uint = 0;
        private var _617127391idQuestion:ComboBox;
        public var _AddictEnterPanel_IntroText1:IntroText;
        private var _282075953idUserName:TextInput;
        private var _1642224716idText4:BasicTxtButton;
        private var _425268921idBtnSubmit:BasicGlowButton;
        private var _1642224715idText3:BasicTxtButton;
        private var _1241186495idClassify:TextInput;
        public var _AddictEnterPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1966962802idCustomQuestion:TextInput;
        private var _1642224714idText2:BasicTxtButton;
        private var _firstTimeVisible:Boolean = true;
        private var _1166427975idAnswer:TextInput;
        private var _core:Core;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":370,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AddictEnterPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"_AddictEnterPanel_IntroText1",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":110});
                        }
                    }), new UIComponentDescriptor({
                        "type":ComboBox,
                        "id":"idQuestion",
                        "events":{"change":"__idQuestion_change"},
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":80,
                                "y":163.5,
                                "width":190,
                                "labelField":"name",
                                "name":"question"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"idCustomQuestion",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":80,
                                "y":195.55,
                                "maxChars":20,
                                "name":"custom_question",
                                "width":190,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"idAnswer",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":80,
                                "y":195.55,
                                "maxChars":20,
                                "name":"answer",
                                "width":190
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"idUserName",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":80,
                                "y":231.5,
                                "name":"user_name",
                                "width":190
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"idClassify",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":80,
                                "y":263.5,
                                "name":"classify",
                                "width":190
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"idText1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16.2,
                                "y":163.5,
                                "width":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"idText2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16.2,
                                "y":197.5,
                                "width":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"idText3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16.2,
                                "y":231.5,
                                "width":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"idText4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16.2,
                                "y":265.5,
                                "width":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"idBtnSubmit",
                        "events":{"click":"__idBtnSubmit_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":124.95,
                                "y":305.5,
                                "styleName":"BtnStdGreen",
                                "width":50
                            });
                        }
                    })]
                });
            }
        });
        private var questions:Array = [{
            "name":Language.ANTIADDICTCANVAS_U[20],
            "value":""
        }, {
            "name":Language.ANTIADDICTCANVAS_U[21],
            "value":Language.ANTIADDICTCANVAS_U[21]
        }, {
            "name":Language.ANTIADDICTCANVAS_U[22],
            "value":Language.ANTIADDICTCANVAS_U[22]
        }, {
            "name":Language.ANTIADDICTCANVAS_U[23],
            "value":Language.ANTIADDICTCANVAS_U[23]
        }, {
            "name":Language.ANTIADDICTCANVAS_U[24],
            "value":Language.ANTIADDICTCANVAS_U[24]
        }, {
            "name":Language.ANTIADDICTCANVAS_U[25],
            "value":Language.ANTIADDICTCANVAS_U[25]
        }, {
            "name":Language.ANTIADDICTCANVAS_U[26],
            "value":Language.ANTIADDICTCANVAS_U[26]
        }, {
            "name":Language.ANTIADDICTCANVAS_U[27],
            "value":_custom_question
        }];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AddictEnterPanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundColor = 0xB5B5B5;
            };
            this.width = 300;
            this.height = 370;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AddictEnterPanel._watcherSetupUtil = _arg_1;
        }


        private function checkAddict(_arg_1:Array):Boolean
        {
            var _local_3:String;
            var _local_2:Boolean = true;
            for each (_local_3 in _arg_1)
            {
                if (!_local_3)
                {
                    _local_2 = false;
                    Alert.show(Language.ANTIADDICTCANVAS_U[30]);
                    break;
                };
            };
            return (_local_2);
        }

        public function set idCustomQuestion(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1966962802idCustomQuestion;
            if (_local_2 !== _arg_1)
            {
                this._1966962802idCustomQuestion = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idCustomQuestion", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idCustomQuestion():TextInput
        {
            return (this._1966962802idCustomQuestion);
        }

        public function set idClassify(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1241186495idClassify;
            if (_local_2 !== _arg_1)
            {
                this._1241186495idClassify = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idClassify", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:AddictEnterPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AddictEnterPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AddictEnterPanelWatcherSetupUtil");
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

        private function submitAddict():void
        {
            var _local_1:Array = new Array();
            _local_1["question"] = StringUtil.trim(idQuestion.selectedItem.value);
            _local_1["answer"] = StringUtil.trim(idAnswer.text);
            _local_1["user_name"] = StringUtil.trim(idUserName.text);
            _local_1["classify"] = StringUtil.trim(idClassify.text);
            if (_local_1["question"] == _custom_question)
            {
                _local_1["question"] = idCustomQuestion.text;
            };
            if (!checkAddict(_local_1))
            {
                return;
            };
            _core.remote.call("submitAddict", new Responder(onInputAddict), _local_1);
        }

        public function set idText1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1642224713idText1;
            if (_local_2 !== _arg_1)
            {
                this._1642224713idText1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idText1", _local_2, _arg_1));
            };
        }

        public function set idText2(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1642224714idText2;
            if (_local_2 !== _arg_1)
            {
                this._1642224714idText2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idText2", _local_2, _arg_1));
            };
        }

        public function set idText3(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1642224715idText3;
            if (_local_2 !== _arg_1)
            {
                this._1642224715idText3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idText3", _local_2, _arg_1));
            };
        }

        public function set idText4(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1642224716idText4;
            if (_local_2 !== _arg_1)
            {
                this._1642224716idText4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idText4", _local_2, _arg_1));
            };
        }

        public function __idBtnSubmit_click(_arg_1:MouseEvent):void
        {
            submitAddict();
        }

        private function set defaultQuestionIndex(_arg_1:uint):void
        {
            var _local_2:Object = this._878393397defaultQuestionIndex;
            if (_local_2 !== _arg_1)
            {
                this._878393397defaultQuestionIndex = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "defaultQuestionIndex", _local_2, _arg_1));
            };
        }

        public function __idQuestion_change(_arg_1:ListEvent):void
        {
            customQuestion();
        }

        [Bindable(event="propertyChange")]
        public function get idQuestion():ComboBox
        {
            return (this._617127391idQuestion);
        }

        [Bindable(event="propertyChange")]
        public function get idUserName():TextInput
        {
            return (this._282075953idUserName);
        }

        private function _AddictEnterPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ANTIADDICTCANVAS_U[19];
            _local_1 = Language.ANTIADDICTCANVAS_U[14];
            _local_1 = defaultQuestionIndex;
            _local_1 = questions;
            _local_1 = Language.ANTIADDICTCANVAS_U[17];
            _local_1 = Language.ANTIADDICTCANVAS_U[18];
            _local_1 = Language.ANTIADDICTCANVAS_U[15];
            _local_1 = Language.ANTIADDICTCANVAS_U[16];
            _local_1 = Language.CONTACTGMCANVAS_U[7];
        }

        private function onGetAddictQuestion(_arg_1:String):void
        {
            var _local_3:Object;
            var _local_2:String = _arg_1;
            trace(("onGetAddict questions len : " + questions.length));
            if (_arg_1)
            {
                for each (_local_3 in questions)
                {
                    if (_local_3.name == _local_2) break;
                    defaultQuestionIndex++;
                };
                if (questions.length == defaultQuestionIndex)
                {
                    defaultQuestionIndex--;
                };
            };
            trace(("questions len : " + _arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get idAnswer():TextInput
        {
            return (this._1166427975idAnswer);
        }

        [Bindable(event="propertyChange")]
        public function get idClassify():TextInput
        {
            return (this._1241186495idClassify);
        }

        [Bindable(event="propertyChange")]
        public function get idBtnSubmit():BasicGlowButton
        {
            return (this._425268921idBtnSubmit);
        }

        public function set idQuestion(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._617127391idQuestion;
            if (_local_2 !== _arg_1)
            {
                this._617127391idQuestion = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idQuestion", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idText1():BasicTxtButton
        {
            return (this._1642224713idText1);
        }

        [Bindable(event="propertyChange")]
        public function get idText2():BasicTxtButton
        {
            return (this._1642224714idText2);
        }

        [Bindable(event="propertyChange")]
        public function get idText3():BasicTxtButton
        {
            return (this._1642224715idText3);
        }

        private function _AddictEnterPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AddictEnterPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AddictEnterPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AddictEnterPanel_IntroText1.htmlText = _arg_1;
            }, "_AddictEnterPanel_IntroText1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (defaultQuestionIndex);
            }, function (_arg_1:int):void
            {
                idQuestion.selectedIndex = _arg_1;
            }, "idQuestion.selectedIndex");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (questions);
            }, function (_arg_1:Object):void
            {
                idQuestion.dataProvider = _arg_1;
            }, "idQuestion.dataProvider");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idText1.label = _arg_1;
            }, "idText1.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idText2.label = _arg_1;
            }, "idText2.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idText3.label = _arg_1;
            }, "idText3.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANTIADDICTCANVAS_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idText4.label = _arg_1;
            }, "idText4.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idBtnSubmit.label = _arg_1;
            }, "idBtnSubmit.label");
            result[8] = binding;
            return (result);
        }

        public function onSubmitAddictNotAdult(_arg_1:int):void
        {
        }

        private function initPanel():void
        {
            trace("initPanel");
            _core = Core.getInstance();
            _core.remote.call("getAddictQuestion", new Responder(onGetAddictQuestion));
        }

        private function onInputAddict(_arg_1:Array):void
        {
        }

        public function set idUserName(_arg_1:TextInput):void
        {
            var _local_2:Object = this._282075953idUserName;
            if (_local_2 !== _arg_1)
            {
                this._282075953idUserName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idUserName", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                if (_firstTimeVisible)
                {
                    _firstTimeVisible = false;
                    initPanel();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get idText4():BasicTxtButton
        {
            return (this._1642224716idText4);
        }

        public function set idAnswer(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1166427975idAnswer;
            if (_local_2 !== _arg_1)
            {
                this._1166427975idAnswer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idAnswer", _local_2, _arg_1));
            };
        }

        private function customQuestion():void
        {
            if (idQuestion.selectedItem.value == _custom_question)
            {
                idCustomQuestion.visible = true;
                idText2.y = (idAnswer.y = 231.5);
                idText3.y = (idUserName.y = 263.5);
                idText4.y = (idClassify.y = 295.5);
                idBtnSubmit.y = 334;
            }
            else
            {
                idCustomQuestion.visible = false;
                idText2.y = (idAnswer.y = 195.55);
                idText3.y = (idUserName.y = 231.5);
                idText4.y = (idClassify.y = 263.5);
                idBtnSubmit.y = 305.5;
            };
        }

        [Bindable(event="propertyChange")]
        private function get defaultQuestionIndex():uint
        {
            return (this._878393397defaultQuestionIndex);
        }

        public function set idBtnSubmit(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._425268921idBtnSubmit;
            if (_local_2 !== _arg_1)
            {
                this._425268921idBtnSubmit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idBtnSubmit", _local_2, _arg_1));
            };
        }

        public function submitAddictCallback(_arg_1:int):void
        {
            var _local_2:String = new String();
            switch (_arg_1)
            {
                case 0:
                    _local_2 = Language.ANTIADDICTCANVAS_U[34];
                    _core.sysMsg(Language.ANTIADDICTCANVAS_U[34]);
                    break;
                case 1:
                    _local_2 = Language.ANTIADDICTCANVAS_U[35];
                    _core.sysMsg(Language.ANTIADDICTCANVAS_U[35]);
                    break;
                case 2:
                    _local_2 = Language.ANTIADDICTCANVAS_U[36];
                    _core.sysMsg(Language.ANTIADDICTCANVAS_U[36]);
                    break;
                case -5:
                    _local_2 = Language.ANTIADDICTCANVAS_U[37];
                    break;
                case -11:
                    _local_2 = Language.ANTIADDICTCANVAS_U[30];
                    break;
                case -12:
                    _local_2 = Language.ANTIADDICTCANVAS_U[38];
                    break;
                case -3:
                    _local_2 = Language.ANTIADDICTCANVAS_U[39];
                    break;
                default:
                    _local_2 = Language.ANTIADDICTCANVAS_U[40];
            };
            Alert.show(_local_2);
            if (_arg_1 != 0)
            {
                idBtnSubmit.enabled = true;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

