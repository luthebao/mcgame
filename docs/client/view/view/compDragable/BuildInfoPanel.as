// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.BuildInfoPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.containers.Canvas;
    import mx.controls.Button;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.core.Application;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
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

    public class BuildInfoPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1184171001infoVo:Object;
        private var _106940718prop1:Text;
        private var _1638753418iconImg:Image;
        private var _3237038info:Text;
        private var _106940719prop2:Text;
        public var _BuildInfoPanel_Text1:Text;
        public var _BuildInfoPanel_Label1:Label;
        private var _106940720prop3:Text;
        private var template:Object;
        private var _106940721prop4:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":170,
                    "height":182,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
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
                                                "id":"_BuildInfoPanel_Label1",
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
                                    "id":"_BuildInfoPanel_Text1"
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
                                    "type":Text,
                                    "id":"info"
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___BuildInfoPanel_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.top = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":true,
                                "styleName":"BtnPanelClose",
                                "width":15,
                                "height":15
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function BuildInfoPanel()
        {
            mx_internal::_document = this;
            this.width = 170;
            this.height = 182;
            this.styleName = "CanvasToolTip";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BuildInfoPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        private function get infoVo():Object
        {
            return (this._1184171001infoVo);
        }

        [Bindable(event="propertyChange")]
        public function get iconImg():Image
        {
            return (this._1638753418iconImg);
        }

        private function set infoVo(_arg_1:Object):void
        {
            var _local_2:Object = this._1184171001infoVo;
            if (_local_2 !== _arg_1)
            {
                this._1184171001infoVo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoVo", _local_2, _arg_1));
            };
        }

        private function setPos(_arg_1:Object):void
        {
            this.x = Application.application.stage.mouseX;
            this.y = Application.application.stage.mouseY;
        }

        override public function initialize():void
        {
            var target:BuildInfoPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BuildInfoPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_BuildInfoPanelWatcherSetupUtil");
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

        public function set iconImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1638753418iconImg;
            if (_local_2 !== _arg_1)
            {
                this._1638753418iconImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prop1():Text
        {
            return (this._106940718prop1);
        }

        [Bindable(event="propertyChange")]
        public function get prop2():Text
        {
            return (this._106940719prop2);
        }

        [Bindable(event="propertyChange")]
        public function get prop3():Text
        {
            return (this._106940720prop3);
        }

        [Bindable(event="propertyChange")]
        public function get prop4():Text
        {
            return (this._106940721prop4);
        }

        [Bindable(event="propertyChange")]
        public function get info():Text
        {
            return (this._3237038info);
        }

        private function _BuildInfoPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoVo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BuildInfoPanel_Label1.htmlText = _arg_1;
            }, "_BuildInfoPanel_Label1.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BUILDINFOPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BuildInfoPanel_Label1.text = _arg_1;
            }, "_BuildInfoPanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (infoVo.urlIcon);
            }, function (_arg_1:Object):void
            {
                iconImg.source = _arg_1;
            }, "iconImg.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoVo.maintainCost;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BuildInfoPanel_Text1.htmlText = _arg_1;
            }, "_BuildInfoPanel_Text1.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BUILDINFOPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BuildInfoPanel_Text1.text = _arg_1;
            }, "_BuildInfoPanel_Text1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoVo.bProp1;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop1.htmlText = _arg_1;
            }, "prop1.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BUILDINFOPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop1.text = _arg_1;
            }, "prop1.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoVo.bProp2;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop2.htmlText = _arg_1;
            }, "prop2.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BUILDINFOPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop2.text = _arg_1;
            }, "prop2.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoVo.bProp3;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop3.htmlText = _arg_1;
            }, "prop3.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BUILDINFOPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop3.text = _arg_1;
            }, "prop3.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoVo.bProp4;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop4.htmlText = _arg_1;
            }, "prop4.htmlText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BUILDINFOPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop4.text = _arg_1;
            }, "prop4.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoVo.tips;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info.htmlText = _arg_1;
            }, "info.htmlText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BUILDINFOPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info.text = _arg_1;
            }, "info.text");
            result[14] = binding;
            return (result);
        }

        public function ___BuildInfoPanel_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        private function setProperty(_arg_1:Object):void
        {
            var _local_2:* = null;
            var _local_3:* = 1;
            while (_local_3 <= 4)
            {
                if (ToolKit.isEqual(_arg_1.percentFlag, 0))
                {
                    _local_2 = _arg_1[(("prop" + _local_3) + "Value")];
                }
                else
                {
                    _local_2 = (_arg_1[(("prop" + _local_3) + "Value")] + "%");
                };
                infoVo[("bProp" + _local_3)] = (((GamePredef.PROP_NAME[_arg_1[("prop" + _local_3)]] + Language.BUILDINFOPANEL_U[1]) + " : ") + _local_2);
                _local_3++;
            };
            if (ToolKit.isEqual(_arg_1[("prop" + 1)], 0))
            {
                prop1.visible = false;
            }
            else
            {
                prop1.visible = true;
            };
            if (ToolKit.isEqual(_arg_1[("prop" + 2)], 0))
            {
                prop2.visible = false;
            }
            else
            {
                prop2.visible = true;
            };
            if (ToolKit.isEqual(_arg_1[("prop" + 3)], 0))
            {
                prop3.visible = false;
            }
            else
            {
                prop3.visible = true;
            };
            if (ToolKit.isEqual(_arg_1[("prop" + 4)], 0))
            {
                prop4.visible = false;
            }
            else
            {
                prop4.visible = true;
            };
        }

        public function set info(_arg_1:Text):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
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

        public function set prop3(_arg_1:Text):void
        {
            var _local_2:Object = this._106940720prop3;
            if (_local_2 !== _arg_1)
            {
                this._106940720prop3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop3", _local_2, _arg_1));
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

        public function set prop1(_arg_1:Text):void
        {
            var _local_2:Object = this._106940718prop1;
            if (_local_2 !== _arg_1)
            {
                this._106940718prop1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop1", _local_2, _arg_1));
            };
        }

        private function _BuildInfoPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = infoVo.name;
            _local_1 = Language.BUILDINFOPANEL_U[2];
            _local_1 = infoVo.urlIcon;
            _local_1 = infoVo.maintainCost;
            _local_1 = Language.BUILDINFOPANEL_U[3];
            _local_1 = infoVo.bProp1;
            _local_1 = Language.BUILDINFOPANEL_U[4];
            _local_1 = infoVo.bProp2;
            _local_1 = Language.BUILDINFOPANEL_U[5];
            _local_1 = infoVo.bProp3;
            _local_1 = Language.BUILDINFOPANEL_U[6];
            _local_1 = infoVo.bProp4;
            _local_1 = Language.BUILDINFOPANEL_U[7];
            _local_1 = infoVo.tips;
            _local_1 = Language.BUILDINFOPANEL_U[8];
        }

        public function showBuild(_arg_1:Object):void
        {
            infoVo = new Object();
            template = GameData.d[GamePredef.TBL_BUILDING][_arg_1.tid];
            infoVo.name = template.name;
            infoVo.maintainCost = (Language.BUILDINFOPANEL_U[0] + template.maintainCost);
            infoVo.urlIcon = ResManager.getIconUrl(template.iconCode);
            setProperty(template);
            setPos(template);
            visible = true;
        }


    }
}//package com.qeedoo.ui.view.compDragable

