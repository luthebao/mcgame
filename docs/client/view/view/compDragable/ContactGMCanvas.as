// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ContactGMCanvas

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import com.qeedoo.game.config.Language;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.TextInput;
    import mx.controls.TextArea;
    import mx.controls.DataGrid;
    import mx.containers.ViewStack;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import mx.events.ListEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
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

    public class ContactGMCanvas extends Canvas implements IBindingClient 
    {

        public static var NEW:int = 0;
        public static var PROCESSING:int = 1;
        public static var EDIT:int = 2;
        public static var STATE_PROCESSING:int = 0;
        public static var STATE_PROCESSED:int = 1;
        public static var SUBMIT_TIME:String = Language.CONTACTGMCANVAS_U[15];
        public static var HANDLE_TIME:String = Language.CONTACTGMCANVAS_U[17];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2004280302returnButton0:BasicGlowButton;
        private var _298601526titleLabel2:BasicTxtButton;
        private var _341748866returnButton:BasicGlowButton;
        private var _1793852334titleInput:TextInput;
        private var _831054186submitButton:BasicGlowButton;
        private var _1257428874contactInput:TextInput;
        private var _769574358contentDetail:TextArea;
        private var _73794761titleDetail:TextInput;
        private var _1454002652editButton:BasicGlowButton;
        public var _ContactGMCanvas_DataGrid1:DataGrid;
        public var _ContactGMCanvas_DataGrid2:DataGrid;
        private var _389150394contentText:TextArea;
        private var _1387827504refreshBtn1:BasicGlowButton;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var questionId:int = -1;
        private var _298601525titleLabel1:BasicTxtButton;
        private var _1554553085viewstack:ViewStack;
        public var _ContactGMCanvas_DataGridColumn1:DataGridColumn;
        public var _ContactGMCanvas_DataGridColumn2:DataGridColumn;
        public var _ContactGMCanvas_DataGridColumn3:DataGridColumn;
        public var _ContactGMCanvas_DataGridColumn4:DataGridColumn;
        public var _ContactGMCanvas_BasicTxtButton2:BasicTxtButton;
        public var _ContactGMCanvas_BasicTxtButton5:BasicTxtButton;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var cid:int = -1;
        private var _1387827505refreshBtn0:BasicGlowButton;
        private var _174231697contactDetail:TextInput;
        private var _1494701993commonQuestionCanvas:Canvas;
        private var question:Object = null;
        private var _631128101replyDetail:TextArea;
        private var _245695261stateLabel:BasicTxtButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"viewstack",
                        "stylesFactory":function ():void
                        {
                            this.left = "96";
                            this.bottom = "10";
                            this.right = "10";
                            this.top = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "selectedIndex":1,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"commonQuestionCanvas",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"Common Question",
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"newCanvas",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"titleLabel1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.top = "12";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_ContactGMCanvas_BasicTxtButton2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.top = "44";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"titleInput",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "10";
                                                    this.left = "92";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"contactInput",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "92";
                                                    this.top = "42";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"submitButton",
                                                "events":{"click":"__submitButton_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":50,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"contentText",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.top = "74";
                                                    this.bottom = "42";
                                                    this.right = "10";
                                                    this.color = 0xFFFFFF;
                                                    this.backgroundAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"styleName":"CSSBorder"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"stateLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.left = "10";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"editButton",
                                                "events":{"click":"__editButton_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                    this.top = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":50,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"returnButton",
                                                "events":{"click":"__returnButton_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":50,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"processedCanvas",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"_ContactGMCanvas_DataGrid1",
                                                "events":{"itemClick":"___ContactGMCanvas_DataGrid1_itemClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "42";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "columns":[_ContactGMCanvas_DataGridColumn1_i(), _ContactGMCanvas_DataGridColumn2_i()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"refreshBtn0",
                                                "events":{"click":"__refreshBtn0_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":50,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"processingCanvas",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"_ContactGMCanvas_DataGrid2",
                                                "events":{"itemClick":"___ContactGMCanvas_DataGrid2_itemClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "42";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "columns":[_ContactGMCanvas_DataGridColumn3_i(), _ContactGMCanvas_DataGridColumn4_i()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"refreshBtn1",
                                                "events":{"click":"__refreshBtn1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":50,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"detailCanvas",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"titleLabel2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.top = "12";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_ContactGMCanvas_BasicTxtButton5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.top = "44";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"titleDetail",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "10";
                                                    this.left = "92";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"editable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"contactDetail",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "92";
                                                    this.top = "42";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"editable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"contentDetail",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.top = "74";
                                                    this.right = "10";
                                                    this.bottom = "163";
                                                    this.color = 0xFFFFFF;
                                                    this.backgroundAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CSSBorder",
                                                        "editable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"replyDetail",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "42";
                                                    this.right = "10";
                                                    this.left = "10";
                                                    this.color = 0xFFFFFF;
                                                    this.backgroundAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":113,
                                                        "styleName":"CSSBorder",
                                                        "editable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"returnButton0",
                                                "events":{"click":"__returnButton0_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":50,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.top = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":78,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":77,
                                            "styleName":"BtnStdRed",
                                            "selected":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":77,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":77,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        private var _1647062330questionProcessedCollection:ArrayCollection = new ArrayCollection();
        private var _1220853527questionProcessingCollection:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ContactGMCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.fontSize = 12;
            };
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.addEventListener("creationComplete", ___ContactGMCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ContactGMCanvas._watcherSetupUtil = _arg_1;
        }


        public function set submitButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._831054186submitButton;
            if (_local_2 !== _arg_1)
            {
                this._831054186submitButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "submitButton", _local_2, _arg_1));
            };
        }

        private function onProcessingItemClick(_arg_1:Event):void
        {
            var _local_2:DataGrid = DataGrid(_arg_1.currentTarget);
            var _local_3:Object = _local_2.selectedItem;
            question = _local_3;
            titleInput.text = _local_3.title;
            contactInput.text = _local_3.contact;
            contentText.htmlText = (((_local_3.content + "<br/>") + SUBMIT_TIME) + _local_3.submitTime);
            setState(PROCESSING);
            viewstack.selectedIndex = 1;
        }

        public function set viewstack(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1554553085viewstack;
            if (_local_2 !== _arg_1)
            {
                this._1554553085viewstack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewstack", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get viewstack():ViewStack
        {
            return (this._1554553085viewstack);
        }

        public function updateQuestionList(_arg_1:int, _arg_2:Object):void
        {
            var _local_4:Object;
            if (!_arg_2)
            {
                return;
            };
            var _local_3:ArrayCollection = new ArrayCollection();
            for each (_local_4 in _arg_2)
            {
                _local_3.addItem(_local_4);
            };
            switch (_arg_1)
            {
                case STATE_PROCESSED:
                    questionProcessedCollection = _local_3;
                    return;
                case STATE_PROCESSING:
                    questionProcessingCollection = _local_3;
                    return;
            };
        }

        private function checkQuestion():Boolean
        {
            if (((titleInput.text == "") || (contentText.text == "")))
            {
                return (false);
            };
            return (true);
        }

        public function set returnButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._341748866returnButton;
            if (_local_2 !== _arg_1)
            {
                this._341748866returnButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "returnButton", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        private function _ContactGMCanvas_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ContactGMCanvas_DataGridColumn4 = _local_1;
            _local_1.width = 0.3;
            _local_1.dataField = "submitTime";
            BindingManager.executeBindings(this, "_ContactGMCanvas_DataGridColumn4", _ContactGMCanvas_DataGridColumn4);
            return (_local_1);
        }

        private function onClickSubmitCanvas():void
        {
            titleInput.text = "";
            contactInput.text = "";
            contentText.text = "";
            setState(NEW);
            viewstack.selectedIndex = 1;
            questionId = -1;
        }

        public function set contactInput(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1257428874contactInput;
            if (_local_2 !== _arg_1)
            {
                this._1257428874contactInput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contactInput", _local_2, _arg_1));
            };
        }

        public function __returnButton0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        private function init():void
        {
            setState(NEW);
        }

        public function set contactDetail(_arg_1:TextInput):void
        {
            var _local_2:Object = this._174231697contactDetail;
            if (_local_2 !== _arg_1)
            {
                this._174231697contactDetail = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contactDetail", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get questionProcessingCollection():ArrayCollection
        {
            return (this._1220853527questionProcessingCollection);
        }

        [Bindable(event="propertyChange")]
        public function get contentDetail():TextArea
        {
            return (this._769574358contentDetail);
        }

        private function set questionProcessingCollection(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1220853527questionProcessingCollection;
            if (_local_2 !== _arg_1)
            {
                this._1220853527questionProcessingCollection = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questionProcessingCollection", _local_2, _arg_1));
            };
        }

        public function set tabBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
        }

        [Bindable(event="propertyChange")]
        public function get titleLabel2():BasicTxtButton
        {
            return (this._298601526titleLabel2);
        }

        public function __refreshBtn0_click(_arg_1:MouseEvent):void
        {
            initQuestionList();
        }

        [Bindable(event="propertyChange")]
        public function get titleLabel1():BasicTxtButton
        {
            return (this._298601525titleLabel1);
        }

        public function __editButton_click(_arg_1:MouseEvent):void
        {
            onEdit();
        }

        [Bindable(event="propertyChange")]
        public function get contentText():TextArea
        {
            return (this._389150394contentText);
        }

        private function tabBtnClick(_arg_1:int):void
        {
            viewstack.selectedIndex = _arg_1;
            var _local_2:int = 1;
            while (_local_2 < (viewstack.numChildren - 1))
            {
                if (_local_2 == _arg_1)
                {
                    this[("tabBtn" + _local_2)].selected = true;
                }
                else
                {
                    this[("tabBtn" + _local_2)].selected = false;
                };
                _local_2++;
            };
            switch (_arg_1)
            {
                case 0:
                    return;
                case 1:
                    onClickSubmitCanvas();
                    return;
                case 2:
                    if (_core.player.id != cid)
                    {
                        initQuestionList();
                    };
                    return;
                case 3:
                    if (_core.player.id != cid)
                    {
                        initQuestionList();
                    };
                    return;
            };
        }

        private function setState(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case NEW:
                    submitButton.visible = true;
                    editButton.visible = false;
                    stateLabel.visible = false;
                    returnButton.visible = false;
                    titleInput.editable = true;
                    contactInput.editable = true;
                    contentText.editable = true;
                    return;
                case EDIT:
                    submitButton.visible = true;
                    editButton.visible = false;
                    stateLabel.visible = false;
                    returnButton.visible = true;
                    titleInput.editable = true;
                    contactInput.editable = true;
                    contentText.editable = true;
                    return;
                case PROCESSING:
                    submitButton.visible = false;
                    editButton.visible = true;
                    stateLabel.visible = true;
                    returnButton.visible = true;
                    titleInput.editable = false;
                    contactInput.editable = false;
                    contentText.editable = false;
                    return;
            };
        }

        private function setDelay(_arg_1:int):void
        {
            refreshBtn0.enabled = false;
            refreshBtn1.enabled = false;
            var _local_2:Timer = new Timer(_arg_1, 1);
            _local_2.addEventListener(TimerEvent.TIMER, setEnable);
            _local_2.start();
        }

        private function _ContactGMCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CONTACTGMCANVAS_U[5];
            _local_1 = Language.CONTACTGMCANVAS_U[6];
            _local_1 = Language.CONTACTGMCANVAS_U[7];
            _local_1 = Language.CONTACTGMCANVAS_U[8];
            _local_1 = Language.CONTACTGMCANVAS_U[9];
            _local_1 = Language.CONTACTGMCANVAS_U[10];
            _local_1 = questionProcessedCollection;
            _local_1 = Language.CONTACTGMCANVAS_U[11];
            _local_1 = Language.CONTACTGMCANVAS_U[12];
            _local_1 = Language.CONTACTGMCANVAS_U[16];
            _local_1 = questionProcessingCollection;
            _local_1 = Language.CONTACTGMCANVAS_U[11];
            _local_1 = Language.CONTACTGMCANVAS_U[12];
            _local_1 = Language.CONTACTGMCANVAS_U[16];
            _local_1 = Language.CONTACTGMCANVAS_U[5];
            _local_1 = Language.CONTACTGMCANVAS_U[6];
            _local_1 = Language.CONTACTGMCANVAS_U[10];
            _local_1 = Language.CONTACTGMCANVAS_U[1];
            _local_1 = Language.CONTACTGMCANVAS_U[2];
            _local_1 = Language.CONTACTGMCANVAS_U[3];
        }

        public function set commonQuestionCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1494701993commonQuestionCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1494701993commonQuestionCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "commonQuestionCanvas", _local_2, _arg_1));
            };
        }

        public function __submitButton_click(_arg_1:MouseEvent):void
        {
            onSubmit();
        }

        public function set contentDetail(_arg_1:TextArea):void
        {
            var _local_2:Object = this._769574358contentDetail;
            if (_local_2 !== _arg_1)
            {
                this._769574358contentDetail = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contentDetail", _local_2, _arg_1));
            };
        }

        private function _ContactGMCanvas_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ContactGMCanvas_DataGridColumn3 = _local_1;
            _local_1.width = 0.7;
            _local_1.dataField = "title";
            BindingManager.executeBindings(this, "_ContactGMCanvas_DataGridColumn3", _ContactGMCanvas_DataGridColumn3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get titleInput():TextInput
        {
            return (this._1793852334titleInput);
        }

        [Bindable(event="propertyChange")]
        public function get submitButton():BasicGlowButton
        {
            return (this._831054186submitButton);
        }

        public function __returnButton_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
        }

        public function set titleLabel2(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._298601526titleLabel2;
            if (_local_2 !== _arg_1)
            {
                this._298601526titleLabel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleLabel2", _local_2, _arg_1));
            };
        }

        public function set titleLabel1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._298601525titleLabel1;
            if (_local_2 !== _arg_1)
            {
                this._298601525titleLabel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleLabel1", _local_2, _arg_1));
            };
        }

        public function ___ContactGMCanvas_DataGrid2_itemClick(_arg_1:ListEvent):void
        {
            onProcessingItemClick(_arg_1);
        }

        public function __refreshBtn1_click(_arg_1:MouseEvent):void
        {
            initQuestionList();
        }

        private function setEnable(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(TimerEvent.TIMER, setEnable);
            refreshBtn0.enabled = true;
            refreshBtn1.enabled = true;
        }

        [Bindable(event="propertyChange")]
        public function get contactInput():TextInput
        {
            return (this._1257428874contactInput);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        public function set contentText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._389150394contentText;
            if (_local_2 !== _arg_1)
            {
                this._389150394contentText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contentText", _local_2, _arg_1));
            };
        }

        private function onEdit():void
        {
            setState(EDIT);
            questionId = question.id;
            contentText.text = question.content;
        }

        [Bindable(event="propertyChange")]
        public function get contactDetail():TextInput
        {
            return (this._174231697contactDetail);
        }

        public function set titleDetail(_arg_1:TextInput):void
        {
            var _local_2:Object = this._73794761titleDetail;
            if (_local_2 !== _arg_1)
            {
                this._73794761titleDetail = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleDetail", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        override public function initialize():void
        {
            var target:ContactGMCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ContactGMCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ContactGMCanvasWatcherSetupUtil");
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
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get returnButton():BasicGlowButton
        {
            return (this._341748866returnButton);
        }

        private function set questionProcessedCollection(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1647062330questionProcessedCollection;
            if (_local_2 !== _arg_1)
            {
                this._1647062330questionProcessedCollection = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questionProcessedCollection", _local_2, _arg_1));
            };
        }

        private function _ContactGMCanvas_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ContactGMCanvas_DataGridColumn2 = _local_1;
            _local_1.width = 0.3;
            _local_1.dataField = "submitTime";
            BindingManager.executeBindings(this, "_ContactGMCanvas_DataGridColumn2", _ContactGMCanvas_DataGridColumn2);
            return (_local_1);
        }

        public function set refreshBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1387827505refreshBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1387827505refreshBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshBtn0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get commonQuestionCanvas():Canvas
        {
            return (this._1494701993commonQuestionCanvas);
        }

        public function set refreshBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1387827504refreshBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1387827504refreshBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshBtn1", _local_2, _arg_1));
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        public function set replyDetail(_arg_1:TextArea):void
        {
            var _local_2:Object = this._631128101replyDetail;
            if (_local_2 !== _arg_1)
            {
                this._631128101replyDetail = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "replyDetail", _local_2, _arg_1));
            };
        }

        public function ___ContactGMCanvas_DataGrid1_itemClick(_arg_1:ListEvent):void
        {
            onProcessedItemClick(_arg_1);
        }

        public function set editButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1454002652editButton;
            if (_local_2 !== _arg_1)
            {
                this._1454002652editButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "editButton", _local_2, _arg_1));
            };
        }

        private function onProcessedItemClick(_arg_1:Event):void
        {
            var _local_2:DataGrid = DataGrid(_arg_1.currentTarget);
            var _local_3:Object = _local_2.selectedItem;
            question = _local_3;
            titleDetail.text = _local_3.title;
            contactDetail.text = _local_3.contact;
            contentDetail.htmlText = (((_local_3.content + "<br/>") + SUBMIT_TIME) + _local_3.submitTime);
            replyDetail.htmlText = (((_local_3.reply + "<br/>") + HANDLE_TIME) + _local_3.handleTime);
            viewstack.selectedIndex = 4;
        }

        public function ___ContactGMCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get refreshBtn0():BasicGlowButton
        {
            return (this._1387827505refreshBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get refreshBtn1():BasicGlowButton
        {
            return (this._1387827504refreshBtn1);
        }

        private function initQuestionList():void
        {
            _core.player.getQuestionList(STATE_PROCESSED);
            _core.player.getQuestionList(STATE_PROCESSING);
            cid = _core.player.id;
            setDelay(3000);
        }

        private function _ContactGMCanvas_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ContactGMCanvas_DataGridColumn1 = _local_1;
            _local_1.width = 0.7;
            _local_1.dataField = "title";
            BindingManager.executeBindings(this, "_ContactGMCanvas_DataGridColumn1", _ContactGMCanvas_DataGridColumn1);
            return (_local_1);
        }

        private function onSubmit():void
        {
            if (checkQuestion() == false)
            {
                Alert.show(Language.CONTACTGMCANVAS_U[14], Language.CONTACTGMCANVAS_U[13], Alert.YES);
                return;
            };
            var _local_1:Object = new Object();
            _local_1.id = questionId;
            _local_1.title = titleInput.text;
            _local_1.contact = contactInput.text;
            _local_1.content = contentText.text;
            _core.player.submitQuestion(_local_1);
            callLater(tabBtnClick, [3]);
        }

        [Bindable(event="propertyChange")]
        public function get titleDetail():TextInput
        {
            return (this._73794761titleDetail);
        }

        [Bindable(event="propertyChange")]
        public function get replyDetail():TextArea
        {
            return (this._631128101replyDetail);
        }

        [Bindable(event="propertyChange")]
        public function get editButton():BasicGlowButton
        {
            return (this._1454002652editButton);
        }

        public function set titleInput(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1793852334titleInput;
            if (_local_2 !== _arg_1)
            {
                this._1793852334titleInput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleInput", _local_2, _arg_1));
            };
        }

        public function set returnButton0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2004280302returnButton0;
            if (_local_2 !== _arg_1)
            {
                this._2004280302returnButton0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "returnButton0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stateLabel():BasicTxtButton
        {
            return (this._245695261stateLabel);
        }

        [Bindable(event="propertyChange")]
        public function get returnButton0():BasicGlowButton
        {
            return (this._2004280302returnButton0);
        }

        private function _ContactGMCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                titleLabel1.htmlText = _arg_1;
            }, "titleLabel1.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ContactGMCanvas_BasicTxtButton2.text = _arg_1;
            }, "_ContactGMCanvas_BasicTxtButton2.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                submitButton.label = _arg_1;
            }, "submitButton.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                stateLabel.text = _arg_1;
            }, "stateLabel.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                editButton.label = _arg_1;
            }, "editButton.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                returnButton.label = _arg_1;
            }, "returnButton.label");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (questionProcessedCollection);
            }, function (_arg_1:Object):void
            {
                _ContactGMCanvas_DataGrid1.dataProvider = _arg_1;
            }, "_ContactGMCanvas_DataGrid1.dataProvider");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ContactGMCanvas_DataGridColumn1.headerText = _arg_1;
            }, "_ContactGMCanvas_DataGridColumn1.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ContactGMCanvas_DataGridColumn2.headerText = _arg_1;
            }, "_ContactGMCanvas_DataGridColumn2.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                refreshBtn0.label = _arg_1;
            }, "refreshBtn0.label");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (questionProcessingCollection);
            }, function (_arg_1:Object):void
            {
                _ContactGMCanvas_DataGrid2.dataProvider = _arg_1;
            }, "_ContactGMCanvas_DataGrid2.dataProvider");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ContactGMCanvas_DataGridColumn3.headerText = _arg_1;
            }, "_ContactGMCanvas_DataGridColumn3.headerText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ContactGMCanvas_DataGridColumn4.headerText = _arg_1;
            }, "_ContactGMCanvas_DataGridColumn4.headerText");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                refreshBtn1.label = _arg_1;
            }, "refreshBtn1.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                titleLabel2.htmlText = _arg_1;
            }, "titleLabel2.htmlText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ContactGMCanvas_BasicTxtButton5.text = _arg_1;
            }, "_ContactGMCanvas_BasicTxtButton5.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                returnButton0.label = _arg_1;
            }, "returnButton0.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONTACTGMCANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[19] = binding;
            return (result);
        }

        public function set stateLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._245695261stateLabel;
            if (_local_2 !== _arg_1)
            {
                this._245695261stateLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateLabel", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        [Bindable(event="propertyChange")]
        private function get questionProcessedCollection():ArrayCollection
        {
            return (this._1647062330questionProcessedCollection);
        }


    }
}//package com.qeedoo.ui.view.compDragable

