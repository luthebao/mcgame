// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetArenaPrevRankPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
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

    public class PetArenaPrevRankPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1554141558tabBtn1:BasicGlowButton;
        private var _1554141554tabBtn5:BasicGlowButton;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _1194431643idData:DataGrid;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var _1554141559tabBtn0:BasicGlowButton;
        public var _PetArenaPrevRankPanel_DataGridColumn1:DataGridColumn;
        private var _1554141555tabBtn4:BasicGlowButton;
        public var _PetArenaPrevRankPanel_DataGridColumn3:DataGridColumn;
        public var _PetArenaPrevRankPanel_DataGridColumn4:DataGridColumn;
        public var _PetArenaPrevRankPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _PetArenaPrevRankPanel_DataGridColumn2:DataGridColumn;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":480,
                    "height":360,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetArenaPrevRankPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":14,
                                "width":82,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":97,
                                "width":82,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn2",
                        "events":{"click":"__tabBtn2_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":180,
                                "width":82,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn3",
                        "events":{"click":"__tabBtn3_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":263,
                                "width":82,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn4",
                        "events":{"click":"__tabBtn4_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":346,
                                "width":82,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn5",
                        "events":{"click":"__tabBtn5_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":398,
                                "width":75,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "65";
                            this.left = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":470,
                                "height":250,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"idData",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "sortableColumns":false,
                                            "resizableColumns":false,
                                            "draggableColumns":false,
                                            "doubleClickEnabled":false,
                                            "columns":[_PetArenaPrevRankPanel_DataGridColumn1_i(), _PetArenaPrevRankPanel_DataGridColumn2_i(), _PetArenaPrevRankPanel_DataGridColumn3_i(), _PetArenaPrevRankPanel_DataGridColumn4_i()]
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
        private var _1185599352aRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _167710345bRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _1521020042cRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _1420637557dRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _67327860eRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _1285981837fRankDataProvider:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetArenaPrevRankPanel()
        {
            mx_internal::_document = this;
            this.width = 480;
            this.height = 360;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___PetArenaPrevRankPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetArenaPrevRankPanel._watcherSetupUtil = _arg_1;
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

        [Bindable(event="propertyChange")]
        public function get tabBtn5():BasicGlowButton
        {
            return (this._1554141554tabBtn5);
        }

        override public function initialize():void
        {
            var target:PetArenaPrevRankPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetArenaPrevRankPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetArenaPrevRankPanelWatcherSetupUtil");
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

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function ___PetArenaPrevRankPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _PetArenaPrevRankPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaPrevRankPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "tName";
            _local_1.width = 170;
            BindingManager.executeBindings(this, "_PetArenaPrevRankPanel_DataGridColumn2", _PetArenaPrevRankPanel_DataGridColumn2);
            return (_local_1);
        }

        private function set bRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._167710345bRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._167710345bRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bRankDataProvider", _local_2, _arg_1));
            };
        }

        public function set tabBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141555tabBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1554141555tabBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn4", _local_2, _arg_1));
            };
        }

        private function _PetArenaPrevRankPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaPrevRankPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PetArenaPrevRankPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn5.label = _arg_1;
            }, "tabBtn5.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaPrevRankPanel_DataGridColumn1.headerText = _arg_1;
            }, "_PetArenaPrevRankPanel_DataGridColumn1.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaPrevRankPanel_DataGridColumn2.headerText = _arg_1;
            }, "_PetArenaPrevRankPanel_DataGridColumn2.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaPrevRankPanel_DataGridColumn3.headerText = _arg_1;
            }, "_PetArenaPrevRankPanel_DataGridColumn3.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaPrevRankPanel_DataGridColumn4.headerText = _arg_1;
            }, "_PetArenaPrevRankPanel_DataGridColumn4.headerText");
            result[10] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicGlowButton
        {
            return (this._1554141555tabBtn4);
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

        private function getPrevPetRankTypeId():int
        {
            var _local_1:int = _core.player.level;
            var _local_2:* = 0;
            if (((_local_1 >= 35) && (_local_1 <= 74)))
            {
                _local_2 = 0;
            }
            else
            {
                if (((_local_1 >= 75) && (_local_1 <= 94)))
                {
                    _local_2 = 1;
                }
                else
                {
                    if (((_local_1 >= 95) && (_local_1 <= 114)))
                    {
                        _local_2 = 2;
                    }
                    else
                    {
                        if (((_local_1 >= 115) && (_local_1 <= 134)))
                        {
                            _local_2 = 3;
                        }
                        else
                        {
                            if (((_local_1 >= 135) && (_local_1 <= 154)))
                            {
                                _local_2 = 4;
                            }
                            else
                            {
                                if (_local_1 >= 155)
                                {
                                    _local_2 = 5;
                                };
                            };
                        };
                    };
                };
            };
            return (_local_2);
        }

        [Bindable(event="propertyChange")]
        private function get bRankDataProvider():ArrayCollection
        {
            return (this._167710345bRankDataProvider);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        private function set dRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1420637557dRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1420637557dRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dRankDataProvider", _local_2, _arg_1));
            };
        }

        private function _PetArenaPrevRankPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaPrevRankPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "level";
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_PetArenaPrevRankPanel_DataGridColumn4", _PetArenaPrevRankPanel_DataGridColumn4);
            return (_local_1);
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

        public function init():void
        {
            _core.remote.call("getLastPetArenaRank", new Responder(onGetPetArenaRankData));
        }

        [Bindable(event="propertyChange")]
        private function get aRankDataProvider():ArrayCollection
        {
            return (this._1185599352aRankDataProvider);
        }

        public function set tabBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141554tabBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1554141554tabBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get dRankDataProvider():ArrayCollection
        {
            return (this._1420637557dRankDataProvider);
        }

        [Bindable(event="propertyChange")]
        private function get eRankDataProvider():ArrayCollection
        {
            return (this._67327860eRankDataProvider);
        }

        [Bindable(event="propertyChange")]
        private function get fRankDataProvider():ArrayCollection
        {
            return (this._1285981837fRankDataProvider);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
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

        public function __tabBtn5_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(5);
        }

        private function set fRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1285981837fRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1285981837fRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fRankDataProvider", _local_2, _arg_1));
            };
        }

        private function set aRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1185599352aRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1185599352aRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aRankDataProvider", _local_2, _arg_1));
            };
        }

        private function tabBtnClick(_arg_1:int):void
        {
            var _local_2:* = 6;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this[("tabBtn" + _local_3)].selected = false;
                _local_3++;
            };
            switch (_arg_1)
            {
                case 0:
                    idData.dataProvider = aRankDataProvider;
                    break;
                case 1:
                    idData.dataProvider = bRankDataProvider;
                    break;
                case 2:
                    idData.dataProvider = cRankDataProvider;
                    break;
                case 3:
                    idData.dataProvider = dRankDataProvider;
                    break;
                case 4:
                    idData.dataProvider = eRankDataProvider;
                    break;
                case 5:
                    idData.dataProvider = fRankDataProvider;
                    break;
            };
            this[("tabBtn" + _arg_1)].selected = true;
        }

        [Bindable(event="propertyChange")]
        private function get cRankDataProvider():ArrayCollection
        {
            return (this._1521020042cRankDataProvider);
        }

        private function set eRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._67327860eRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._67327860eRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eRankDataProvider", _local_2, _arg_1));
            };
        }

        private function set cRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1521020042cRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1521020042cRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cRankDataProvider", _local_2, _arg_1));
            };
        }

        public function set idData(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1194431643idData;
            if (_local_2 !== _arg_1)
            {
                this._1194431643idData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idData", _local_2, _arg_1));
            };
        }

        private function onGetPetArenaRankData(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:ArrayCollection;
            var _local_4:Object;
            if (!_arg_1)
            {
                return;
            };
            while (_local_2 < 6)
            {
                if (_arg_1[_local_2])
                {
                    _local_3 = new ArrayCollection();
                    for each (_local_4 in _arg_1[_local_2])
                    {
                        _local_4.rank = (_local_4.rank + 1);
                        _local_3.addItem(_local_4);
                    };
                    switch (_local_2)
                    {
                        case 0:
                            aRankDataProvider = _local_3;
                            break;
                        case 1:
                            bRankDataProvider = _local_3;
                            break;
                        case 2:
                            cRankDataProvider = _local_3;
                            break;
                        case 3:
                            dRankDataProvider = _local_3;
                            break;
                        case 4:
                            eRankDataProvider = _local_3;
                            break;
                        case 5:
                            fRankDataProvider = _local_3;
                            break;
                    };
                };
                _local_2++;
            };
            tabBtnClick(getPrevPetRankTypeId());
        }

        private function _PetArenaPrevRankPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaPrevRankPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "rank";
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_PetArenaPrevRankPanel_DataGridColumn1", _PetArenaPrevRankPanel_DataGridColumn1);
            return (_local_1);
        }

        private function _PetArenaPrevRankPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaPrevRankPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 200;
            BindingManager.executeBindings(this, "_PetArenaPrevRankPanel_DataGridColumn3", _PetArenaPrevRankPanel_DataGridColumn3);
            return (_local_1);
        }

        private function _PetArenaPrevRankPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_ARENA_RANK_U[8];
            _local_1 = Language.PET_ARENA_RANK_U[9];
            _local_1 = Language.PET_ARENA_RANK_U[10];
            _local_1 = Language.PET_ARENA_RANK_U[11];
            _local_1 = Language.PET_ARENA_RANK_U[12];
            _local_1 = Language.PET_ARENA_RANK_U[13];
            _local_1 = Language.PET_ARENA_RANK_U[14];
            _local_1 = Language.PET_ARENA_RANK_U[3];
            _local_1 = Language.PET_ARENA_RANK_U[1];
            _local_1 = Language.PET_ARENA_RANK_U[2];
            _local_1 = Language.PET_ARENA_RANK_U[4];
        }

        [Bindable(event="propertyChange")]
        public function get idData():DataGrid
        {
            return (this._1194431643idData);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(4);
        }


    }
}//package com.qeedoo.ui.view.compDragable

