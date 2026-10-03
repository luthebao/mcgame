// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ConstructionManager

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Tile;
    import mx.core.Repeater;
    import com.qeedoo.ui.view.comp.BuildSlot;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.data.DataManager;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import mx.binding.RepeatableBinding;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.data.GameData;
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

    public class ConstructionManager extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _94756344close:BasicGlowButton;
        public var _ConstructionManager_BuildSlot1:Array;
        public var _ConstructionManager_BasicTitleCanvas1:BasicTitleCanvas;
        private var _622574815_ConstructionManager_Tile1:Tile;
        private var _1401224148buildList:Repeater;
        private var selectedSlot:BuildSlot = null;
        private var _1430683378buildBtn:BasicGlowButton;
        private var _1060451078myFlow:Tile;
        public var currentBuild:Object = null;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":550,
                    "height":380,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ConstructionManager_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "y":40,
                                "height":280,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Tile,
                                    "id":"myFlow",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                        this.verticalGap = 10;
                                        this.horizontalGap = 5;
                                        this.left = "8";
                                        this.right = "8";
                                        this.top = "8";
                                        this.bottom = "8";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "direction":"horizontal",
                                            "verticalScrollPolicy":"on",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Repeater,
                                                "id":"buildList",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":BuildSlot,
                                                            "id":"_ConstructionManager_BuildSlot1",
                                                            "events":{"click":"___ConstructionManager_BuildSlot1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":117,
                                                                    "height":85,
                                                                    "iconHeight":85,
                                                                    "iconWidth":117
                                                                });
                                                            }
                                                        })]});
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"buildBtn",
                        "events":{"click":"__buildBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":411,
                                "y":336,
                                "label":"建造",
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"close",
                        "events":{"click":"__close_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":478,
                                "y":336,
                                "styleName":"BtnStdRed"
                            });
                        }
                    })]
                });
            }
        });
        private var _dm:DataManager = DataManager.getInstance();
        private var dataProvider:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ConstructionManager()
        {
            mx_internal::_document = this;
            this.width = 550;
            this.height = 380;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ConstructionManager._watcherSetupUtil = _arg_1;
        }


        private function buildSelect():void
        {
            if (selectedSlot == null)
            {
                Alert.show(Language.BUILD_S[3]);
                return;
            };
            Alert.show(Language.BUILD_S[4], "", (Alert.YES | Alert.NO), null, selectedSlot.handler);
        }

        private function _ConstructionManager_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ConstructionManager_BasicTitleCanvas1.text = _arg_1;
            }, "_ConstructionManager_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (buildList.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _ConstructionManager_BuildSlot1[_arg_2[0]].slotData = _arg_1;
            }, "_ConstructionManager_BuildSlot1.slotData");
            result[1] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):int
            {
                return (GamePredef.TBL_BUILDING);
            }, function (_arg_1:int, _arg_2:Array):void
            {
                _ConstructionManager_BuildSlot1[_arg_2[0]].type = _arg_1;
            }, "_ConstructionManager_BuildSlot1.type");
            result[2] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Number
            {
                return (buildList.mx_internal::getItemAt(_arg_2[0]).id);
            }, function (_arg_1:Number, _arg_2:Array):void
            {
                _ConstructionManager_BuildSlot1[_arg_2[0]].giid = _arg_1;
            }, "_ConstructionManager_BuildSlot1.giid");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONSTRUCTIONMANAGER_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                close.label = _arg_1;
            }, "close.label");
            result[4] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get buildBtn():BasicGlowButton
        {
            return (this._1430683378buildBtn);
        }

        override public function initialize():void
        {
            var target:ConstructionManager;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ConstructionManager_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ConstructionManagerWatcherSetupUtil");
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

        public function set buildBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1430683378buildBtn;
            if (_local_2 !== _arg_1)
            {
                this._1430683378buildBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buildBtn", _local_2, _arg_1));
            };
        }

        public function __close_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get _ConstructionManager_Tile1():Tile
        {
            return (this._622574815_ConstructionManager_Tile1);
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
            clearSelection();
            selectedSlot = (_arg_1.currentTarget as BuildSlot);
            selectedSlot.selected = true;
        }

        [Bindable(event="propertyChange")]
        public function get buildList():Repeater
        {
            return (this._1401224148buildList);
        }

        private function clearSelection():void
        {
            var _local_1:int;
            while (_local_1 < myFlow.numChildren)
            {
                BuildSlot(myFlow.getChildAt(_local_1)).selected = false;
                _local_1++;
            };
        }

        public function set _ConstructionManager_Tile1(_arg_1:Tile):void
        {
            var _local_2:Object = this._622574815_ConstructionManager_Tile1;
            if (_local_2 !== _arg_1)
            {
                this._622574815_ConstructionManager_Tile1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ConstructionManager_Tile1", _local_2, _arg_1));
            };
        }

        public function showNewBuild(_arg_1:Object):void
        {
            var _local_3:Object;
            if (_arg_1 == null)
            {
                return;
            };
            currentBuild = _arg_1;
            var _local_2:Object = _dm.gameDataIndex[GamePredef.TBL_BUILDING][_arg_1.buildType];
            dataProvider.removeAll();
            for (_local_3 in _local_2)
            {
                if (ToolKit.isEqual(_local_2[_local_3].level, 1))
                {
                    dataProvider.addItem(_local_2[_local_3]);
                };
            };
            if (dataProvider.length == 0)
            {
                Alert.show(Language.BUILD_S[5], "");
                return;
            };
            buildList.dataProvider = dataProvider;
            buildBtn.label = Language.BUILD_S[0];
            this.visible = true;
        }

        public function showUpgradeBuild(_arg_1:Object):void
        {
            var _local_4:Array;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            selectedSlot = null;
            if (_arg_1 == null)
            {
                return;
            };
            currentBuild = _arg_1;
            var _local_2:* = GameData.d[GamePredef.TBL_BUILDING][_arg_1.tid];
            var _local_3:String = _local_2.postBuilding.replace(/(^\s*)|(\s*$)/g, "");
            dataProvider.removeAll();
            if (((!(_local_3 == null)) && (!(_local_3 == ""))))
            {
                _local_4 = _local_3.split("|");
                for (_local_5 in _local_4)
                {
                    if (GameData.d[GamePredef.TBL_BUILDING][_local_4[_local_5]] != null)
                    {
                        dataProvider.addItem(GameData.d[GamePredef.TBL_BUILDING][_local_4[_local_5]]);
                    };
                };
            }
            else
            {
                _local_6 = null;
                _local_7 = _dm.gameDataIndex2[GamePredef.TBL_BUILDING][_local_2.codeName];
                for (_local_5 in _local_7)
                {
                    if (ToolKit.isEqual(_local_7[_local_5].level, (Number(_local_2.level) + 1)))
                    {
                        _local_6 = _local_7[_local_5];
                        break;
                    };
                };
                if (_local_6 != null)
                {
                    dataProvider.addItem(_local_6);
                };
            };
            if (dataProvider.length == 0)
            {
                Alert.show(Language.BUILD_S[2], "");
                return;
            };
            buildList.dataProvider = dataProvider;
            buildBtn.label = Language.BUILD_S[1];
            this.visible = true;
        }

        public function set buildList(_arg_1:Repeater):void
        {
            var _local_2:Object = this._1401224148buildList;
            if (_local_2 !== _arg_1)
            {
                this._1401224148buildList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buildList", _local_2, _arg_1));
            };
        }

        private function slotDoubleClick(_arg_1:MouseEvent):void
        {
            trace("dClicked");
        }

        private function _ConstructionManager_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GUILDPANEL_U[21];
            _local_1 = buildList.currentItem;
            _local_1 = GamePredef.TBL_BUILDING;
            _local_1 = buildList.currentItem.id;
            _local_1 = Language.CONSTRUCTIONMANAGER_U[0];
        }

        public function set myFlow(_arg_1:Tile):void
        {
            var _local_2:Object = this._1060451078myFlow;
            if (_local_2 !== _arg_1)
            {
                this._1060451078myFlow = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myFlow", _local_2, _arg_1));
            };
        }

        public function ___ConstructionManager_BuildSlot1_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get close():BasicGlowButton
        {
            return (this._94756344close);
        }

        [Bindable(event="propertyChange")]
        public function get myFlow():Tile
        {
            return (this._1060451078myFlow);
        }

        public function __buildBtn_click(_arg_1:MouseEvent):void
        {
            buildSelect();
        }

        public function set close(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._94756344close;
            if (_local_2 !== _arg_1)
            {
                this._94756344close = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "close", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

