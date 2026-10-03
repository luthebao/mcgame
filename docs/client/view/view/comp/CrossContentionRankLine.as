// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CrossContentionRankLine

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.compDragable.CrossContentionTotalPanel;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
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

    public class CrossContentionRankLine extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _466105302pointNum:Label;
        private var _3773vs:Image;
        private var _1666152091areaTips:Label;
        private var _100346066index:Label;
        private var _741253061serversName:Label;
        private var _746488903areaNum:Label;
        private var _292854225unitName:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":545,
                    "height":60,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"vs",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"index",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.left = "20";
                            this.fontSize = 16;
                            this.color = 0xFFFF00;
                            this.fontWeight = "bold";
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":45,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"unitName",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.left = "100";
                            this.fontSize = 16;
                            this.color = 0xFFFF00;
                            this.fontWeight = "bold";
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":85,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"serversName",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.left = "210";
                            this.fontSize = 16;
                            this.color = 0xFFFF00;
                            this.fontWeight = "bold";
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":90,
                                "height":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"pointNum",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.left = "340";
                            this.fontSize = 16;
                            this.color = 0xFFFF00;
                            this.fontWeight = "bold";
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":130,
                                "height":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"areaNum",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.left = "460";
                            this.fontSize = 16;
                            this.color = 0xFFFF00;
                            this.fontWeight = "bold";
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":130,
                                "height":25
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"areaTips",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.left = "480";
                            this.fontSize = 16;
                            this.color = 0xFF0000;
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":130,
                                "height":25
                            });
                        }
                    })]
                });
            }
        });
        private var rdata:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossContentionRankLine()
        {
            mx_internal::_document = this;
            this.width = 545;
            this.height = 60;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionRankLine._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get areaNum():Label
        {
            return (this._746488903areaNum);
        }

        public function set areaNum(_arg_1:Label):void
        {
            var _local_2:Object = this._746488903areaNum;
            if (_local_2 !== _arg_1)
            {
                this._746488903areaNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get serversName():Label
        {
            return (this._741253061serversName);
        }

        public function set areaTips(_arg_1:Label):void
        {
            var _local_2:Object = this._1666152091areaTips;
            if (_local_2 !== _arg_1)
            {
                this._1666152091areaTips = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaTips", _local_2, _arg_1));
            };
        }

        public function set pointNum(_arg_1:Label):void
        {
            var _local_2:Object = this._466105302pointNum;
            if (_local_2 !== _arg_1)
            {
                this._466105302pointNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointNum", _local_2, _arg_1));
            };
        }

        public function set serversName(_arg_1:Label):void
        {
            var _local_2:Object = this._741253061serversName;
            if (_local_2 !== _arg_1)
            {
                this._741253061serversName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "serversName", _local_2, _arg_1));
            };
        }

        private function showAreas():String
        {
            if ((((!(rdata)) || (!(rdata.areas))) || (!(areaTips.visible))))
            {
                return (Language.CROSS_CONTENTION_PANEL_U[176]);
            };
            return (rdata.areas);
        }

        public function set refreshData(_arg_1:Object):void
        {
            var _local_6:int;
            var _local_7:String;
            if (!_arg_1)
            {
                return;
            };
            rdata = _arg_1;
            index.text = rdata.index;
            unitName.text = CrossContentionTotalPanel.getServerName(Number(rdata.uid));
            if (!rdata.areaNum)
            {
                rdata.areaNum = 0;
            };
            var _local_2:Object = rdata.servers;
            pointNum.text = "";
            var _local_3:int;
            var _local_4:Array = CrossContentionTotalPanel.getUnitServersId(Number(rdata.uid));
            var _local_5:int;
            while (_local_5 < _local_4.length)
            {
                _local_6 = _local_4[_local_5];
                if (_local_3 > 0)
                {
                    serversName.text = (serversName.text + "\n");
                    pointNum.text = (pointNum.text + "\n");
                };
                _local_7 = CrossContentionTotalPanel.getServerName(Number(_local_6));
                serversName.text = (serversName.text + Language.CROSS_CONTENTION_PANEL_U[18].toString().replace("{osid}", _local_7));
                if (((_local_2) && (_local_2[_local_6])))
                {
                    pointNum.text = (pointNum.text + _local_2[_local_6].num);
                }
                else
                {
                    pointNum.text = (pointNum.text + "0");
                };
                _local_3++;
                _local_5++;
            };
            areaNum.htmlText = rdata.areaNum;
            if (int(rdata.areaNum) > 0)
            {
                areaTips.visible = true;
            }
            else
            {
                areaTips.visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get pointNum():Label
        {
            return (this._466105302pointNum);
        }

        public function init():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get index():Label
        {
            return (this._100346066index);
        }

        [Bindable(event="propertyChange")]
        public function get vs():Image
        {
            return (this._3773vs);
        }

        override public function initialize():void
        {
            var target:CrossContentionRankLine;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionRankLine_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_CrossContentionRankLineWatcherSetupUtil");
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

        public function set unitName(_arg_1:Label):void
        {
            var _local_2:Object = this._292854225unitName;
            if (_local_2 !== _arg_1)
            {
                this._292854225unitName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unitName", _local_2, _arg_1));
            };
        }

        private function _CrossContentionRankLine_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000373));
            }, function (_arg_1:Object):void
            {
                vs.source = _arg_1;
            }, "vs.source");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[173];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                areaTips.htmlText = _arg_1;
            }, "areaTips.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = showAreas();
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                areaTips.toolTip = _arg_1;
            }, "areaTips.toolTip");
            result[2] = binding;
            return (result);
        }

        public function set index(_arg_1:Label):void
        {
            var _local_2:Object = this._100346066index;
            if (_local_2 !== _arg_1)
            {
                this._100346066index = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "index", _local_2, _arg_1));
            };
        }

        private function _CrossContentionRankLine_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getIconUrl(4130220000373);
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[173];
            _local_1 = showAreas();
        }

        [Bindable(event="propertyChange")]
        public function get unitName():Label
        {
            return (this._292854225unitName);
        }

        public function set vs(_arg_1:Image):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get areaTips():Label
        {
            return (this._1666152091areaTips);
        }


    }
}//package com.qeedoo.ui.view.comp

