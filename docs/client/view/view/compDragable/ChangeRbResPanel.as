// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ChangeRbResPanel

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
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.FlexEvent;
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

    public class ChangeRbResPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _205980803btnLeft:Button;
        private var _1913918552showText2:BasicTxtButton;
        private var _1455232140changeBtn:BasicGlowButton;
        private var _2096098592btnRight:Button;
        private var _109413588show1:CharactorShowCanvas;
        private var _1913918553showText1:BasicTxtButton;
        private var _109413589show2:CharactorShowCanvas;
        private var _1668885452changePanel:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":305,
                    "height":260,
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
                                "width":275,
                                "height":185,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":5,
                                            "width":130,
                                            "height":145,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"showText1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":40,
                                                        "y":8,
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"show1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":115,
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
                                                        "x":21,
                                                        "y":115,
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
                                                        "x":89,
                                                        "y":115,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnRight"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":140,
                                            "y":5,
                                            "width":130,
                                            "height":145,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"showText2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":40,
                                                        "y":10,
                                                        "width":60,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"show2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":115,
                                                        "height":20,
                                                        "width":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___ChangeRbResPanel_Button3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":21,
                                                        "y":115,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnLeft"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___ChangeRbResPanel_Button4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":89,
                                                        "y":115,
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
                                    "id":"changeBtn",
                                    "events":{"click":"__changeBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":190,
                                            "y":154,
                                            "width":60,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var changeObj:Object = new Object();
        private var _core:Core = Core.getInstance();
        private var TITLE_ARR:Array = [Language.CHANGECOLORPANEL_S[25], Language.CHANGECOLORPANEL_S[26]];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ChangeRbResPanel()
        {
            mx_internal::_document = this;
            this.width = 305;
            this.height = 260;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___ChangeRbResPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ChangeRbResPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get show2():CharactorShowCanvas
        {
            return (this._109413589show2);
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
        public function get showText2():BasicTxtButton
        {
            return (this._1913918552showText2);
        }

        [Bindable(event="propertyChange")]
        public function get changeBtn():BasicGlowButton
        {
            return (this._1455232140changeBtn);
        }

        public function updateView():void
        {
            var _local_1:String = ResManager.getResUrl(_core.player.resCode);
            if (show1.url != _local_1)
            {
                show1.url = _local_1;
            };
            var _local_2:String = ResManager.getResUrl(changeObj.resCode);
            if (show2.url != _local_2)
            {
                show2.url = _local_2;
            };
            if (changeObj.isRebirthRes)
            {
                showText2.text = this.TITLE_ARR[0];
            }
            else
            {
                showText2.text = this.TITLE_ARR[1];
            };
        }

        override public function initialize():void
        {
            var target:ChangeRbResPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ChangeRbResPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ChangeRbResPanelWatcherSetupUtil");
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
                if (show1.url != null)
                {
                    show1.rollRight();
                };
                if (show2.url != null)
                {
                    show2.rollRight();
                };
            }
            else
            {
                if (show1.url != null)
                {
                    show1.rollLeft();
                };
                if (show2.url != null)
                {
                    show2.rollLeft();
                };
            };
        }

        private function init():void
        {
            changePanel.closeFunc = closeFunc;
            updateView();
        }

        [Bindable(event="propertyChange")]
        public function get btnRight():Button
        {
            return (this._2096098592btnRight);
        }

        private function subChange():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.changeRebirthedRes();
                };
            };
            Alert.show(Language.CHANGECOLORPANEL_S[28].replace("{name}", showText2.text), "", (Alert.YES | Alert.NO), null, func);
            this.closeFunc();
        }

        public function set show2(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._109413589show2;
            if (_local_2 !== _arg_1)
            {
                this._109413589show2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "show2", _local_2, _arg_1));
            };
        }

        private function viewClear():void
        {
            show1.url = null;
            show2.url = null;
            showText1.text = "";
            showText2.text = "";
        }

        public function set changeBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1455232140changeBtn;
            if (_local_2 !== _arg_1)
            {
                this._1455232140changeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeBtn", _local_2, _arg_1));
            };
        }

        private function _ChangeRbResPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changePanel.text = _arg_1;
            }, "changePanel.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showText1.text = _arg_1;
            }, "showText1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changeBtn.label = _arg_1;
            }, "changeBtn.label");
            result[2] = binding;
            return (result);
        }

        public function __changeBtn_click(_arg_1:MouseEvent):void
        {
            subChange();
        }

        [Bindable(event="propertyChange")]
        public function get showText1():BasicTxtButton
        {
            return (this._1913918553showText1);
        }

        public function set show1(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._109413588show1;
            if (_local_2 !== _arg_1)
            {
                this._109413588show1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "show1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get changePanel():BasicTitleCanvas
        {
            return (this._1668885452changePanel);
        }

        public function ___ChangeRbResPanel_Button3_click(_arg_1:MouseEvent):void
        {
            rollShow(false);
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

        public function set showText2(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1913918552showText2;
            if (_local_2 !== _arg_1)
            {
                this._1913918552showText2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showText2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get show1():CharactorShowCanvas
        {
            return (this._109413588show1);
        }

        public function set showText1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1913918553showText1;
            if (_local_2 !== _arg_1)
            {
                this._1913918553showText1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showText1", _local_2, _arg_1));
            };
        }

        public function closeFunc():void
        {
            _core.view.hide(ViewManager.PANEL_CHANGE_RES);
            viewClear();
        }

        public function ___ChangeRbResPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __btnLeft_click(_arg_1:MouseEvent):void
        {
            rollShow(false);
        }

        public function set newResObj(_arg_1:Object):void
        {
            this.visible = true;
            changeObj = _arg_1;
            if (!this.initialized)
            {
                return;
            };
            updateView();
        }

        public function ___ChangeRbResPanel_Button4_click(_arg_1:MouseEvent):void
        {
            rollShow(true);
        }

        private function _ChangeRbResPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHANGECOLORPANEL_S[24];
            _local_1 = Language.CHANGECOLORPANEL_S[29];
            _local_1 = Language.CHANGECOLORPANEL_S[27];
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


    }
}//package com.qeedoo.ui.view.compDragable

