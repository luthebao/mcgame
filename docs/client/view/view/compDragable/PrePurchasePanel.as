// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PrePurchasePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextArea;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.PrePurchaseListRenderer;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
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

    public class PrePurchasePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _18543865timeLable:TextArea;
        private var _3322014list:List;
        public var _PrePurchasePanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _PrePurchasePanel_Image1:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":650,
                    "height":435,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PrePurchasePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "height":400,
                                "width":640,
                                "x":5,
                                "y":30,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_PrePurchasePanel_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":640,
                                            "height":400
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextArea,
                                    "id":"timeLable",
                                    "stylesFactory":function ():void
                                    {
                                        this.leading = 7;
                                        this.borderThickness = 0;
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                        this.bottom = "5";
                                        this.left = "5";
                                        this.fontWeight = "bold";
                                        this.fontSize = 12;
                                        this.textAlign = "right";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "wordWrap":true,
                                            "text":"",
                                            "width":397,
                                            "height":37
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":List,
                                    "id":"list",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "0";
                                        this.top = "1";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "itemRenderer":_PrePurchasePanel_ClassFactory1_c(),
                                            "width":230,
                                            "height":400,
                                            "labelField":"name",
                                            "styleName":"CSSBorder"
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _2128318134itemDatas:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PrePurchasePanel()
        {
            mx_internal::_document = this;
            this.width = 650;
            this.height = 435;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PrePurchasePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get timeLable():TextArea
        {
            return (this._18543865timeLable);
        }

        public function showPanel():void
        {
            initView();
        }

        public function set list(_arg_1:List):void
        {
            var _local_2:Object = this._3322014list;
            if (_local_2 !== _arg_1)
            {
                this._3322014list = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "list", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemDatas():ArrayCollection
        {
            return (this._2128318134itemDatas);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            visible = true;
            _core.remote.call("initPPCHESData", null, null);
        }

        public function list_itemClickHandler(data:*):void
        {
            var itemId:* = undefined;
            var _trialsAlert:* = undefined;
            var handler:Function;
            var str:String;
            itemId = data.id;
            if ((((!(data)) || (!(data.btnStatus))) || (itemId <= 0)))
            {
                return;
            };
            if (((data.btnStatus == 2) || (data.btnStatus == 5)))
            {
                handler = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("getPPCHESItem", null, itemId);
                    };
                };
                if (_trialsAlert)
                {
                    PopUpManager.removePopUp(_trialsAlert);
                    _trialsAlert = null;
                };
                str = "";
                if (data.btnStatus == 2)
                {
                    str = Language.PPCHES_PANEL[1].toString().replace("{gold}", data.price).replace("{item}", data.name);
                };
                if (data.btnStatus == 5)
                {
                    str = Language.PPCHES_PANEL[2].toString().replace("{item}", data.name);
                };
                _trialsAlert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            };
        }

        override public function initialize():void
        {
            var target:PrePurchasePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PrePurchasePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PrePurchasePanelWatcherSetupUtil");
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

        public function set itemDatas(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._2128318134itemDatas;
            if (_local_2 !== _arg_1)
            {
                this._2128318134itemDatas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemDatas", _local_2, _arg_1));
            };
        }

        private function _PrePurchasePanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = PrePurchaseListRenderer;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get list():List
        {
            return (this._3322014list);
        }

        public function set timeLable(_arg_1:TextArea):void
        {
            var _local_2:Object = this._18543865timeLable;
            if (_local_2 !== _arg_1)
            {
                this._18543865timeLable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeLable", _local_2, _arg_1));
            };
        }

        private function _PrePurchasePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PPCHES_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PrePurchasePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PrePurchasePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003800));
            }, function (_arg_1:Object):void
            {
                _PrePurchasePanel_Image1.source = _arg_1;
            }, "_PrePurchasePanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                timeLable.filters = _arg_1;
            }, "timeLable.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (itemDatas);
            }, function (_arg_1:Object):void
            {
                list.dataProvider = _arg_1;
            }, "list.dataProvider");
            result[3] = binding;
            return (result);
        }

        private function _PrePurchasePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PPCHES_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220003800);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = itemDatas;
        }

        public function onPPCHESData(_arg_1:*):void
        {
            var _local_3:*;
            if (!_arg_1)
            {
                return;
            };
            timeLable.htmlText = _arg_1.timeStr;
            var _local_2:ArrayCollection = new ArrayCollection();
            if (_arg_1.items)
            {
                for (_local_3 in _arg_1.items)
                {
                    _local_2.addItem(_arg_1.items[_local_3]);
                };
            };
            itemDatas = _local_2;
        }


    }
}//package com.qeedoo.ui.view.compDragable

