// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SoulExchangePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.List;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.collections.Sort;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.collections.ArrayCollection;
    import mx.collections.SortField;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.core.ClassFactory;
    import mx.events.PropertyChangeEvent;
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

    public class SoulExchangePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2034549083soulExcList:List;
        public var _SoulExchangePanel_Label1:Label;
        public var _SoulExchangePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var isInited:Boolean = false;
        private var _1662412570chipInfo:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":355,
                    "height":425,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SoulExchangePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_SoulExchangePanel_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":65,
                                "y":40
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"chipInfo",
                        "stylesFactory":function ():void
                        {
                            this.right = "30";
                            this.color = 16775802;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":40});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":60,
                                "width":335,
                                "height":350,
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":List,
                                    "id":"soulExcList",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.right = "0";
                                        this.borderStyle = "none";
                                        this.left = "0";
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "width":335,
                                            "height":340,
                                            "itemRenderer":_SoulExchangePanel_ClassFactory1_c()
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

        public function SoulExchangePanel()
        {
            mx_internal::_document = this;
            this.width = 355;
            this.height = 425;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___SoulExchangePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SoulExchangePanel._watcherSetupUtil = _arg_1;
        }


        private function _SoulExchangePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SOUL_EXCHANGE_PANEL[0];
            _local_1 = Language.PET_SOUL_S[34];
            _local_1 = Language.PET_SOUL_S[34];
            _local_1 = null;
        }

        public function updateView():void
        {
            var _local_3:*;
            var _local_4:Sort;
            var _local_5:Object;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            var _local_1:Object = _core.data.gameDataIndex2[GamePredef.TBL_PET_SOUL][1];
            var _local_2:ArrayCollection = new ArrayCollection();
            for (_local_3 in _local_1)
            {
                _local_5 = new Object();
                _local_5.soulId = _local_1[_local_3].id;
                _local_5.reqChip = _local_1[_local_3].reqChip;
                _local_5.sort1 = _local_1[_local_3].color;
                _local_5.sort2 = _local_1[_local_3].propType;
                _local_5.color = GamePredef.CODE_SOUL_COLOR[_local_1[_local_3].color];
                _local_5.name = _local_1[_local_3].name;
                _local_5.desc = _local_1[_local_3].desc;
                _local_2.addItem(_local_5);
            };
            _local_4 = new Sort();
            _local_4.fields = [new SortField("sort1", true, true, true), new SortField("sort2", true, false, true)];
            _local_2.sort = _local_4;
            _local_2.refresh();
            soulExcList.dataProvider = _local_2;
            if (_core.player)
            {
                chipInfo.text = (Language.PET_SOUL_S[12] + _core.player.soulChip);
            };
        }

        override public function initialize():void
        {
            var target:SoulExchangePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SoulExchangePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SoulExchangePanelWatcherSetupUtil");
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

        private function _SoulExchangePanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = SoulExchangePanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        override public function initView():void
        {
            isInited = true;
            updateView();
        }

        private function _SoulExchangePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SOUL_EXCHANGE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SoulExchangePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SoulExchangePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SoulExchangePanel_Label1.text = _arg_1;
            }, "_SoulExchangePanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                chipInfo.text = _arg_1;
            }, "chipInfo.text");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                soulExcList.setStyle("borderSkin", _arg_1);
            }, "soulExcList.borderSkin");
            result[3] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get soulExcList():List
        {
            return (this._2034549083soulExcList);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                updateView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get chipInfo():Label
        {
            return (this._1662412570chipInfo);
        }

        public function set chipInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1662412570chipInfo;
            if (_local_2 !== _arg_1)
            {
                this._1662412570chipInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipInfo", _local_2, _arg_1));
            };
        }

        public function ___SoulExchangePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function set soulExcList(_arg_1:List):void
        {
            var _local_2:Object = this._2034549083soulExcList;
            if (_local_2 !== _arg_1)
            {
                this._2034549083soulExcList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulExcList", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

