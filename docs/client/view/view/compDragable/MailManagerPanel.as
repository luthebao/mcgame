// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MailManagerPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.ItemSlotMail;
    import mx.controls.TextInput;
    import mx.collections.ArrayCollection;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.Currency;
    import mx.controls.CheckBox;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.DescriptionLabel;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.ListEvent;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import mx.core.ClassFactory;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.RendererImage;
    import com.adobe.crypto.MD5;
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

    public class MailManagerPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _MailManagerPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _95727488doDel:BasicGlowButton;
        public var _MailManagerPanel_DataGridColumn10:DataGridColumn;
        private var senderId:Number;
        private var _830952030mailTab:ViewStack;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _3242771item:ItemSlotMail;
        private var PAGE_MAX_ITEM_NUM:* = 12;
        private var _1867885268subject:TextInput;
        private var pageMyMailAC:ArrayCollection;
        private var _557789977mailDataGrid:DataGrid;
        private var _940964344codGold:Currency;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var firstTimeFlag:int = 0;
        private var _678360261presentMoney:Currency;
        private var _898785680codCheck:CheckBox;
        private var _10286204mailText:TextArea;
        private var _2085075210mailSystemDataGrid:DataGrid;
        private var _1335493226delAll:CheckBox;
        private var myMailAC:ArrayCollection;
        public var mailList:Object;
        private var _668907789presentCheck:CheckBox;
        private var delMailId:Number;
        public var _MailManagerPanel_DescriptionLabel1:DescriptionLabel;
        private var _889333208codMoney:Currency;
        private var _1225222213presentGold:Currency;
        public var _MailManagerPanel_DataGridColumn3:DataGridColumn;
        public var _MailManagerPanel_DataGridColumn4:DataGridColumn;
        public var _MailManagerPanel_DataGridColumn5:DataGridColumn;
        public var _MailManagerPanel_DataGridColumn8:DataGridColumn;
        public var _MailManagerPanel_DataGridColumn9:DataGridColumn;
        public var _MailManagerPanel_BasicTxtButton1:BasicTxtButton;
        public var _MailManagerPanel_BasicTxtButton2:BasicTxtButton;
        public var _MailManagerPanel_BasicTxtButton3:BasicTxtButton;
        private var idArr:Array;
        private var mailSystemAC:ArrayCollection;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var pageMailSystemAC:ArrayCollection;
        private var itemPageNo:int = 1;
        public var _MailManagerPanel_Canvas1:Canvas;
        public var _MailManagerPanel_Canvas2:Canvas;
        public var _MailManagerPanel_Canvas3:Canvas;
        private var _607339634pageSelector:PageSelector;
        public var _MailManagerPanel_BasicDelayButton1:BasicDelayButton;
        private var currentTime:Number;
        private var _808719889receiver:TextInput;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":280,
                    "height":395,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MailManagerPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":DescriptionLabel,
                        "id":"_MailManagerPanel_DescriptionLabel1",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "width":250,
                                "height":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"mailTab",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "80";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "resizeToContent":true,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_MailManagerPanel_Canvas1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"mailSystemDataGrid",
                                                "events":{
                                                    "itemClick":"__mailSystemDataGrid_itemClick",
                                                    "mouseMove":"__mailSystemDataGrid_mouseMove"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.alternatingItemColors = [0xFFFFFF, 0xFFFFFF];
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "height":0x0100,
                                                        "columns":[_MailManagerPanel_DataGridColumn1_c(), _MailManagerPanel_DataGridColumn2_c(), _MailManagerPanel_DataGridColumn3_i(), _MailManagerPanel_DataGridColumn4_i(), _MailManagerPanel_DataGridColumn5_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_MailManagerPanel_Canvas2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "creationPolicy":"all",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"mailDataGrid",
                                                "events":{
                                                    "itemClick":"__mailDataGrid_itemClick",
                                                    "mouseMove":"__mailDataGrid_mouseMove"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.alternatingItemColors = [0xFFFFFF, 0xFFFFFF];
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "columns":[_MailManagerPanel_DataGridColumn6_c(), _MailManagerPanel_DataGridColumn7_c(), _MailManagerPanel_DataGridColumn8_i(), _MailManagerPanel_DataGridColumn9_i(), _MailManagerPanel_DataGridColumn10_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_MailManagerPanel_Canvas3",
                                    "events":{"mouseDown":"___MailManagerPanel_Canvas3_mouseDown"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"receiver",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":19,
                                                        "width":168,
                                                        "y":10,
                                                        "x":69
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"subject",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":19,
                                                        "width":168,
                                                        "y":36,
                                                        "x":69,
                                                        "enabled":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"mailText",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CSSBorder",
                                                        "height":125,
                                                        "y":63,
                                                        "width":227,
                                                        "x":12,
                                                        "enabled":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotMail,
                                                "id":"item",
                                                "events":{"doubleClick":"__item_doubleClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "13";
                                                    this.top = "220";
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "doubleClickEnabled":true,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"presentCheck",
                                                "events":{"click":"__presentCheck_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "71";
                                                    this.top = "193.05";
                                                    this.fontSize = 12;
                                                    this.fontWeight = "bold";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"codCheck",
                                                "events":{"click":"__codCheck_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":160,
                                                        "y":192
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"presentMoney",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inputEnabled":false,
                                                        "x":59,
                                                        "y":218,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"presentGold",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inputEnabled":false,
                                                        "x":59,
                                                        "y":240,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"codMoney",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inputEnabled":false,
                                                        "x":147,
                                                        "y":218,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"codGold",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inputEnabled":false,
                                                        "x":147,
                                                        "y":240,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_MailManagerPanel_BasicDelayButton1",
                                                "events":{"click":"___MailManagerPanel_BasicDelayButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":189,
                                                        "y":265,
                                                        "styleName":"BtnStdRed",
                                                        "width":48.4
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MailManagerPanel_BasicTxtButton1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":11,
                                                        "width":50,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MailManagerPanel_BasicTxtButton2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":36,
                                                        "width":50,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MailManagerPanel_BasicTxtButton3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":196,
                                                        "width":38,
                                                        "height":18
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"delAll",
                        "events":{"click":"__delAll_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                            this.bottom = "20";
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelector,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                            this.horizontalCenter = "41";
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"doDel",
                        "events":{"click":"__doDel_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                            this.left = "67";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"HorizontalTab"});
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":60,
                                "x":25,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":59
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
        private var pageAC:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MailManagerPanel()
        {
            mx_internal::_document = this;
            this.width = 280;
            this.height = 395;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MailManagerPanel._watcherSetupUtil = _arg_1;
        }


        public function ___MailManagerPanel_Canvas3_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function __mailSystemDataGrid_itemClick(_arg_1:ListEvent):void
        {
            showMail(_arg_1);
        }

        public function set presentCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._668907789presentCheck;
            if (_local_2 !== _arg_1)
            {
                this._668907789presentCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "presentCheck", _local_2, _arg_1));
            };
        }

        private function _MailManagerPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailManagerPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "subject";
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory4_c();
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_MailManagerPanel_DataGridColumn4", _MailManagerPanel_DataGridColumn4);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get codMoney():Currency
        {
            return (this._889333208codMoney);
        }

        public function __doDel_click(_arg_1:MouseEvent):void
        {
            delMails();
        }

        public function set item(_arg_1:ItemSlotMail):void
        {
            var _local_2:Object = this._3242771item;
            if (_local_2 !== _arg_1)
            {
                this._3242771item = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item", _local_2, _arg_1));
            };
        }

        private function _MailManagerPanel_ClassFactory8_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MailManagerPanel_inlineComponent7;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function _MailManagerPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailManagerPanel_DataGridColumn10 = _local_1;
            _local_1.width = 32;
            _local_1.dataField = "remainDate";
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory10_c();
            BindingManager.executeBindings(this, "_MailManagerPanel_DataGridColumn10", _MailManagerPanel_DataGridColumn10);
            return (_local_1);
        }

        public function updateCurrentMail(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (mailList[_arg_1.id].senderId > 0)
            {
                for (_local_3 in myMailAC)
                {
                    if (_arg_1.id == myMailAC[_local_3].id)
                    {
                        setMailState(myMailAC[_local_3], mailList[_arg_1.id]);
                        pageSelector.refreshPage();
                        return;
                    };
                };
                return;
            };
            for (_local_2 in mailSystemAC)
            {
                if (_arg_1.id == mailSystemAC[_local_2].id)
                {
                    setMailState(mailSystemAC[_local_2], mailList[_arg_1.id]);
                    pageSelector.refreshPage();
                    return;
                };
            };
        }

        public function set codMoney(_arg_1:Currency):void
        {
            var _local_2:Object = this._889333208codMoney;
            if (_local_2 !== _arg_1)
            {
                this._889333208codMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "codMoney", _local_2, _arg_1));
            };
        }

        private function delMails():void
        {
            var _local_2:Object;
            idArr = new Array();
            var _local_1:Boolean;
            for each (_local_2 in pageAC)
            {
                if (1 == _local_2.delCheckBox)
                {
                    idArr.push(_local_2.id);
                    if ((((_local_2.mailData.money > 0) || (_local_2.mailData.gold > 0)) || (((_local_2.mailData.itemType > 0) && (_local_2.mailData.itemId > 0)) && (_local_2.mailData.stackNum > 0))))
                    {
                        _local_1 = true;
                    };
                };
            };
            if (idArr.length <= 0)
            {
                Alert.show(Language.MAILMANAGERPANEL_S[22]);
                return;
            };
            if (_local_1)
            {
                if (mailTab.selectedIndex)
                {
                    Alert.show(Language.MAILMANAGERPANEL_S[19], "", 3, this, delMailsHandler);
                }
                else
                {
                    Alert.show(Language.MAILMANAGERPANEL_S[18], "", 3, this, delMailsHandler);
                };
            }
            else
            {
                Alert.show(Language.MAILMANAGERPANEL_S[17], "", 3, this, delMailsHandler);
            };
        }

        private function showMail(_arg_1:ListEvent):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_MAIL);
            _local_2.showMail(_arg_1.target.selectedItem.mailData);
            _local_2.startFollow(this);
        }

        public function initNewMail(_arg_1:String=""):void
        {
            if (_arg_1 != "")
            {
                receiver.text = _arg_1;
                tabBtnClick(2);
                visible = true;
            };
            subject.text = "";
            mailText.text = "";
            presentCheck.selected = false;
            presentMoney.value = 0;
            presentGold.value = 0;
            codCheck.selected = false;
            codMoney.value = 0;
            codGold.value = 0;
            presentMoney.inputEnabled = false;
            presentGold.inputEnabled = false;
            codMoney.inputEnabled = false;
            codGold.inputEnabled = false;
            item.clean();
            presentMoney.maxValue = _core.player.money;
            presentGold.maxValue = _core.player.gold;
        }

        public function set subject(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1867885268subject;
            if (_local_2 !== _arg_1)
            {
                this._1867885268subject = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "subject", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mailTab():ViewStack
        {
            return (this._830952030mailTab);
        }

        private function _MailManagerPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailManagerPanel_DataGridColumn3 = _local_1;
            _local_1.width = 50;
            _local_1.dataField = "senderName";
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory3_c();
            BindingManager.executeBindings(this, "_MailManagerPanel_DataGridColumn3", _MailManagerPanel_DataGridColumn3);
            return (_local_1);
        }

        public function delMail(_arg_1:int):void
        {
            var _local_2:Object = mailList[_arg_1];
            if (_local_2 != null)
            {
                if ((((_local_2.money > 0) || (_local_2.gold > 0)) || (((_local_2.itemType > 0) && (_local_2.itemId > 0)) && (_local_2.stackNum > 0))))
                {
                    if (_local_2.senderId > 0)
                    {
                        delMailId = _arg_1;
                        Alert.show(Language.MAILMANAGERPANEL_S[5], "", 3, this, delMailHandler);
                    }
                    else
                    {
                        delMailId = _arg_1;
                        Alert.show(Language.MAILMANAGERPANEL_S[6], "", 3, this, delMailHandler);
                    };
                }
                else
                {
                    delMailId = _arg_1;
                    Alert.show(Language.MAILMANAGERPANEL_S[7], "", 3, this, delMailHandler);
                };
            };
        }

        private function _MailManagerPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAILMANAGERPANEL_U[4];
            _local_1 = Language.MAILMANAGERPANEL_S[15];
            _local_1 = Language.MAIL_MANAGER_PANEL_U[1];
            _local_1 = Language.MAILMANAGERPANEL_S[8];
            _local_1 = Language.MAILMANAGERPANEL_S[9];
            _local_1 = Language.MAILMANAGERPANEL_S[10];
            _local_1 = Language.MAIL_MANAGER_PANEL_U[2];
            _local_1 = Language.MAILMANAGERPANEL_S[8];
            _local_1 = Language.MAILMANAGERPANEL_S[9];
            _local_1 = Language.MAILMANAGERPANEL_S[10];
            _local_1 = Language.MAIL_MANAGER_PANEL_U[3];
            _local_1 = Language.MAILMANAGERPANEL_S[11];
            _local_1 = Language.MAILMANAGERPANEL_S[12];
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Language.MAILMANAGERPANEL_U[0];
            _local_1 = Language.MAILMANAGERPANEL_U[5];
            _local_1 = Language.MAILMANAGERPANEL_U[6];
            _local_1 = Language.MAILMANAGERPANEL_U[7];
            _local_1 = Language.MAILMANAGERPANEL_U[8];
            _local_1 = Language.MAILMANAGERPANEL_U[9];
            _local_1 = Language.MAILMANAGERPANEL_U[10];
            _local_1 = Language.MAILMANAGERPANEL_U[1];
            _local_1 = Language.MAILMANAGERPANEL_U[2];
            _local_1 = Language.MAILMANAGERPANEL_U[3];
        }

        public function chooseMail(_arg_1:int):void
        {
            var _local_2:int;
            if (0 == mailTab.selectedIndex)
            {
                _local_2 = (mailSystemDataGrid.selectedIndex + (pageSelector.pageNo * PAGE_MAX_ITEM_NUM));
                pageAC[_local_2].delCheckBox = _arg_1;
            }
            else
            {
                if (1 == mailTab.selectedIndex)
                {
                    _local_2 = (mailDataGrid.selectedIndex + (pageSelector.pageNo * PAGE_MAX_ITEM_NUM));
                    pageAC[_local_2].delCheckBox = _arg_1;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get codCheck():CheckBox
        {
            return (this._898785680codCheck);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        private function _MailManagerPanel_ClassFactory7_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MailManagerPanel_inlineComponent6;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function ___MailManagerPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            addMail();
        }

        private function delMailHandler(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("delMail", new Responder(onDelMail), delMailId);
                _core.view.getUI(ViewManager.PANEL_MAIL).visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        private function _MailManagerPanel_DataGridColumn2_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.width = 21;
            _local_1.dataField = "delCheckBox";
            _local_1.headerText = "";
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory2_c();
            return (_local_1);
        }

        public function __mailDataGrid_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function _MailManagerPanel_ClassFactory6_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MailManagerPanel_inlineComponent5;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function set mailTab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._830952030mailTab;
            if (_local_2 !== _arg_1)
            {
                this._830952030mailTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mailTab", _local_2, _arg_1));
            };
        }

        private function initPageSelector():void
        {
            var _local_1:int;
            if (pageAC.length >= PAGE_MAX_ITEM_NUM)
            {
                _local_1 = PAGE_MAX_ITEM_NUM;
            }
            else
            {
                _local_1 = pageAC.length;
            };
            var _local_2:int;
            while (_local_2 < _local_1)
            {
                pageMyMailAC.addItem(pageAC.getItemAt(_local_2));
                _local_2++;
            };
            pageSelector.onPageChanged = pageChange;
            pageSelector.onPageCleared = pageClear;
            pageSelector.initPageSeletor(pageAC.length, PAGE_MAX_ITEM_NUM);
        }

        public function __mailDataGrid_itemClick(_arg_1:ListEvent):void
        {
            showMail(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get presentMoney():Currency
        {
            return (this._678360261presentMoney);
        }

        private function setMailState(_arg_1:Object, _arg_2:Object):void
        {
            var _local_3:Class;
            var _local_4:int;
            if (_arg_2.readDate == -1)
            {
                if (_arg_2.itemType == -1)
                {
                    _local_3 = ResManager.ICON_MAIL_OPENED;
                }
                else
                {
                    _local_3 = ResManager.ICON_MAIL_ITEM_OPENED;
                };
            }
            else
            {
                if (_arg_2.itemType == -1)
                {
                    _local_3 = ResManager.ICON_MAIL_NORMAL;
                }
                else
                {
                    _local_3 = ResManager.ICON_MAIL_ITEM_NORMAL;
                };
            };
            if (_arg_2.readDate == -1)
            {
                _local_4 = int((GamePredef.MAILDATE[0] - ((currentTime - _arg_2.date) / 86400000)));
            }
            else
            {
                _local_4 = int((GamePredef.MAILDATE[1] - ((currentTime - _arg_2.readDate) / 86400000)));
            };
            var _local_5:String = Language.MAILMANAGERPANEL_S[14].toString().replace("{remainDate}", _local_4);
            _arg_1.icon = _local_3;
            _arg_1.remainDate = _local_5;
        }

        public function __codCheck_click(_arg_1:MouseEvent):void
        {
            codRadioClick();
        }

        private function _MailManagerPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.width = 21;
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory1_c();
            _local_1.dataField = "icon";
            _local_1.headerText = "";
            return (_local_1);
        }

        public function set codCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._898785680codCheck;
            if (_local_2 !== _arg_1)
            {
                this._898785680codCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "codCheck", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:int;
            var _local_3:*;
            super.visible = _arg_1;
            if (((_arg_1 == true) && (firstTimeFlag == 0)))
            {
                initView();
            };
            if (((_arg_1 == false) && (_core.player)))
            {
                if (!initialized)
                {
                    addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                    return;
                };
                if ((((!(item.type == -1)) && (!(item.giid == -1))) && (!(item.stackNum == -1))))
                {
                    rmItemView();
                };
                initNewMail();
                _core.remote.closeMail();
            };
            if ((((this.mailList) && (!(this.mailList == ""))) && (_arg_1 == true)))
            {
                _local_2 = 0;
                for each (_local_3 in mailList)
                {
                    _local_2++;
                };
                if (_local_2 > 99)
                {
                    _core.sysMidNote(Language.MAILMANAGERPANEL_S[23]);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get mailDataGrid():DataGrid
        {
            return (this._557789977mailDataGrid);
        }

        public function __item_doubleClick(_arg_1:MouseEvent):void
        {
            rmItemView();
        }

        private function _MailManagerPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailManagerPanel_DataGridColumn9 = _local_1;
            _local_1.dataField = "subject";
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory9_c();
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_MailManagerPanel_DataGridColumn9", _MailManagerPanel_DataGridColumn9);
            return (_local_1);
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        private function _MailManagerPanel_ClassFactory5_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MailManagerPanel_inlineComponent4;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get mailSystemDataGrid():DataGrid
        {
            return (this._2085075210mailSystemDataGrid);
        }

        private function updatePage():void
        {
            pageSelector.initPageSeletor(pageMyMailAC.length, PAGE_MAX_ITEM_NUM);
            pageSelector.pageNo = itemPageNo;
        }

        public function onAddAllServerMail(_arg_1:Object):void
        {
            var _local_2:Boolean;
            var _local_3:Object;
            for each (_local_3 in _arg_1)
            {
                _local_3.data.id = _local_3.index;
                if (Number(_core.player.level) >= _local_3.data.lev)
                {
                    _core.view.getUI(ViewManager.PANEL_MAIL_NOTICE).addMail(_local_3.data);
                    _local_2 = true;
                };
            };
            if (_local_2)
            {
                _core.addWarn({
                    "warnType":GamePredef.WARN_TYPE_ADDMAIL,
                    "info":("[系统]" + GamePredef.WARN_TIP_ADDMAIL3),
                    "mailId":1,
                    "isReceiver":true
                });
            };
        }

        private function pageClear():void
        {
            pageMyMailAC.removeAll();
        }

        public function set doDel(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._95727488doDel;
            if (_local_2 !== _arg_1)
            {
                this._95727488doDel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "doDel", _local_2, _arg_1));
            };
        }

        public function set mailText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._10286204mailText;
            if (_local_2 !== _arg_1)
            {
                this._10286204mailText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mailText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get presentCheck():CheckBox
        {
            return (this._668907789presentCheck);
        }

        public function updateView():void
        {
            var _local_1:*;
            var _local_2:Sort;
            var _local_3:Sort;
            var _local_4:uint;
            var _local_5:Object;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            myMailAC = new ArrayCollection();
            pageMyMailAC = new ArrayCollection();
            mailSystemAC = new ArrayCollection();
            if (mailList != null)
            {
                for each (_local_1 in mailList)
                {
                    if (((!(_local_1 == undefined)) && (!(_local_1 == null))))
                    {
                        _local_4 = 734012;
                        if (_local_1.senderId == "0")
                        {
                            _local_4 = 0xFF0000;
                        };
                        _local_5 = new Object();
                        _local_5.senderName = _local_1.sn;
                        _local_5.sort = _local_1.date;
                        _local_5.subject = _local_1.subject;
                        _local_5.delCheckBox = 0;
                        _local_5.id = _local_1.id;
                        _local_5.sColor = _local_4;
                        _local_5.mailData = _local_1;
                        setMailState(_local_5, _local_1);
                        if (_local_1.senderId > 0)
                        {
                            myMailAC.addItem(_local_5);
                        }
                        else
                        {
                            mailSystemAC.addItem(_local_5);
                        };
                    };
                };
                _local_2 = new Sort();
                _local_2.fields = [new SortField("sort", true, true, true)];
                mailSystemAC.sort = _local_2;
                mailSystemAC.refresh();
                mailSystemDataGrid.dataProvider = pageMyMailAC;
                _local_3 = new Sort();
                _local_3.fields = [new SortField("sort", true, true, true)];
                myMailAC.sort = _local_3;
                myMailAC.refresh();
                mailDataGrid.dataProvider = pageMyMailAC;
            };
            item.type = -1;
            item.giid = -1;
            item.stackNum = -1;
            item.slotData = null;
            presentMoney.maxValue = _core.player.money;
            presentGold.maxValue = _core.player.gold;
            if (tabBtn0.selected == true)
            {
                pageAC = mailSystemAC;
            }
            else
            {
                if (tabBtn1.selected == true)
                {
                    pageAC = myMailAC;
                };
            };
            initPageSelector();
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlotMail
        {
            return (this._3242771item);
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

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function onAddMail(_arg_1:Object):void
        {
            if (_arg_1.id > 0)
            {
                senderId = _arg_1.senderId;
                if (_arg_1.receiverId == _core.player.id)
                {
                    if (mailList)
                    {
                        mailList[_arg_1.id] = _arg_1;
                    }
                    else
                    {
                        mailList = new Object();
                        mailList[_arg_1.id] = _arg_1;
                    };
                    updateView();
                    if (!_core.isBlack(_arg_1.sn))
                    {
                        _core.view.getUI(ViewManager.PANEL_MAIL_NOTICE).addMail(_arg_1);
                        _core.addWarn({
                            "warnType":GamePredef.WARN_TYPE_ADDMAIL,
                            "info":((("[" + _arg_1.sn) + "]") + GamePredef.WARN_TIP_ADDMAIL),
                            "mailId":_arg_1.id,
                            "isReceiver":true
                        });
                    };
                }
                else
                {
                    if (_arg_1.senderId == _core.player.id)
                    {
                        _core.addWarn({
                            "warnType":GamePredef.WARN_TYPE_ADDMAIL,
                            "info":(((GamePredef.WARN_TIP_ADDMAIL2 + "[") + _arg_1.receiverName) + "]"),
                            "mailId":_arg_1.id,
                            "isReceiver":false
                        });
                        initNewMail();
                    };
                };
            }
            else
            {
                if (_arg_1.id == -1)
                {
                    if (_arg_1.type == "noSuchReceiver")
                    {
                        Alert.show(Language.MAILMANAGERPANEL_S[4], "", Alert.OK);
                    }
                    else
                    {
                        if (_arg_1.type == "overMaxMail")
                        {
                            Alert.show(Language.MAILMANAGERPANEL_S[13], "", Alert.OK);
                        };
                    };
                };
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        private function pageChange(_arg_1:int, _arg_2:int):void
        {
            itemPageNo = pageSelector.pageNo;
            drawPage(_arg_1, _arg_2);
        }

        private function _MailManagerPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailManagerPanel_DataGridColumn8 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "senderName";
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory8_c();
            BindingManager.executeBindings(this, "_MailManagerPanel_DataGridColumn8", _MailManagerPanel_DataGridColumn8);
            return (_local_1);
        }

        public function set delAll(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1335493226delAll;
            if (_local_2 !== _arg_1)
            {
                this._1335493226delAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delAll", _local_2, _arg_1));
            };
        }

        private function _MailManagerPanel_ClassFactory4_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MailManagerPanel_inlineComponent3;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get subject():TextInput
        {
            return (this._1867885268subject);
        }

        private function tabBtnClick(_arg_1:int):void
        {
            tabBtn0.selected = false;
            tabBtn1.selected = false;
            tabBtn2.selected = false;
            delAll.selected = false;
            if (0 == _arg_1)
            {
                pageAC = mailSystemAC;
                pageSelector.visible = true;
                doDel.visible = true;
                delAll.visible = true;
                initPageSelector();
            }
            else
            {
                if (1 == _arg_1)
                {
                    pageAC = myMailAC;
                    pageSelector.visible = true;
                    doDel.visible = true;
                    delAll.visible = true;
                    initPageSelector();
                }
                else
                {
                    if (2 == _arg_1)
                    {
                        pageSelector.visible = false;
                        doDel.visible = false;
                        delAll.visible = false;
                    };
                };
            };
            mailTab.selectedIndex = _arg_1;
            this[("tabBtn" + _arg_1)].selected = true;
        }

        public function reset():void
        {
            firstTimeFlag = 0;
        }

        private function onDelMails(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                for (_local_2 in _arg_1)
                {
                    if (((_arg_1[_local_2] > 0) && (!(mailList == null))))
                    {
                        delete mailList[_arg_1[_local_2]];
                    };
                };
                updateView();
            };
        }

        public function onShowMailP(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:*;
            if (_arg_1)
            {
                firstTimeFlag = 1;
                this.mailList = _arg_1.mailList;
                currentTime = _arg_1.currentTime;
                updateView();
                if (((this.mailList) && (!(this.mailList == ""))))
                {
                    _local_2 = 0;
                    for each (_local_3 in mailList)
                    {
                        _local_2++;
                    };
                    if (_local_2 > 99)
                    {
                        _core.sysMidNote(Language.MAILMANAGERPANEL_S[23]);
                    };
                };
            }
            else
            {
                visible = false;
                _core.sysMidNote(Language.MAILMANAGERPANEL_S[0]);
            };
        }

        private function doSelection():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:Object;
            if (delAll.selected)
            {
                for (_local_1 in pageAC)
                {
                    _local_2 = pageAC[_local_1];
                    if (!(((_local_2.mailData.money > 0) || (_local_2.mailData.gold > 0)) || (((_local_2.mailData.itemType > 0) && (_local_2.mailData.itemId > 0)) && (_local_2.mailData.stackNum > 0))))
                    {
                        pageAC[_local_1].delCheckBox = 1;
                    };
                };
            }
            else
            {
                for each (_local_3 in pageAC)
                {
                    _local_3.delCheckBox = 0;
                };
            };
            initPageSelector();
        }

        private function _MailManagerPanel_DataGridColumn7_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.width = 21;
            _local_1.dataField = "delCheckBox";
            _local_1.headerText = "";
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory7_c();
            return (_local_1);
        }

        private function presentRadioClick():void
        {
            if (presentCheck.selected == true)
            {
                presentMoney.currencyInput.clearStyle("borderSkin");
                presentMoney.currencyInput.clearStyle("backgroundAlpha");
                presentMoney.currencyInput.validateNow();
                presentGold.currencyInput.clearStyle("borderSkin");
                presentGold.currencyInput.clearStyle("backgroundAlpha");
                presentGold.currencyInput.validateNow();
                presentMoney.inputEnabled = true;
                presentGold.inputEnabled = true;
            }
            else
            {
                presentMoney.inputEnabled = false;
                presentGold.inputEnabled = false;
                presentMoney.value = 0;
                presentGold.value = 0;
            };
        }

        private function _MailManagerPanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MailManagerPanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function set presentGold(_arg_1:Currency):void
        {
            var _local_2:Object = this._1225222213presentGold;
            if (_local_2 !== _arg_1)
            {
                this._1225222213presentGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "presentGold", _local_2, _arg_1));
            };
        }

        public function __delAll_click(_arg_1:MouseEvent):void
        {
            doSelection();
        }

        [Bindable(event="propertyChange")]
        public function get doDel():BasicGlowButton
        {
            return (this._95727488doDel);
        }

        public function onDelMail(_arg_1:Number):void
        {
            if (_arg_1 > 0)
            {
                if (mailList != null)
                {
                    delete mailList[_arg_1];
                    updateView();
                };
            };
        }

        public function set presentMoney(_arg_1:Currency):void
        {
            var _local_2:Object = this._678360261presentMoney;
            if (_local_2 !== _arg_1)
            {
                this._678360261presentMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "presentMoney", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mailText():TextArea
        {
            return (this._10286204mailText);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        [Bindable(event="propertyChange")]
        public function get delAll():CheckBox
        {
            return (this._1335493226delAll);
        }

        override public function initialize():void
        {
            var target:MailManagerPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MailManagerPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MailManagerPanelWatcherSetupUtil");
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

        private function _MailManagerPanel_DataGridColumn6_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.width = 21;
            _local_1.dataField = "icon";
            _local_1.headerText = "";
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory6_c();
            return (_local_1);
        }

        private function _MailManagerPanel_ClassFactory10_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MailManagerPanel_inlineComponent9;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function _MailManagerPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MailManagerPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function rmItemView():void
        {
            item.clean();
            _core.view.getUI(ViewManager.PANEL_BAG).updateView();
        }

        public function __presentCheck_click(_arg_1:MouseEvent):void
        {
            presentRadioClick();
        }

        private function delMailsHandler(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("delMails", new Responder(onDelMails), idArr);
                _core.view.getUI(ViewManager.PANEL_MAIL).visible = false;
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get presentGold():Currency
        {
            return (this._1225222213presentGold);
        }

        public function set mailDataGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._557789977mailDataGrid;
            if (_local_2 !== _arg_1)
            {
                this._557789977mailDataGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mailDataGrid", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("showMailP", new Responder(onShowMailP));
        }

        public function set receiver(_arg_1:TextInput):void
        {
            var _local_2:Object = this._808719889receiver;
            if (_local_2 !== _arg_1)
            {
                this._808719889receiver = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "receiver", _local_2, _arg_1));
            };
        }

        private function codRadioClick():void
        {
            if (codCheck.selected == true)
            {
                codMoney.inputEnabled = true;
                codGold.inputEnabled = true;
                codMoney.currencyInput.clearStyle("borderSkin");
                codMoney.currencyInput.clearStyle("backgroundAlpha");
                codMoney.currencyInput.validateNow();
                codGold.currencyInput.clearStyle("borderSkin");
                codGold.currencyInput.clearStyle("backgroundAlpha");
                codGold.currencyInput.validateNow();
            }
            else
            {
                codMoney.inputEnabled = false;
                codGold.inputEnabled = false;
                codMoney.value = 0;
                codGold.value = 0;
            };
        }

        private function _MailManagerPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailManagerPanel_DataGridColumn5 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "remainDate";
            _local_1.itemRenderer = _MailManagerPanel_ClassFactory5_c();
            BindingManager.executeBindings(this, "_MailManagerPanel_DataGridColumn5", _MailManagerPanel_DataGridColumn5);
            return (_local_1);
        }

        public function set mailSystemDataGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._2085075210mailSystemDataGrid;
            if (_local_2 !== _arg_1)
            {
                this._2085075210mailSystemDataGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mailSystemDataGrid", _local_2, _arg_1));
            };
        }

        public function __mailSystemDataGrid_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get receiver():TextInput
        {
            return (this._808719889receiver);
        }

        public function set codGold(_arg_1:Currency):void
        {
            var _local_2:Object = this._940964344codGold;
            if (_local_2 !== _arg_1)
            {
                this._940964344codGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "codGold", _local_2, _arg_1));
            };
        }

        private function _MailManagerPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererImage;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get codGold():Currency
        {
            return (this._940964344codGold);
        }

        private function _MailManagerPanel_ClassFactory9_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MailManagerPanel_inlineComponent8;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function drawPage(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                pageMyMailAC.addItem(pageAC.getItemAt(_local_3));
                _local_4++;
            };
        }

        private function _MailManagerPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MailManagerPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_S[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_DescriptionLabel1.text = _arg_1;
            }, "_MailManagerPanel_DescriptionLabel1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAIL_MANAGER_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_Canvas1.label = _arg_1;
            }, "_MailManagerPanel_Canvas1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_S[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_DataGridColumn3.headerText = _arg_1;
            }, "_MailManagerPanel_DataGridColumn3.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_S[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_DataGridColumn4.headerText = _arg_1;
            }, "_MailManagerPanel_DataGridColumn4.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_DataGridColumn5.headerText = _arg_1;
            }, "_MailManagerPanel_DataGridColumn5.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAIL_MANAGER_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_Canvas2.label = _arg_1;
            }, "_MailManagerPanel_Canvas2.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_S[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_DataGridColumn8.headerText = _arg_1;
            }, "_MailManagerPanel_DataGridColumn8.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_S[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_DataGridColumn9.headerText = _arg_1;
            }, "_MailManagerPanel_DataGridColumn9.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_DataGridColumn10.headerText = _arg_1;
            }, "_MailManagerPanel_DataGridColumn10.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAIL_MANAGER_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_Canvas3.label = _arg_1;
            }, "_MailManagerPanel_Canvas3.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                presentCheck.label = _arg_1;
            }, "presentCheck.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                codCheck.label = _arg_1;
            }, "codCheck.label");
            result[12] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                presentMoney.type = _arg_1;
            }, "presentMoney.type");
            result[13] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                presentGold.type = _arg_1;
            }, "presentGold.type");
            result[14] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                codMoney.type = _arg_1;
            }, "codMoney.type");
            result[15] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                codGold.type = _arg_1;
            }, "codGold.type");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_BasicDelayButton1.label = _arg_1;
            }, "_MailManagerPanel_BasicDelayButton1.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_BasicTxtButton1.label = _arg_1;
            }, "_MailManagerPanel_BasicTxtButton1.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_BasicTxtButton2.label = _arg_1;
            }, "_MailManagerPanel_BasicTxtButton2.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailManagerPanel_BasicTxtButton3.label = _arg_1;
            }, "_MailManagerPanel_BasicTxtButton3.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delAll.label = _arg_1;
            }, "delAll.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delAll.toolTip = _arg_1;
            }, "delAll.toolTip");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                doDel.label = _arg_1;
            }, "doDel.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILMANAGERPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[26] = binding;
            return (result);
        }

        private function addMail():void
        {
            var obj:Object;
            var tradeItem:Function;
            obj = new Object();
            if (receiver.text != "")
            {
                if (receiver.text != _core.player.name)
                {
                    if (((presentMoney.value <= _core.player.money) && (presentGold.value <= _core.player.gold)))
                    {
                        subject.text = _core.replaceBadWord(subject.text);
                        mailText.text = _core.replaceBadWord(mailText.text);
                        obj.subject = subject.text;
                        obj.text = mailText.text;
                        if (((codCheck.selected == true) && ((codMoney.value > 0) || (codGold.value > 0))))
                        {
                            obj.codFlag = 1;
                            obj.codMoney = codMoney.value;
                            obj.codGold = codGold.value;
                        }
                        else
                        {
                            obj.codFlag = -1;
                            obj.codMoney = 0;
                            obj.codGold = 0;
                        };
                        if (presentCheck.selected == true)
                        {
                            obj.money = presentMoney.value;
                            obj.gold = presentGold.value;
                        }
                        else
                        {
                            obj.money = 0;
                            obj.gold = 0;
                        };
                        if ((((item.giid > 0) && (item.type > 0)) || ((item.giid == -1) && (item.type == -1))))
                        {
                            if (((item.type == GamePredef.TBL_ITEM_INSTANCE) || (item.type == GamePredef.TBL_EQUIPT_INSTANCE)))
                            {
                                obj.type = GamePredef.TBL_CHARACTOR_SLOT;
                            }
                            else
                            {
                                if (item.type == GamePredef.TBL_PET)
                                {
                                    obj.type = GamePredef.TBL_PET;
                                }
                                else
                                {
                                    obj.type = -1;
                                };
                            };
                            if (item.slotData)
                            {
                                obj.id = item.slotData.id;
                            }
                            else
                            {
                                obj.id = -1;
                            };
                        };
                        obj.readDate = -1;
                        if (_core.delPass)
                        {
                            _core.remote.addMail(receiver.text, obj, _core.delPass);
                        }
                        else
                        {
                            tradeItem = function (_arg_1:String):void
                            {
                                _core.remote.addMail(receiver.text, obj, MD5.hash(_arg_1));
                            };
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.MAIL_MANAGER_PANEL_U[0], tradeItem);
                        };
                    }
                    else
                    {
                        Alert.show(Language.MAILMANAGERPANEL_S[1], "", Alert.OK);
                    };
                }
                else
                {
                    Alert.show(Language.MAILMANAGERPANEL_S[2], "", Alert.OK);
                };
            }
            else
            {
                Alert.show(Language.MAILMANAGERPANEL_S[3], "", Alert.OK);
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

