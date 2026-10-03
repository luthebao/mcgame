// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ChangeWingColorPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
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

    public class ChangeWingColorPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var colorObj:Array;
        private var _205980803btnLeft:Button;
        private var _188974544levelLabel:BasicTxtButton;
        private var _2096098592btnRight:Button;
        public var _ChangeWingColorPanel_BasicTxtButton3:BasicTxtButton;
        private var _555140865changeColor2:BasicGlowButton;
        public var _ChangeWingColorPanel_BasicTxtButton1:BasicTxtButton;
        private var _555140866changeColor1:BasicGlowButton;
        private var _157404278wingShow2:CharactorShowCanvas;
        private var _157404279wingShow1:CharactorShowCanvas;
        private var _1668885452changePanel:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":325,
                    "height":280,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"changePanel"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":60,
                                "width":295,
                                "height":195,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":5,
                                            "width":140,
                                            "height":165,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_ChangeWingColorPanel_BasicTxtButton1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":40,
                                                        "y":8,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"levelLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":100,
                                                        "y":8,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"wingShow1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":65,
                                                        "y":135,
                                                        "height":20,
                                                        "width":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnLeft",
                                                "events":{"click":"__btnLeft_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":16,
                                                        "y":135,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnLeft"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnRight",
                                                "events":{"click":"__btnRight_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":99,
                                                        "y":135,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnRight"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"changeColor1",
                                    "events":{"click":"__changeColor1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27,
                                            "y":174,
                                            "width":80,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":150,
                                            "y":5,
                                            "width":140,
                                            "height":165,
                                            "styleName":"CanvasBorder",
                                            "visible":true,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_ChangeWingColorPanel_BasicTxtButton3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":40,
                                                        "y":8,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"wingShow2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":65,
                                                        "y":135,
                                                        "height":20,
                                                        "width":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___ChangeWingColorPanel_Button3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":16,
                                                        "y":135,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnLeft"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___ChangeWingColorPanel_Button4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":99,
                                                        "y":135,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnRight"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"changeColor2",
                                    "events":{"click":"__changeColor2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":174,
                                            "width":80,
                                            "styleName":"BtnNormalRed",
                                            "visible":true
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

        public function ChangeWingColorPanel()
        {
            mx_internal::_document = this;
            this.width = 325;
            this.height = 280;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___ChangeWingColorPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ChangeWingColorPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get btnLeft():Button
        {
            return (this._205980803btnLeft);
        }

        public function set btnLeft(_arg_1:Button):void
        {
            var _local_2:Object = this._205980803btnLeft;
            if (_local_2 !== _arg_1)
            {
                this._205980803btnLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLeft", _local_2, _arg_1));
            };
        }

        public function __btnRight_click(_arg_1:MouseEvent):void
        {
            rollShow(true);
        }

        [Bindable(event="propertyChange")]
        public function get wingShow2():CharactorShowCanvas
        {
            return (this._157404278wingShow2);
        }

        public function set changeColor1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._555140866changeColor1;
            if (_local_2 !== _arg_1)
            {
                this._555140866changeColor1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeColor1", _local_2, _arg_1));
            };
        }

        public function subChange(type:int):void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("onSureChangeWingColor", new Responder(onChangeWingColor), colorObj[type].color);
                };
            };
            Alert.show(Language.WING_COLOR_PANEL[5].replace("{type}", (type + 1)), "", (Alert.YES | Alert.NO), null, func);
        }

        public function set wingShow1(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._157404279wingShow1;
            if (_local_2 !== _arg_1)
            {
                this._157404279wingShow1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingShow1", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:ChangeWingColorPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ChangeWingColorPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ChangeWingColorPanelWatcherSetupUtil");
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

        private function rollShow(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                if (wingShow1.url != null)
                {
                    wingShow1.rollRight();
                };
                if (wingShow2.visible)
                {
                    wingShow2.rollRight();
                };
            }
            else
            {
                if (wingShow1.url != null)
                {
                    wingShow1.rollLeft();
                };
                if (wingShow2.visible)
                {
                    wingShow2.rollLeft();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnRight():Button
        {
            return (this._2096098592btnRight);
        }

        public function set wingShow2(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._157404278wingShow2;
            if (_local_2 !== _arg_1)
            {
                this._157404278wingShow2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingShow2", _local_2, _arg_1));
            };
        }

        public function ___ChangeWingColorPanel_Button4_click(_arg_1:MouseEvent):void
        {
            rollShow(true);
        }

        public function __changeColor2_click(_arg_1:MouseEvent):void
        {
            subChange(1);
        }

        public function showWingColorPanel(_arg_1:Array):void
        {
            changeColor1.enabled = true;
            changeColor2.enabled = true;
            var _local_2:String = ResManager.getResUrl(_core.player.resCode);
            wingShow1.url = _local_2;
            wingShow2.url = _local_2;
            wingShow1.charResCode = _core.player.resCode;
            wingShow2.charResCode = _core.player.resCode;
            wingShow1.color = _core.player.colorCode;
            wingShow2.color = _core.player.colorCode;
            wingShow1.wingResCode = colorObj[0].res;
            wingShow2.wingResCode = colorObj[1].res;
            if (((colorObj[1].res == null) || (colorObj[1].res == 0)))
            {
                changeColor2.enabled = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get changeColor1():BasicGlowButton
        {
            return (this._555140866changeColor1);
        }

        [Bindable(event="propertyChange")]
        public function get changePanel():BasicTitleCanvas
        {
            return (this._1668885452changePanel);
        }

        [Bindable(event="propertyChange")]
        public function get wingShow1():CharactorShowCanvas
        {
            return (this._157404279wingShow1);
        }

        public function ___ChangeWingColorPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set levelLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._188974544levelLabel;
            if (_local_2 !== _arg_1)
            {
                this._188974544levelLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelLabel", _local_2, _arg_1));
            };
        }

        private function _ChangeWingColorPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WING_COLOR_PANEL[1];
            _local_1 = Language.WING_COLOR_PANEL[2];
            _local_1 = Language.WING_COLOR_PANEL[4];
            _local_1 = Language.WING_COLOR_PANEL[3];
            _local_1 = Language.WING_COLOR_PANEL[4];
        }

        public function set changeColor2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._555140865changeColor2;
            if (_local_2 !== _arg_1)
            {
                this._555140865changeColor2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeColor2", _local_2, _arg_1));
            };
        }

        public function set btnRight(_arg_1:Button):void
        {
            var _local_2:Object = this._2096098592btnRight;
            if (_local_2 !== _arg_1)
            {
                this._2096098592btnRight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnRight", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levelLabel():BasicTxtButton
        {
            return (this._188974544levelLabel);
        }

        private function init():void
        {
            changePanel.closeFunc = closeFunc;
        }

        public function closeFunc():void
        {
            _core.view.hide(ViewManager.PANEL_WING_COLOR);
            wingShow1.wingResCode = 0;
            wingShow2.wingResCode = 0;
        }

        public function ___ChangeWingColorPanel_Button3_click(_arg_1:MouseEvent):void
        {
            rollShow(false);
        }

        public function __changeColor1_click(_arg_1:MouseEvent):void
        {
            subChange(0);
        }

        public function set changePanel(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1668885452changePanel;
            if (_local_2 !== _arg_1)
            {
                this._1668885452changePanel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changePanel", _local_2, _arg_1));
            };
        }

        public function onChangeWingColor(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _core.view.hide(ViewManager.PANEL_WING_COLOR);
                wingShow1.wingResCode = 0;
                wingShow2.wingResCode = 0;
            };
        }

        public function __btnLeft_click(_arg_1:MouseEvent):void
        {
            rollShow(false);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                showWingColorPanel(colorObj);
            };
        }

        private function _ChangeWingColorPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_COLOR_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changePanel.text = _arg_1;
            }, "changePanel.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_COLOR_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChangeWingColorPanel_BasicTxtButton1.text = _arg_1;
            }, "_ChangeWingColorPanel_BasicTxtButton1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_COLOR_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changeColor1.label = _arg_1;
            }, "changeColor1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_COLOR_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChangeWingColorPanel_BasicTxtButton3.text = _arg_1;
            }, "_ChangeWingColorPanel_BasicTxtButton3.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_COLOR_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changeColor2.label = _arg_1;
            }, "changeColor2.label");
            result[4] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get changeColor2():BasicGlowButton
        {
            return (this._555140865changeColor2);
        }


    }
}//package com.qeedoo.ui.view.compDragable

