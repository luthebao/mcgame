// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GrouponItem

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicLabel;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.utils.LanguageUtil;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import mx.managers.PopUpManager;
    import mx.core.Application;
    import flash.display.DisplayObject;
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

    public class GrouponItem extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1177331774itemName:Label;
        private var _1431735300champImg:Image;
        private var _1062455962needPoint:Label;
        private var _1434441996champText:TextArea;
        private var _577306056totalSold:BasicLabel;
        public var _GrouponItem_BasicGlowButton1:BasicGlowButton;
        private var _1003821632textNext:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":215,
                    "height":165,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":200,
                                "height":155,
                                "maintainAspectRatio":false,
                                "source":_embed_mxml__style_Common_Components_swf_CanvasBorder_850327948
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalAlign = "center";
                            this.verticalGap = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":8,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalAlign = "middle";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"itemName",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"needPoint",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicLabel,
                                    "id":"totalSold",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":180,
                                            "height":25
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"textNext",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":180});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_GrouponItem_BasicGlowButton1",
                                    "events":{"click":"___GrouponItem_BasicGlowButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CrystalYellowButton",
                                            "width":90,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"txtArea",
                                            "width":200,
                                            "height":38,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"champText",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                    this.color = 0xFFFFFF;
                                                    this.backgroundAlpha = 0;
                                                    this.textAlign = "left";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "editable":false,
                                                        "selectable":false,
                                                        "y":2,
                                                        "x":10,
                                                        "width":180,
                                                        "height":34
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"champImg",
                        "stylesFactory":function ():void
                        {
                            this.left = "-20";
                            this.bottom = "0";
                        }
                    })]
                });
            }
        });
        private var _embed_mxml__style_Common_Components_swf_CanvasBorder_850327948:Class = GrouponItem__embed_mxml__style_Common_Components_swf_CanvasBorder_850327948;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GrouponItem()
        {
            mx_internal::_document = this;
            this.width = 215;
            this.height = 165;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GrouponItem._watcherSetupUtil = _arg_1;
        }


        private function _GrouponItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT]);
            }, function (_arg_1:Array):void
            {
                itemName.filters = _arg_1;
            }, "itemName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT]);
            }, function (_arg_1:Array):void
            {
                needPoint.filters = _arg_1;
            }, "needPoint.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT]);
            }, function (_arg_1:Array):void
            {
                textNext.filters = _arg_1;
            }, "textNext.filters");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponItem_BasicGlowButton1.label = _arg_1;
            }, "_GrouponItem_BasicGlowButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT]);
            }, function (_arg_1:Array):void
            {
                champText.filters = _arg_1;
            }, "champText.filters");
            result[4] = binding;
            return (result);
        }

        public function set itemName(_arg_1:Label):void
        {
            var _local_2:Object = this._1177331774itemName;
            if (_local_2 !== _arg_1)
            {
                this._1177331774itemName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemName", _local_2, _arg_1));
            };
        }

        private function _GrouponItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT];
            _local_1 = Language.GROUPON_PANEL[6];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT];
        }

        [Bindable(event="propertyChange")]
        public function get champImg():Image
        {
            return (this._1431735300champImg);
        }

        [Bindable(event="propertyChange")]
        public function get itemName():Label
        {
            return (this._1177331774itemName);
        }

        private function updateView(_arg_1:Event=null):void
        {
            ((_arg_1) && (this.removeEventListener(FlexEvent.CREATION_COMPLETE, updateView)));
            if (!data)
            {
                this.toolTip = "";
                return;
            };
            itemName.text = data.name;
            if (GrouponPanel.isRenRen)
            {
                needPoint.text = ((int(data.point) / 10) + Language.GROUPON_PANEL[39]);
            }
            else
            {
                needPoint.text = (data.point + Language.GROUPON_PANEL[19]);
            };
            totalSold.text = LanguageUtil.replace(Language.GROUPON_PANEL[4], {
                "sold":data.sold,
                "gold":data.unitGold
            });
            var _local_2:String = ((data.left < 0) ? LanguageUtil.replace(Language.GROUPON_PANEL[34], {"gold":data.nextUnit}) : LanguageUtil.replace(Language.GROUPON_PANEL[5], {
    "left":data.left,
    "gold":data.nextUnit
}));
            textNext.mx_internal::getTextField().wordWrap = true;
            textNext.text = _local_2;
            var _local_3:* = "";
            if (((data.champName) && (data.champBuy)))
            {
                _local_3 = LanguageUtil.replace(Language.GROUPON_PANEL[7], {
                    "player":data.champName,
                    "num":data.champBuy
                });
                _local_3 = (_local_3 + (("\n" + Language.GROUPON_PANEL[40]) + getServerName(data.serverId)));
            };
            champText.htmlText = _local_3;
            this.toolTip = ((data.desc) ? data.desc : "");
        }

        public function set champImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1431735300champImg;
            if (_local_2 !== _arg_1)
            {
                this._1431735300champImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "champImg", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:GrouponItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GrouponItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GrouponItemWatcherSetupUtil");
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
        public function get champText():TextArea
        {
            return (this._1434441996champText);
        }

        public function ___GrouponItem_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            sendHandler(_arg_1);
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            if (!_arg_1)
            {
                this.toolTip = "";
                return;
            };
            if (!this.initialized)
            {
                this.addEventListener(FlexEvent.CREATION_COMPLETE, updateView);
                return;
            };
            updateView();
        }

        private function sendHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            var _local_2:GrouponSendPanel = GrouponSendPanel.instance;
            PopUpManager.removePopUp(_local_2);
            PopUpManager.addPopUp(_local_2, (Application.application as DisplayObject));
            PopUpManager.centerPopUp(_local_2);
            var _local_3:String = data.itemId;
            _local_2.updateView(_local_3);
        }

        private function getServerName(_arg_1:Number):String
        {
            if (!_arg_1)
            {
                return ("");
            };
            if (((_arg_1 >= 500) && (_arg_1 <= 799)))
            {
                return (GamePredef.CROSS_CONTENTION_UNITED_SERVER_NAME[_arg_1]);
            };
            return (_arg_1.toString());
        }

        public function set champText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1434441996champText;
            if (_local_2 !== _arg_1)
            {
                this._1434441996champText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "champText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needPoint():Label
        {
            return (this._1062455962needPoint);
        }

        public function set needPoint(_arg_1:Label):void
        {
            var _local_2:Object = this._1062455962needPoint;
            if (_local_2 !== _arg_1)
            {
                this._1062455962needPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needPoint", _local_2, _arg_1));
            };
        }

        public function set totalSold(_arg_1:BasicLabel):void
        {
            var _local_2:Object = this._577306056totalSold;
            if (_local_2 !== _arg_1)
            {
                this._577306056totalSold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalSold", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get totalSold():BasicLabel
        {
            return (this._577306056totalSold);
        }

        [Bindable(event="propertyChange")]
        public function get textNext():Label
        {
            return (this._1003821632textNext);
        }

        public function set textNext(_arg_1:Label):void
        {
            var _local_2:Object = this._1003821632textNext;
            if (_local_2 !== _arg_1)
            {
                this._1003821632textNext = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textNext", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

