// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionRank

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.Repeater;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.CrossContentionRankLine;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import mx.binding.RepeatableBinding;
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

    public class CrossContentionRank extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3613077vbox:VBox;
        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _102977279lines:Repeater;
        private var _2112780921_CrossContentionRank_VBox1:VBox;
        public var _CrossContentionRank_CrossContentionRankLine1:Array;
        public var _CrossContentionRank_Label1:Label;
        public var _CrossContentionRank_Label2:Label;
        public var _CrossContentionRank_Label3:Label;
        public var _CrossContentionRank_Label4:Label;
        public var _CrossContentionRank_Label5:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":625,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "7";
                            this.right = "7";
                            this.top = "40";
                            this.bottom = "25";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionRank_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "25";
                                        this.left = "35";
                                        this.fontSize = 16;
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":55});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionRank_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "25";
                                        this.left = "120";
                                        this.fontSize = 16;
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":95});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionRank_Label3",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "25";
                                        this.left = "230";
                                        this.fontSize = 16;
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":95});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionRank_Label4",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "25";
                                        this.left = "330";
                                        this.fontSize = 16;
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":95});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionRank_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "25";
                                        this.left = "440";
                                        this.fontSize = 16;
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":95});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"vbox",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "60";
                                        this.horizontalCenter = "0";
                                        this.horizontalGap = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":565,
                                            "height":355,
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Repeater,
                                                "id":"lines",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":CrossContentionRankLine,
                                                            "id":"_CrossContentionRank_CrossContentionRankLine1"
                                                        })]});
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
        private var _3106ac:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossContentionRank()
        {
            mx_internal::_document = this;
            this.width = 625;
            this.height = 500;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionRank_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionRank._watcherSetupUtil = _arg_1;
        }


        public function ___CrossContentionRank_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get vbox():VBox
        {
            return (this._3613077vbox);
        }

        override public function initialize():void
        {
            var target:CrossContentionRank;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionRank_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionRankWatcherSetupUtil");
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
        private function get ac():ArrayCollection
        {
            return (this._3106ac);
        }

        private function init():void
        {
        }

        public function set vbox(_arg_1:VBox):void
        {
            var _local_2:Object = this._3613077vbox;
            if (_local_2 !== _arg_1)
            {
                this._3613077vbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        private function _CrossContentionRank_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[162];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[163];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[164];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[165];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[175];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[174];
            _local_1 = ac;
            _local_1 = lines.currentItem;
        }

        private function set ac(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._3106ac;
            if (_local_2 !== _arg_1)
            {
                this._3106ac = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ac", _local_2, _arg_1));
            };
        }

        private function _CrossContentionRank_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[162];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[163];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionRank_Label1.text = _arg_1;
            }, "_CrossContentionRank_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[164];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionRank_Label2.text = _arg_1;
            }, "_CrossContentionRank_Label2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[165];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionRank_Label3.text = _arg_1;
            }, "_CrossContentionRank_Label3.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[175];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionRank_Label4.text = _arg_1;
            }, "_CrossContentionRank_Label4.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[174];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionRank_Label5.text = _arg_1;
            }, "_CrossContentionRank_Label5.text");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ac);
            }, function (_arg_1:Object):void
            {
                lines.dataProvider = _arg_1;
            }, "lines.dataProvider");
            result[6] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (lines.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _CrossContentionRank_CrossContentionRankLine1[_arg_2[0]].refreshData = _arg_1;
            }, "_CrossContentionRank_CrossContentionRankLine1.refreshData");
            result[7] = binding;
            return (result);
        }

        public function open(_arg_1:Object, _arg_2:Object):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Array;
            var _local_7:Object;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:int;
            var _local_14:int;
            var _local_15:Object;
            var _local_16:Object;
            if (!_arg_2)
            {
                return;
            };
            if (!_arg_1)
            {
                _arg_1 = {};
            };
            super.visible = true;
            var _local_3:Object = {};
            ac.removeAll();
            for (_local_4 in _arg_2)
            {
                _local_11 = _arg_2[_local_4];
                if (_local_11)
                {
                    for (_local_12 in _local_11)
                    {
                        _local_13 = CrossContentionTotalPanel.CROSS_CONTENTION_UINT_ID[_local_12];
                        _local_14 = _local_11[_local_12];
                        if (!_local_3[_local_13])
                        {
                            _local_3[_local_13] = {
                                "uid":_local_13,
                                "servers":{},
                                "areaNum":0,
                                "areas":"",
                                "num":0
                            };
                        };
                        if (!_local_3[_local_13].servers[_local_12])
                        {
                            _local_3[_local_13].servers[_local_12] = {"num":0};
                        };
                        _local_3[_local_13].servers[_local_12].num = (_local_3[_local_13].servers[_local_12].num + _local_14);
                        _local_3[_local_13].num = (_local_3[_local_13].num + _local_14);
                    };
                };
            };
            for (_local_5 in _arg_1)
            {
                _local_15 = _arg_1[_local_5];
                if (_local_3[_local_15])
                {
                    _local_3[_local_15].areaNum = (_local_3[_local_15].areaNum + 1);
                    if (_local_3[_local_15].areas.length > 0)
                    {
                        _local_3[_local_15].areas = (_local_3[_local_15].areas + "\n");
                    };
                    _local_3[_local_15].areas = (_local_3[_local_15].areas + GamePredef.CROSS_CONTENTION_MAP[_local_5].name);
                };
            };
            _local_6 = [];
            for (_local_7 in _local_3)
            {
                _local_6.push(_local_3[_local_7]);
            };
            _local_6.sort(sortByType);
            _local_8 = 0;
            _local_9 = 100000;
            _local_10 = 0;
            while (_local_10 < _local_6.length)
            {
                _local_16 = _local_6[_local_10];
                if (_local_16.num < _local_9)
                {
                    _local_8 = (_local_10 + 1);
                    _local_9 = _local_16.num;
                };
                _local_16.index = _local_8;
                ac.addItem(_local_16);
                _local_10++;
            };
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        private function sortByType(_arg_1:Object, _arg_2:Object):Number
        {
            if (_arg_1.num == _arg_2.num)
            {
                return (0);
            };
            if (_arg_1.num < _arg_2.num)
            {
                return (1);
            };
            return (-1);
        }

        public function set _CrossContentionRank_VBox1(_arg_1:VBox):void
        {
            var _local_2:Object = this._2112780921_CrossContentionRank_VBox1;
            if (_local_2 !== _arg_1)
            {
                this._2112780921_CrossContentionRank_VBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_CrossContentionRank_VBox1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get _CrossContentionRank_VBox1():VBox
        {
            return (this._2112780921_CrossContentionRank_VBox1);
        }

        public function set lines(_arg_1:Repeater):void
        {
            var _local_2:Object = this._102977279lines;
            if (_local_2 !== _arg_1)
            {
                this._102977279lines = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lines", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lines():Repeater
        {
            return (this._102977279lines);
        }


    }
}//package com.qeedoo.ui.view.compDragable

