// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WingAdvancedPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.collections.ArrayCollection;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.ItemSlotEquFunc;
    import com.qeedoo.ui.view.comp.PageableDataGrid;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import mx.core.ClassFactory;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.BindingManager;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.ui.view.comp.RendererItemSlot;
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

    public class WingAdvancedPanel extends DragableCanvas implements IBindingClient 
    {

        private static const MAX_ADVANCED_JOIN:Object = GamePredef.MAX_ADVANCED_JOIN;
        public static const MIN_ADVANCED_JOIN:int = GamePredef.MIN_ADVANCED_JOIN;//4
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public const FILTER_SHADOW_TEXT2:*;
        private const NUM_PER_PAGE:int = 8;
        public const FILTER_SHADOW_TEXT:*;
        private var pageOffset:int = -1;
        public var _WingAdvancedPanel_DataGridColumn2:DataGridColumn;
        public var _WingAdvancedPanel_DataGridColumn3:DataGridColumn;
        private var _900864954allChkBox:CheckBox;
        private var probability:Number = 0;
        public var _WingAdvancedPanel_BasicTxtButton1:BasicTxtButton;
        public var _WingAdvancedPanel_BasicTxtButton2:BasicTxtButton;
        public var _WingAdvancedPanel_BasicTxtButton3:BasicTxtButton;
        public var _WingAdvancedPanel_BasicTxtButton4:BasicTxtButton;
        private var _1034217724joinButton:BasicGlowButton;
        public var _WingAdvancedPanel_IntroText1:IntroText;
        private var _wingList:ArrayCollection;
        private var _1053257947countLabel:Label;
        private var _607339634pageSelector:PageSelector;
        private var _1007683640pTitle:BasicTitleCanvas;
        private var _8346268mainWing:ItemSlotEquFunc;
        private var maxWings:int = 0;
        private var _3723199probabilityLabel:Label;
        private var _2022235378assistantDataGrid:PageableDataGrid;
        private var selectedNum:int = 0;
        private var probabilityArr:Object = null;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":353,
                    "creationPolicy":"all",
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"pTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "14";
                            this.top = "40";
                            this.bottom = "15";
                            this.right = "14";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_WingAdvancedPanel_BasicTxtButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "62";
                                        this.top = "20";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotEquFunc,
                                    "id":"mainWing",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "62";
                                        this.top = "41";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"movable":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"joinButton",
                                    "events":{"click":"__joinButton_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "55";
                                        this.top = "100";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_WingAdvancedPanel_BasicTxtButton2",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "150";
                                        this.top = "43";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_WingAdvancedPanel_BasicTxtButton3",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "150";
                                        this.top = "73";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_WingAdvancedPanel_BasicTxtButton4",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "150";
                                        this.top = "103";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"probabilityLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "220";
                                        this.top = "43";
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"countLabel",
                                    "events":{"click":"__countLabel_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "226.5";
                                        this.top = "73";
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"allChkBox",
                                    "events":{"click":"__allChkBox_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "220";
                                        this.top = "103";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"_WingAdvancedPanel_IntroText1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":280,
                                            "height":140
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "295";
                                        this.right = "10";
                                        this.top = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":PageableDataGrid,
                                                "id":"assistantDataGrid",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalAlign = "middle";
                                                    this.alternatingItemColors = [0xFFFFFF, 0xFFFFFF];
                                                    this.useRollOver = false;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "sortableColumns":false,
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "columns":[_WingAdvancedPanel_DataGridColumn1_c(), _WingAdvancedPanel_DataGridColumn2_i(), _WingAdvancedPanel_DataGridColumn3_i()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "5";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"onPageChanged":onPageChanged});
                                                }
                                            })]
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WingAdvancedPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 353;
            this.styleName = "StandardContent";
            this.creationPolicy = "all";
            this.addEventListener("creationComplete", ___WingAdvancedPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WingAdvancedPanel._watcherSetupUtil = _arg_1;
        }


        private function _WingAdvancedPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "";
            _local_1.width = 26;
            _local_1.itemRenderer = _WingAdvancedPanel_ClassFactory1_c();
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get assistantDataGrid():PageableDataGrid
        {
            return (this._2022235378assistantDataGrid);
        }

        public function ___WingAdvancedPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function set assistantDataGrid(_arg_1:PageableDataGrid):void
        {
            var _local_2:Object = this._2022235378assistantDataGrid;
            if (_local_2 !== _arg_1)
            {
                this._2022235378assistantDataGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "assistantDataGrid", _local_2, _arg_1));
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

        private function mainWingChange(_arg_1:Event):void
        {
            if (((_arg_1) && (allowAdvancedJoin())))
            {
                reset();
                wingFresh();
                updateState();
            }
            else
            {
                reset();
                joinViewClear();
            };
        }

        [Bindable(event="propertyChange")]
        public function get countLabel():Label
        {
            return (this._1053257947countLabel);
        }

        [Bindable(event="propertyChange")]
        public function get allChkBox():CheckBox
        {
            return (this._900864954allChkBox);
        }

        private function updateState():void
        {
            if (selectedNum < GamePredef.WING_MIN_ADVANCED_JOIN)
            {
                probabilityLabel.visible = false;
            }
            else
            {
                probability = probabilityArr[selectedNum];
                if (isNaN(probability))
                {
                    probability = 100;
                };
                probabilityLabel.visible = true;
                probabilityLabel.text = (probability.toString() + "%");
            };
            countLabel.text = ((("" + selectedNum) + "/") + maxWings);
            if (selectedNum > maxWings)
            {
                countLabel.setStyle("color", "red");
            }
            else
            {
                countLabel.setStyle("color", "white");
            };
        }

        public function set countLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1053257947countLabel;
            if (_local_2 !== _arg_1)
            {
                this._1053257947countLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "countLabel", _local_2, _arg_1));
            };
        }

        private function reset():void
        {
            selectedNum = 0;
            maxWings = 0;
            probability = 0;
            allChkBox.selected = false;
            allChkBox.enabled = false;
            probabilityLabel.text = "";
            countLabel.text = "";
        }

        private function allowAdvancedJoin():Boolean
        {
            var _local_1:Object;
            if (mainWing.slotData)
            {
                _local_1 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][mainWing.slotData.itemId];
                if (_local_1)
                {
                    if (GamePredef.WING_MAX_ADVANCED_JOIN[_local_1.color] > 0)
                    {
                        return (true);
                    };
                };
            };
            return (false);
        }

        private function _WingAdvancedPanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = WingAdvancedPanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function _WingAdvancedPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WINGADVANCEDPANEL_U[0];
            _local_1 = Language.WINGADVANCEDPANEL_U[1];
            _local_1 = {"kinds":{"13":true}};
            _local_1 = Language.WINGADVANCEDPANEL_U[2];
            _local_1 = Language.WINGADVANCEDPANEL_U[3];
            _local_1 = Language.WINGADVANCEDPANEL_U[4];
            _local_1 = Language.WINGADVANCEDPANEL_U[5];
            _local_1 = Language.WINGADVANCEDPANEL_S[0];
            _local_1 = pageSelector;
            _local_1 = Language.WINGADVANCEDPANEL_U[6];
            _local_1 = Language.WINGADVANCEDPANEL_U[7];
        }

        [Bindable(event="propertyChange")]
        public function get mainWing():ItemSlotEquFunc
        {
            return (this._8346268mainWing);
        }

        public function __joinButton_click(_arg_1:MouseEvent):void
        {
            advancedJoin();
        }

        private function onAllClick():void
        {
            var _local_1:*;
            for each (_local_1 in _wingList)
            {
                if (_local_1)
                {
                    if (allChkBox.selected)
                    {
                        _local_1.selected = true;
                    }
                    else
                    {
                        _local_1.selected = false;
                    };
                };
            };
            if (allChkBox.selected)
            {
                selectedNum = _wingList.length;
            }
            else
            {
                selectedNum = 0;
            };
            updateState();
            pageSelector.refreshPage();
        }

        private function advancedJoin():void
        {
            var obj:Array;
            var wing:* = undefined;
            var func:Function;
            if (!mainWing.slotData)
            {
                _core.sysMidNote(Language.WINGADVANCEDPANEL_S[7]);
                return;
            };
            if (selectedNum < MIN_ADVANCED_JOIN)
            {
                _core.sysMidNote(Language.WINGADVANCEDPANEL_S[4]);
                return;
            };
            if (selectedNum > maxWings)
            {
                _core.sysMidNote(Language.WINGADVANCEDPANEL_S[5]);
                return;
            };
            var hasBinded:Boolean;
            var mainWingIns:Object = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][mainWing.slotData.itemId];
            if (mainWingIns.binded == 1)
            {
                hasBinded = true;
            };
            obj = [];
            for each (wing in _wingList)
            {
                if (((wing) && (wing.selected)))
                {
                    obj.push(wing.id);
                    if (wing.binded == 1)
                    {
                        hasBinded = true;
                    };
                };
            };
            if (hasBinded)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("wingSeniorJoin", new Responder(onJoin), mainWing.slotData.id, obj);
                        reset();
                        joinViewClear();
                    };
                };
                Alert.show(Language.WINGADVANCEDPANEL_S[6], "", (Alert.YES | Alert.NO), this, func);
            }
            else
            {
                _core.remote.call("wingSeniorJoin", new Responder(onJoin), mainWing.slotData.id, obj);
                reset();
                joinViewClear();
            };
        }

        public function __allChkBox_click(_arg_1:MouseEvent):void
        {
            onAllClick();
        }

        public function set allChkBox(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._900864954allChkBox;
            if (_local_2 !== _arg_1)
            {
                this._900864954allChkBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allChkBox", _local_2, _arg_1));
            };
        }

        public function set probabilityLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._3723199probabilityLabel;
            if (_local_2 !== _arg_1)
            {
                this._3723199probabilityLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "probabilityLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:WingAdvancedPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WingAdvancedPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WingAdvancedPanelWatcherSetupUtil");
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

        private function _WingAdvancedPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = WingAdvancedPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function joinViewClear():void
        {
            mainWing.clean();
            _wingList = new ArrayCollection();
            pageSelector.initPageSeletor(_wingList.length, NUM_PER_PAGE);
        }

        public function onCheckClick(_arg_1:Object):void
        {
            var _local_2:Boolean = _arg_1.selected;
            _arg_1.selected = (!(_local_2));
            if (_arg_1.selected)
            {
                selectedNum++;
            }
            else
            {
                selectedNum--;
            };
            updateState();
        }

        private function _WingAdvancedPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WINGADVANCEDPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pTitle.text = _arg_1;
            }, "pTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WINGADVANCEDPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingAdvancedPanel_BasicTxtButton1.label = _arg_1;
            }, "_WingAdvancedPanel_BasicTxtButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                mainWing.acceptObj = _arg_1;
            }, "mainWing.acceptObj");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WINGADVANCEDPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                joinButton.label = _arg_1;
            }, "joinButton.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WINGADVANCEDPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingAdvancedPanel_BasicTxtButton2.label = _arg_1;
            }, "_WingAdvancedPanel_BasicTxtButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WINGADVANCEDPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingAdvancedPanel_BasicTxtButton3.label = _arg_1;
            }, "_WingAdvancedPanel_BasicTxtButton3.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WINGADVANCEDPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingAdvancedPanel_BasicTxtButton4.label = _arg_1;
            }, "_WingAdvancedPanel_BasicTxtButton4.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WINGADVANCEDPANEL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingAdvancedPanel_IntroText1.htmlText = _arg_1;
            }, "_WingAdvancedPanel_IntroText1.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():PageSelector
            {
                return (pageSelector);
            }, function (_arg_1:PageSelector):void
            {
                assistantDataGrid.pageSelector = _arg_1;
            }, "assistantDataGrid.pageSelector");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WINGADVANCEDPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingAdvancedPanel_DataGridColumn2.headerText = _arg_1;
            }, "_WingAdvancedPanel_DataGridColumn2.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WINGADVANCEDPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingAdvancedPanel_DataGridColumn3.headerText = _arg_1;
            }, "_WingAdvancedPanel_DataGridColumn3.headerText");
            result[10] = binding;
            return (result);
        }

        private function onJoin(_arg_1:Object):void
        {
            var _local_2:ISlot;
            if (_arg_1)
            {
                if (_arg_1.f)
                {
                    _core.sysMidNote(Language.WINGADVANCEDPANEL_S[1]);
                    _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.i] = _arg_1.n;
                    _local_2 = _core.view.getSlot(_arg_1.sid);
                    if (_local_2)
                    {
                        _local_2.giid = _arg_1.i;
                    };
                }
                else
                {
                    _core.sysMidNote(Language.WINGADVANCEDPANEL_S[2]);
                    joinViewClear();
                };
            };
        }

        private function _WingAdvancedPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WingAdvancedPanel_DataGridColumn3 = _local_1;
            _local_1.width = 50;
            _local_1.itemRenderer = _WingAdvancedPanel_ClassFactory3_c();
            BindingManager.executeBindings(this, "_WingAdvancedPanel_DataGridColumn3", _WingAdvancedPanel_DataGridColumn3);
            return (_local_1);
        }

        public function set pTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1007683640pTitle;
            if (_local_2 !== _arg_1)
            {
                this._1007683640pTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get probabilityLabel():Label
        {
            return (this._3723199probabilityLabel);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            pageOffset = _arg_1;
            if (_wingList)
            {
                pageOffset = _arg_1;
                assistantDataGrid.dataProvider = ToolKit.getPageCollection(_wingList, _arg_1, _arg_2);
            };
        }

        public function set mainWing(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object = this._8346268mainWing;
            if (_local_2 !== _arg_1)
            {
                this._8346268mainWing = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainWing", _local_2, _arg_1));
            };
        }

        override public function update():void
        {
            if (visible)
            {
                mainWing.addEventListener(GameEvent.SLOT_GIID_CHANGE, mainWingChange);
            }
            else
            {
                mainWing.removeEventListener(GameEvent.SLOT_GIID_CHANGE, mainWingChange);
                reset();
                joinViewClear();
            };
        }

        public function __countLabel_click(_arg_1:MouseEvent):void
        {
            onAllClick();
        }

        private function _WingAdvancedPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WingAdvancedPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 80;
            _local_1.itemRenderer = _WingAdvancedPanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_WingAdvancedPanel_DataGridColumn2", _WingAdvancedPanel_DataGridColumn2);
            return (_local_1);
        }

        override public function initView():void
        {
            reset();
            joinViewClear();
        }

        [Bindable(event="propertyChange")]
        public function get pTitle():BasicTitleCanvas
        {
            return (this._1007683640pTitle);
        }

        private function _WingAdvancedPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemSlot;
            return (_local_1);
        }

        public function wingFresh():void
        {
            var _local_9:Object;
            var _local_10:String;
            var _local_11:Object;
            if (!mainWing.slotData)
            {
                return;
            };
            var _local_1:Object = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][mainWing.slotData.itemId];
            if (!_local_1)
            {
                return;
            };
            var _local_2:int = _local_1.tid;
            var _local_3:Object = _core.data.gameData[GamePredef.TBL_EQUIPT_TEMPLATE][_local_2];
            if (!_local_3)
            {
                return;
            };
            var _local_4:Object = _core.data.bagSlotIndex;
            var _local_5:Array = _local_4[GamePredef.TBL_EQUIPT_INSTANCE][_local_2];
            var _local_6:int = _local_1.color;
            maxWings = GamePredef.WING_MAX_ADVANCED_JOIN[_local_6];
            probabilityArr = GamePredef.WING_ADVANCED_JOIN_RATE[_local_6];
            if (_core.MC_BIRTH_FLAG[ToolKit.add(_local_6, 8)])
            {
                probabilityArr = GamePredef.MC_BIRTH_CONFIG[ToolKit.add(_local_6, 8)];
            };
            var _local_7:Array = [];
            var _local_8:ArrayCollection = new ArrayCollection();
            for (_local_10 in _local_5)
            {
                _local_9 = _core.data.sList[_local_5[_local_10]];
                if (_local_9)
                {
                    _local_11 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_local_9.itemId];
                    if (!((!(_local_11)) || (!(_local_11.color == _local_6))))
                    {
                        if (_local_1.id != _local_11.id)
                        {
                            if (_local_1.tid == _local_11.tid)
                            {
                                if (((_core.data.isBagSlot(Number(_local_9.sid))) && (_local_9.stackNum > 0)))
                                {
                                    _local_8.addItem({
                                        "id":_local_9.id,
                                        "type":GamePredef.TBL_EQUIPT_INSTANCE,
                                        "itemId":_local_11.id,
                                        "stackNum":1,
                                        "name":_local_3.name,
                                        "colorValue":GamePredef.CODE_ITEM_COLOR[_local_11.color],
                                        "color":_local_11.color,
                                        "binded":_local_11.binded,
                                        "selected":false
                                    });
                                };
                            };
                        };
                    };
                };
            };
            _wingList = _local_8;
            pageSelector.initPageSeletor(_wingList.length, NUM_PER_PAGE);
            allChkBox.enabled = true;
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            update();
        }

        public function set joinButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1034217724joinButton;
            if (_local_2 !== _arg_1)
            {
                this._1034217724joinButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get joinButton():BasicGlowButton
        {
            return (this._1034217724joinButton);
        }


    }
}//package com.qeedoo.ui.view.compDragable

