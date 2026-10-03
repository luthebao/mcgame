// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SystemShopTrolleyPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.controls.LinkButton;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.RendererItemSlot;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class SystemShopTrolleyPanel extends DragableCanvas implements IBindingClient 
    {

        private static const MAX_GOODS_NUM:int = 20;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const ITEM_COUNT_PER_PAGE:int = 8;
        public var _SystemShopTrolleyPanel_DataGrid1:DataGrid;
        private var _719302555totalPrice:int = 0;
        private var _1261039379acDetail:String;
        public var _SystemShopTrolleyPanel_DataGridColumn2:DataGridColumn;
        public var _SystemShopTrolleyPanel_DataGridColumn3:DataGridColumn;
        public var _SystemShopTrolleyPanel_DataGridColumn4:DataGridColumn;
        public var _SystemShopTrolleyPanel_DataGridColumn5:DataGridColumn;
        public var _SystemShopTrolleyPanel_DataGridColumn6:DataGridColumn;
        public var _SystemShopTrolleyPanel_DataGridColumn7:DataGridColumn;
        public var _SystemShopTrolleyPanel_BasicGlowButton1:BasicGlowButton;
        public var _SystemShopTrolleyPanel_BasicGlowButton2:BasicGlowButton;
        public var _SystemShopTrolleyPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _SystemShopTrolleyPanel_RoundedLabel1:RoundedLabel;
        public var _SystemShopTrolleyPanel_RoundedLabel2:RoundedLabel;
        public var _SystemShopTrolleyPanel_RoundedLabel3:RoundedLabel;
        public var _SystemShopTrolleyPanel_RoundedLabel4:RoundedLabel;
        public var _SystemShopTrolleyPanel_RoundedLabel5:RoundedLabel;
        private var _callback:Function;
        private var _607339634pageSelector:PageSelector;
        public var _SystemShopTrolleyPanel_LinkButton1:LinkButton;
        public var _SystemShopTrolleyPanel_Image1:Image;
        private var _849911390totalNum:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":390,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SystemShopTrolleyPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.bottom = "40";
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"_SystemShopTrolleyPanel_DataGrid1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "10";
                                        this.bottom = "52";
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "resizableColumns":false,
                                            "draggableColumns":false,
                                            "rowHeight":28,
                                            "selectable":false,
                                            "columns":[_SystemShopTrolleyPanel_DataGridColumn1_c(), _SystemShopTrolleyPanel_DataGridColumn2_i(), _SystemShopTrolleyPanel_DataGridColumn3_i(), _SystemShopTrolleyPanel_DataGridColumn4_i(), _SystemShopTrolleyPanel_DataGridColumn5_i(), _SystemShopTrolleyPanel_DataGridColumn6_i(), _SystemShopTrolleyPanel_DataGridColumn7_i()]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_SystemShopTrolleyPanel_RoundedLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.left = "10";
                                        this.textAlign = "right";
                                        this.bottom = "32";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":40});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_SystemShopTrolleyPanel_RoundedLabel2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.left = "10";
                                        this.textAlign = "right";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":120});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_SystemShopTrolleyPanel_RoundedLabel3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.left = "50";
                                        this.bottom = "32";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":50});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_SystemShopTrolleyPanel_RoundedLabel4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.left = "124.65";
                                        this.textAlign = "center";
                                        this.bottom = "32";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":40});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_SystemShopTrolleyPanel_Image1",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "33";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":166.65,
                                            "width":16,
                                            "height":16
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_SystemShopTrolleyPanel_RoundedLabel5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.left = "186.65";
                                        this.textAlign = "left";
                                        this.bottom = "32";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":40});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"pageSelector",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                        this.bottom = "33";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_SystemShopTrolleyPanel_LinkButton1",
                                    "events":{"click":"___SystemShopTrolleyPanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textDecoration = "underline";
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":124.65,
                                            "y":282
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_SystemShopTrolleyPanel_BasicGlowButton1",
                        "events":{"click":"___SystemShopTrolleyPanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "-50";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "width":60,
                                "height":25
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_SystemShopTrolleyPanel_BasicGlowButton2",
                        "events":{"click":"___SystemShopTrolleyPanel_BasicGlowButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "50";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "width":60,
                                "height":25
                            });
                        }
                    })]
                });
            }
        });
        private var _90794110_core:Core = Core.getInstance();
        private var _406334549totalTrolleyGoods:ArrayCollection = new ArrayCollection();
        private var _2027545824pageTrolleyGoods:ArrayCollection = new ArrayCollection();
        private var buyList:Dictionary = new Dictionary();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SystemShopTrolleyPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 390;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___SystemShopTrolleyPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SystemShopTrolleyPanel._watcherSetupUtil = _arg_1;
        }


        private function _SystemShopTrolleyPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemSlot;
            return (_local_1);
        }

        public function ___SystemShopTrolleyPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function getTotalGold(_arg_1:Object, _arg_2:DataGridColumn):int
        {
            return (parseInt(_arg_1.num) * parseInt(_arg_1.gold));
        }

        public function init():void
        {
        }

        public function doBuy(_arg_1:CloseEvent):void
        {
            var _local_2:int;
            if (_arg_1.detail == Alert.OK)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_GAMEINTRO).carStyle;
                _core.remote.call("buySystemItemMulti", new Responder(_callback), buyList, _local_2);
                totalTrolleyGoods.removeAll();
                pageTrolleyGoods.removeAll();
                totalNum = 0;
                totalPrice = 0;
                buyList = null;
                hide();
            };
        }

        private function _SystemShopTrolleyPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SYSTEMSHOPPANEL_U[25];
            _local_1 = pageTrolleyGoods;
            _local_1 = Language.SYSTEMSHOPPANEL_U[30];
            _local_1 = Language.SYSTEMSHOPPANEL_U[31];
            _local_1 = Language.SYSTEMSHOPPANEL_U[32];
            _local_1 = Language.SYSTEMSHOPPANEL_U[33];
            _local_1 = Language.SYSTEMSHOPPANEL_U[34];
            _local_1 = Language.SYSTEMSHOPPANEL_U[35];
            _local_1 = this.totalNum;
            _local_1 = Language.SYSTEMSHOPPANEL_U[29];
            _local_1 = Language.SYSTEMSHOPPANEL_U[26];
            _local_1 = Language.SYSTEMSHOPPANEL_U[28];
            _local_1 = ResManager.ICON_CURRENCY_GOLD_ALL;
            _local_1 = this.totalPrice;
            _local_1 = acDetail;
            _local_1 = Language.SYSTEMSHOPPANEL_U[13];
            _local_1 = Language.SYSTEMSHOPPANEL_U[27];
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

        [Bindable(event="propertyChange")]
        private function get pageTrolleyGoods():ArrayCollection
        {
            return (this._2027545824pageTrolleyGoods);
        }

        [Bindable(event="propertyChange")]
        private function get acDetail():String
        {
            return (this._1261039379acDetail);
        }

        public function ___SystemShopTrolleyPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            handleClose();
        }

        private function set acDetail(_arg_1:String):void
        {
            var _local_2:Object = this._1261039379acDetail;
            if (_local_2 !== _arg_1)
            {
                this._1261039379acDetail = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "acDetail", _local_2, _arg_1));
            };
        }

        public function handleAcDetailText(_arg_1:String):void
        {
            if (((_arg_1 == null) || (_arg_1 == "")))
            {
                acDetail = Language.SYSTEMSHOPPANEL_U[45];
            }
            else
            {
                acDetail = _arg_1;
            };
        }

        public function removeGoods(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_2:int = pageSelector.pageNo;
            for (_local_3 in totalTrolleyGoods)
            {
                if (totalTrolleyGoods.getItemAt(_local_3).shopSlotId == _arg_1.shopSlotId)
                {
                    totalTrolleyGoods.removeItemAt(_local_3);
                    totalNum--;
                    totalPrice = (totalPrice - (parseInt(_arg_1.gold) * parseInt(_arg_1.num)));
                    break;
                };
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(totalTrolleyGoods.length, ITEM_COUNT_PER_PAGE);
            pageSelector.pageNo = _local_2;
        }

        private function _SystemShopTrolleyPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _SystemShopTrolleyPanel_DataGridColumn2 = _local_1;
            _local_1.width = 110;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_SystemShopTrolleyPanel_DataGridColumn2", _SystemShopTrolleyPanel_DataGridColumn2);
            return (_local_1);
        }

        private function handleBuy():void
        {
            var _local_1:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            if (!_local_1.goldSelected)
            {
                Alert.show(Language.SYSTEMSHOPPANEL_U[38], Language.SYSTEMSHOPPANEL_U[39], (Alert.OK | Alert.CANCEL), null, handleAlertEvent);
            }
            else
            {
                tryBuy();
            };
        }

        private function set pageTrolleyGoods(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._2027545824pageTrolleyGoods;
            if (_local_2 !== _arg_1)
            {
                this._2027545824pageTrolleyGoods = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTrolleyGoods", _local_2, _arg_1));
            };
        }

        private function set totalNum(_arg_1:int):void
        {
            var _local_2:Object = this._849911390totalNum;
            if (_local_2 !== _arg_1)
            {
                this._849911390totalNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalNum", _local_2, _arg_1));
            };
        }

        public function getAcDetailText():void
        {
            if (acDetail == null)
            {
                _core.remote.call("getShopAwardStr", new Responder(handleAcDetailText));
            };
        }

        [Bindable(event="propertyChange")]
        private function get totalPrice():int
        {
            return (this._719302555totalPrice);
        }

        private function getTypeName(_arg_1:Object, _arg_2:DataGridColumn):String
        {
            return (GamePredef.ITEM_TYPE_NAME[_arg_1.typeName]);
        }

        private function _SystemShopTrolleyPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _SystemShopTrolleyPanel_DataGridColumn6 = _local_1;
            _local_1.width = 70;
            _local_1.dataField = "";
            _local_1.labelFunction = getTotalGold;
            BindingManager.executeBindings(this, "_SystemShopTrolleyPanel_DataGridColumn6", _SystemShopTrolleyPanel_DataGridColumn6);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get totalTrolleyGoods():ArrayCollection
        {
            return (this._406334549totalTrolleyGoods);
        }

        private function _SystemShopTrolleyPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "";
            _local_1.dataField = "";
            _local_1.width = 35;
            _local_1.itemRenderer = _SystemShopTrolleyPanel_ClassFactory1_c();
            return (_local_1);
        }

        private function clearPage():void
        {
            pageTrolleyGoods.removeAll();
        }

        private function _SystemShopTrolleyPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _SystemShopTrolleyPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "num";
            BindingManager.executeBindings(this, "_SystemShopTrolleyPanel_DataGridColumn5", _SystemShopTrolleyPanel_DataGridColumn5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get _core():Core
        {
            return (this._90794110_core);
        }

        private function getAcDetail():void
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_GAMEINTRO);
            if (!_local_1.visible)
            {
                _local_1.show();
            };
            _local_1.autoClick(8);
            _local_1.flTabBtnClick(3);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:SystemShopTrolleyPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SystemShopTrolleyPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SystemShopTrolleyPanelWatcherSetupUtil");
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

        public function handleCallback(_arg_1:Object):void
        {
        }

        [Bindable(event="propertyChange")]
        private function get totalNum():int
        {
            return (this._849911390totalNum);
        }

        public function addGoodsToTrolley(_arg_1:Object):void
        {
            var _local_2:*;
            if (acDetail == null)
            {
                _core.remote.call("getShopAwardStr", new Responder(handleAcDetailText));
            };
            if (totalTrolleyGoods.length >= MAX_GOODS_NUM)
            {
                Alert.show(Language.SYSTEMSHOPPANEL_U[36]);
                return;
            };
            for (_local_2 in totalTrolleyGoods)
            {
                if (_arg_1.shopSlotId == totalTrolleyGoods.getItemAt(_local_2).shopSlotId)
                {
                    Alert.show(Language.SYSTEMSHOPPANEL_U[37]);
                    return;
                };
            };
            totalTrolleyGoods.addItem(_arg_1);
            totalNum++;
            totalPrice = (totalPrice + (parseInt(_arg_1.gold) * parseInt(_arg_1.num)));
            if (pageTrolleyGoods.length <= ITEM_COUNT_PER_PAGE)
            {
                pageTrolleyGoods.addItem(_arg_1);
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(totalTrolleyGoods.length, ITEM_COUNT_PER_PAGE);
        }

        private function handleClose():void
        {
            hide();
        }

        private function _SystemShopTrolleyPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _SystemShopTrolleyPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "gold";
            BindingManager.executeBindings(this, "_SystemShopTrolleyPanel_DataGridColumn4", _SystemShopTrolleyPanel_DataGridColumn4);
            return (_local_1);
        }

        private function _SystemShopTrolleyPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SystemShopTrolleyPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pageTrolleyGoods);
            }, function (_arg_1:Object):void
            {
                _SystemShopTrolleyPanel_DataGrid1.dataProvider = _arg_1;
            }, "_SystemShopTrolleyPanel_DataGrid1.dataProvider");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_DataGridColumn2.headerText = _arg_1;
            }, "_SystemShopTrolleyPanel_DataGridColumn2.headerText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_DataGridColumn3.headerText = _arg_1;
            }, "_SystemShopTrolleyPanel_DataGridColumn3.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_DataGridColumn4.headerText = _arg_1;
            }, "_SystemShopTrolleyPanel_DataGridColumn4.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_DataGridColumn5.headerText = _arg_1;
            }, "_SystemShopTrolleyPanel_DataGridColumn5.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_DataGridColumn6.headerText = _arg_1;
            }, "_SystemShopTrolleyPanel_DataGridColumn6.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_DataGridColumn7.headerText = _arg_1;
            }, "_SystemShopTrolleyPanel_DataGridColumn7.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = this.totalNum;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_RoundedLabel1.text = _arg_1;
            }, "_SystemShopTrolleyPanel_RoundedLabel1.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_RoundedLabel2.text = _arg_1;
            }, "_SystemShopTrolleyPanel_RoundedLabel2.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_RoundedLabel3.text = _arg_1;
            }, "_SystemShopTrolleyPanel_RoundedLabel3.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_RoundedLabel4.text = _arg_1;
            }, "_SystemShopTrolleyPanel_RoundedLabel4.text");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_CURRENCY_GOLD_ALL);
            }, function (_arg_1:Object):void
            {
                _SystemShopTrolleyPanel_Image1.source = _arg_1;
            }, "_SystemShopTrolleyPanel_Image1.source");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = this.totalPrice;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_RoundedLabel5.text = _arg_1;
            }, "_SystemShopTrolleyPanel_RoundedLabel5.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = acDetail;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_LinkButton1.label = _arg_1;
            }, "_SystemShopTrolleyPanel_LinkButton1.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_BasicGlowButton1.label = _arg_1;
            }, "_SystemShopTrolleyPanel_BasicGlowButton1.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_BasicGlowButton2.label = _arg_1;
            }, "_SystemShopTrolleyPanel_BasicGlowButton2.label");
            result[16] = binding;
            return (result);
        }

        public function ___SystemShopTrolleyPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            getAcDetail();
        }

        private function set totalTrolleyGoods(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._406334549totalTrolleyGoods;
            if (_local_2 !== _arg_1)
            {
                this._406334549totalTrolleyGoods = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalTrolleyGoods", _local_2, _arg_1));
            };
        }

        private function _SystemShopTrolleyPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = SystemShopTrolleyPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function set totalPrice(_arg_1:int):void
        {
            var _local_2:Object = this._719302555totalPrice;
            if (_local_2 !== _arg_1)
            {
                this._719302555totalPrice = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalPrice", _local_2, _arg_1));
            };
        }

        private function tryBuy():void
        {
            var _local_1:Number;
            var _local_2:int;
            var _local_3:*;
            var _local_4:BagPanel;
            buyList = new Dictionary();
            for (_local_3 in totalTrolleyGoods)
            {
                _local_1 = totalTrolleyGoods.getItemAt(_local_3).shopSlotId;
                _local_2 = totalTrolleyGoods.getItemAt(_local_3).num;
                buyList[_local_1] = _local_2;
            };
            _callback = handleCallback;
            _local_4 = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            if (_local_4.goldDisable())
            {
                _local_4.clickLock(2);
                return;
            };
            var _local_5:String = Language.SYSTEMSHOPPANEL_U[40].replace("{totalGold}", totalPrice);
            Alert.show(_local_5, Language.SYSTEMSHOPPANEL_U[39], (Alert.OK | Alert.CANCEL), null, doBuy);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                pageTrolleyGoods.addItem(totalTrolleyGoods.getItemAt(_local_3));
                _local_4++;
            };
        }

        private function handleAlertEvent(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail != Alert.OK)
            {
                return;
            };
            tryBuy();
        }

        public function ___SystemShopTrolleyPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            handleBuy();
        }

        private function _SystemShopTrolleyPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _SystemShopTrolleyPanel_DataGridColumn3 = _local_1;
            _local_1.width = 65;
            _local_1.dataField = "typeName";
            _local_1.labelFunction = getTypeName;
            BindingManager.executeBindings(this, "_SystemShopTrolleyPanel_DataGridColumn3", _SystemShopTrolleyPanel_DataGridColumn3);
            return (_local_1);
        }

        private function set _core(_arg_1:Core):void
        {
            var _local_2:Object = this._90794110_core;
            if (_local_2 !== _arg_1)
            {
                this._90794110_core = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_core", _local_2, _arg_1));
            };
        }

        private function _SystemShopTrolleyPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _SystemShopTrolleyPanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "";
            _local_1.itemRenderer = _SystemShopTrolleyPanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_SystemShopTrolleyPanel_DataGridColumn7", _SystemShopTrolleyPanel_DataGridColumn7);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

