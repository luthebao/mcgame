// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipBuilding

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.data.DataManager;
    import mx.core.Repeater;
    import mx.controls.Text;
    import mx.controls.Image;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.containers.VBox;
    import mx.controls.Label;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.binding.RepeatableBinding;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.ResizeEvent;
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

    public class TipBuilding extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var dm:DataManager;
        private var _319435295preList:Repeater;
        private var _106940718prop1:Text;
        public var _TipBuilding_Text1:Text;
        public var _TipBuilding_Text2:Text;
        public var _TipBuilding_Text3:Text;
        public var _TipBuilding_Text4:Text;
        public var _TipBuilding_Text5:Text;
        private var _1638753418iconImg:Image;
        private var _106940719prop2:Text;
        public var _TipBuilding_Text10:Array;
        private var _3769vo:ToolTipVO;
        public var _TipBuilding_VBox1:VBox;
        private var _106940720prop3:Text;
        public var _TipBuilding_Label1:Label;
        public var _TipBuilding_Button1:Button;
        private var _106940721prop4:Text;
        private var _core:Core;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"_TipBuilding_VBox1",
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 0;
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":57,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipBuilding_Label1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"iconImg",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":5,
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipBuilding_Text1"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipBuilding_Text2"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipBuilding_Text3"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipBuilding_Text4"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipBuilding_Text5"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"prop1"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"prop2"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"prop3"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"prop4"
                                }), new UIComponentDescriptor({
                                    "type":Repeater,
                                    "id":"preList",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_TipBuilding_Text10"
                                            })]});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_TipBuilding_Button1",
                        "events":{"click":"___TipBuilding_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.top = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnToolTipClose",
                                "width":15,
                                "height":15
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipBuilding()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipBuilding_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipBuilding._watcherSetupUtil = _arg_1;
        }


        public function set object(_arg_1:Object):void
        {
            _core = Core.getInstance();
            dm = DataManager.getInstance();
            vo = new ToolTipVO();
            setCommon(_arg_1.temp);
        }

        [Bindable(event="propertyChange")]
        public function get iconImg():Image
        {
            return (this._1638753418iconImg);
        }

        override public function initialize():void
        {
            var target:TipBuilding;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipBuilding_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipBuildingWatcherSetupUtil");
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

        private function _TipBuilding_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Label1.htmlText = _arg_1;
            }, "_TipBuilding_Label1.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Label1.text = _arg_1;
            }, "_TipBuilding_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.urlIcon);
            }, function (_arg_1:Object):void
            {
                iconImg.source = _arg_1;
            }, "iconImg.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.expCost;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text1.htmlText = _arg_1;
            }, "_TipBuilding_Text1.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text1.text = _arg_1;
            }, "_TipBuilding_Text1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.moneyCost;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text2.htmlText = _arg_1;
            }, "_TipBuilding_Text2.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text2.text = _arg_1;
            }, "_TipBuilding_Text2.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.genMCost;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text3.htmlText = _arg_1;
            }, "_TipBuilding_Text3.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text3.text = _arg_1;
            }, "_TipBuilding_Text3.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.rareMCost;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text4.htmlText = _arg_1;
            }, "_TipBuilding_Text4.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text4.text = _arg_1;
            }, "_TipBuilding_Text4.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.maintainCost;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text5.htmlText = _arg_1;
            }, "_TipBuilding_Text5.htmlText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipBuilding_Text5.text = _arg_1;
            }, "_TipBuilding_Text5.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bProp1;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop1.htmlText = _arg_1;
            }, "prop1.htmlText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop1.text = _arg_1;
            }, "prop1.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bProp2;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop2.htmlText = _arg_1;
            }, "prop2.htmlText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop2.text = _arg_1;
            }, "prop2.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bProp3;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop3.htmlText = _arg_1;
            }, "prop3.htmlText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop3.text = _arg_1;
            }, "prop3.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bProp4;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop4.htmlText = _arg_1;
            }, "prop4.htmlText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPBUILDING_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop4.text = _arg_1;
            }, "prop4.text");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.preBuilds);
            }, function (_arg_1:Object):void
            {
                preList.dataProvider = _arg_1;
            }, "preList.dataProvider");
            result[21] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = preList.mx_internal::getItemAt(_arg_2[0]);
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _TipBuilding_Text10[_arg_2[0]].htmlText = _arg_1;
            }, "_TipBuilding_Text10.htmlText");
            result[22] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.btnVisible);
            }, function (_arg_1:Boolean):void
            {
                _TipBuilding_Button1.visible = _arg_1;
            }, "_TipBuilding_Button1.visible");
            result[23] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get prop2():Text
        {
            return (this._106940719prop2);
        }

        [Bindable(event="propertyChange")]
        public function get prop4():Text
        {
            return (this._106940721prop4);
        }

        [Bindable(event="propertyChange")]
        public function get prop1():Text
        {
            return (this._106940718prop1);
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }

        public function set iconImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1638753418iconImg;
            if (_local_2 !== _arg_1)
            {
                this._1638753418iconImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImg", _local_2, _arg_1));
            };
        }

        public function set preList(_arg_1:Repeater):void
        {
            var _local_2:Object = this._319435295preList;
            if (_local_2 !== _arg_1)
            {
                this._319435295preList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "preList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prop3():Text
        {
            return (this._106940720prop3);
        }

        public function ___TipBuilding_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        public function set prop1(_arg_1:Text):void
        {
            var _local_2:Object = this._106940718prop1;
            if (_local_2 !== _arg_1)
            {
                this._106940718prop1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop1", _local_2, _arg_1));
            };
        }

        public function set prop2(_arg_1:Text):void
        {
            var _local_2:Object = this._106940719prop2;
            if (_local_2 !== _arg_1)
            {
                this._106940719prop2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop2", _local_2, _arg_1));
            };
        }

        public function set prop4(_arg_1:Text):void
        {
            var _local_2:Object = this._106940721prop4;
            if (_local_2 !== _arg_1)
            {
                this._106940721prop4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop4", _local_2, _arg_1));
            };
        }

        public function ___TipBuilding_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function set prop3(_arg_1:Text):void
        {
            var _local_2:Object = this._106940720prop3;
            if (_local_2 !== _arg_1)
            {
                this._106940720prop3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop3", _local_2, _arg_1));
            };
        }

        private function _TipBuilding_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = vo.name;
            _local_1 = Language.TIPBUILDING_U[6];
            _local_1 = vo.urlIcon;
            _local_1 = vo.expCost;
            _local_1 = Language.TIPBUILDING_U[0];
            _local_1 = vo.moneyCost;
            _local_1 = Language.TIPBUILDING_U[1];
            _local_1 = vo.genMCost;
            _local_1 = Language.TIPBUILDING_U[2];
            _local_1 = vo.rareMCost;
            _local_1 = Language.TIPBUILDING_U[3];
            _local_1 = vo.maintainCost;
            _local_1 = Language.TIPBUILDING_U[4];
            _local_1 = vo.bProp1;
            _local_1 = Language.TIPBUILDING_U[7];
            _local_1 = vo.bProp2;
            _local_1 = Language.TIPBUILDING_U[8];
            _local_1 = vo.bProp3;
            _local_1 = Language.TIPBUILDING_U[9];
            _local_1 = vo.bProp4;
            _local_1 = Language.TIPBUILDING_U[10];
            _local_1 = vo.preBuilds;
            _local_1 = preList.currentItem;
            _local_1 = vo.btnVisible;
        }

        private function set vo(_arg_1:ToolTipVO):void
        {
            var _local_2:Object = this._3769vo;
            if (_local_2 !== _arg_1)
            {
                this._3769vo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vo", _local_2, _arg_1));
            };
        }

        private function setCommon(_arg_1:*):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            vo.expCost = (Language.TIPBUILDING_U[0] + _arg_1.expCost);
            vo.moneyCost = (Language.TIPBUILDING_U[1] + _arg_1.moneyCost);
            vo.genMCost = (Language.TIPBUILDING_U[2] + _arg_1.genMCost);
            vo.rareMCost = (Language.TIPBUILDING_U[3] + _arg_1.rareMCost);
            vo.maintainCost = (Language.TIPBUILDING_U[4] + _arg_1.maintainCost);
            vo.name = _arg_1.name;
            vo.urlIcon = ResManager.getIconUrl(_arg_1.iconCode);
            vo.preBuilds = new Array();
            var _local_2:Array;
            if (((!(_arg_1.preBuilding == "")) && (!(_arg_1.preBuilding == null))))
            {
                _local_2 = _arg_1.preBuilding.split("|");
                _local_3 = null;
                _local_4 = null;
                for (_local_5 in _local_2)
                {
                    _local_4 = dm.gameData[GamePredef.TBL_BUILDING][_local_2[_local_5]];
                    if (_local_4 != null)
                    {
                        vo.preBuilds.push((Language.TIPBUILDING_U[5] + _local_4.name));
                    };
                };
            };
            preList.dataProvider = vo.preBuilds;
        }

        [Bindable(event="propertyChange")]
        public function get preList():Repeater
        {
            return (this._319435295preList);
        }


    }
}//package com.qeedoo.ui.view.comp

