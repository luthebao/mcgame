// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.QxWishesPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.MoveCanva;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import flash.net.Responder;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
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

    public class QxWishesPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const MIN_CHECK_INTERVAL:Number = 30000;
        private var _lastCheckTime:Number = 0;
        private var _104932659moveCav4:MoveCanva;
        private var _104932655moveCav8:MoveCanva;
        private var _104932656moveCav7:MoveCanva;
        private var _830995295mainCav:Canvas;
        private var _104932660moveCav3:MoveCanva;
        private var _104932658moveCav5:MoveCanva;
        private var _104932662moveCav1:MoveCanva;
        private var _104932657moveCav6:MoveCanva;
        private var _104932661moveCav2:MoveCanva;
        private var _104932654moveCav9:MoveCanva;
        private var _1042054822moveCav10:MoveCanva;
        private var _fristFlag:Boolean = true;
        public var _QxWishesPanel_BasicGlowButton1:BasicGlowButton;
        public var _QxWishesPanel_BasicGlowButton2:BasicGlowButton;
        public var _QxWishesPanel_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_QxWishesPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"mainCav",
                        "stylesFactory":function ():void
                        {
                            this.top = "30";
                            this.left = "10";
                            this.right = "10";
                            this.bottom = "45";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":-71,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":86,
                                            "y":98
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":238,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":247
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":224,
                                            "y":247
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":352,
                                            "y":138
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":480,
                                            "y":75
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":513,
                                            "y":0xFF
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":661,
                                            "y":21
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MoveCanva,
                                    "id":"moveCav10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":630,
                                            "y":149
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_QxWishesPanel_BasicGlowButton1",
                        "events":{"click":"___QxWishesPanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.paddingTop = 1;
                            this.bottom = "20";
                            this.horizontalCenter = "50";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "labelPlacement":"bottom",
                                "width":75,
                                "height":25
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_QxWishesPanel_BasicGlowButton2",
                        "events":{"click":"___QxWishesPanel_BasicGlowButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.paddingTop = 1;
                            this.bottom = "20";
                            this.horizontalCenter = "-50";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "labelPlacement":"bottom",
                                "width":75,
                                "height":25
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

        public function QxWishesPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 450;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___QxWishesPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            QxWishesPanel._watcherSetupUtil = _arg_1;
        }


        public function ___QxWishesPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            showLoveOrWish(0);
        }

        private function _QxWishesPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOWLOVEPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QxWishesPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_QxWishesPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOWLOVEPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QxWishesPanel_BasicGlowButton1.label = _arg_1;
            }, "_QxWishesPanel_BasicGlowButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOWLOVEPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QxWishesPanel_BasicGlowButton2.label = _arg_1;
            }, "_QxWishesPanel_BasicGlowButton2.label");
            result[2] = binding;
            return (result);
        }

        private function moveAll():void
        {
            var _local_1:int = 1;
            while (_local_1 < 11)
            {
                if (this[("moveCav" + _local_1)])
                {
                    this[("moveCav" + _local_1)].beginMove();
                };
                _local_1++;
            };
        }

        public function set moveCav10(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._1042054822moveCav10;
            if (_local_2 !== _arg_1)
            {
                this._1042054822moveCav10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav10", _local_2, _arg_1));
            };
        }

        public function set moveCav5(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._104932658moveCav5;
            if (_local_2 !== _arg_1)
            {
                this._104932658moveCav5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav5", _local_2, _arg_1));
            };
        }

        public function set moveCav6(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._104932657moveCav6;
            if (_local_2 !== _arg_1)
            {
                this._104932657moveCav6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav6", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:QxWishesPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _QxWishesPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_QxWishesPanelWatcherSetupUtil");
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

        public function set moveCav1(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._104932662moveCav1;
            if (_local_2 !== _arg_1)
            {
                this._104932662moveCav1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav1", _local_2, _arg_1));
            };
        }

        public function set moveCav9(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._104932654moveCav9;
            if (_local_2 !== _arg_1)
            {
                this._104932654moveCav9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCav10():MoveCanva
        {
            return (this._1042054822moveCav10);
        }

        public function set moveCav2(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._104932661moveCav2;
            if (_local_2 !== _arg_1)
            {
                this._104932661moveCav2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCav3():MoveCanva
        {
            return (this._104932660moveCav3);
        }

        public function set moveCav3(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._104932660moveCav3;
            if (_local_2 !== _arg_1)
            {
                this._104932660moveCav3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav3", _local_2, _arg_1));
            };
        }

        private function showLoveOrWish(_arg_1:int):void
        {
            _core.remote.call("checkEmptyBagNumWhenQxWish", new Responder(onCheckEmptyBagNumWhenQxWish), _arg_1);
        }

        public function init():void
        {
            if (visible)
            {
                _fristFlag = false;
                moveAll();
            };
            initMoveCanvas();
        }

        public function onGetQxWishes(_arg_1:Object):void
        {
            var _local_2:Object;
            _core.qxWishesArr = [];
            for each (_local_2 in _arg_1)
            {
                _core.qxWishesArr.push(_local_2);
            };
        }

        public function set moveCav7(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._104932656moveCav7;
            if (_local_2 !== _arg_1)
            {
                this._104932656moveCav7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav7", _local_2, _arg_1));
            };
        }

        private function initMoveCanvas():void
        {
            var _local_1:int = 1;
            while (_local_1 < 11)
            {
                if (this[("moveCav" + _local_1)])
                {
                    this[("moveCav" + _local_1)].setWishWords(Language.SHOWLOVEPANEL_S[(_local_1 + 3)]);
                };
                _local_1++;
            };
        }

        public function set moveCav4(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._104932659moveCav4;
            if (_local_2 !== _arg_1)
            {
                this._104932659moveCav4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav4", _local_2, _arg_1));
            };
        }

        private function stopAll():void
        {
            var _local_1:int = 1;
            while (_local_1 < 11)
            {
                if (this[("moveCav" + _local_1)])
                {
                    this[("moveCav" + _local_1)].stopMove();
                };
                _local_1++;
            };
        }

        public function ___QxWishesPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set mainCav(_arg_1:Canvas):void
        {
            var _local_2:Object = this._830995295mainCav;
            if (_local_2 !== _arg_1)
            {
                this._830995295mainCav = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainCav", _local_2, _arg_1));
            };
        }

        private function onCheckEmptyBagNumWhenQxWish(_arg_1:Object):void
        {
            var _local_2:SendQxWishPanel;
            if (!_arg_1.f)
            {
                Alert.show("背包已满，请先清理！", "", Alert.OK);
            }
            else
            {
                _local_2 = SendQxWishPanel(_core.view.getUI(ViewManager.POP_SEND_LOVE));
                _local_2.type = _arg_1.type;
                _local_2.show();
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCav4():MoveCanva
        {
            return (this._104932659moveCav4);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav6():MoveCanva
        {
            return (this._104932657moveCav6);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav7():MoveCanva
        {
            return (this._104932656moveCav7);
        }

        public function ___QxWishesPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            showLoveOrWish(1);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav5():MoveCanva
        {
            return (this._104932658moveCav5);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav8():MoveCanva
        {
            return (this._104932655moveCav8);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav1():MoveCanva
        {
            return (this._104932662moveCav1);
        }

        [Bindable(event="propertyChange")]
        public function get mainCav():Canvas
        {
            return (this._830995295mainCav);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav2():MoveCanva
        {
            return (this._104932661moveCav2);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:Number;
            super.visible = _arg_1;
            if (_arg_1)
            {
                fixMoveCanvaPos();
                if (!_fristFlag)
                {
                    moveAll();
                };
                _local_2 = (new Date().getTime() - _lastCheckTime);
                trace(("interval:" + _local_2));
                if (_local_2 >= MIN_CHECK_INTERVAL)
                {
                    _lastCheckTime = new Date().getTime();
                    _core.remote.call("getQxWishes", new Responder(onGetQxWishes));
                };
            }
            else
            {
                stopAll();
            };
        }

        public function set moveCav8(_arg_1:MoveCanva):void
        {
            var _local_2:Object = this._104932655moveCav8;
            if (_local_2 !== _arg_1)
            {
                this._104932655moveCav8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCav9():MoveCanva
        {
            return (this._104932654moveCav9);
        }

        private function _QxWishesPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SHOWLOVEPANEL_U[0];
            _local_1 = Language.SHOWLOVEPANEL_U[1];
            _local_1 = Language.SHOWLOVEPANEL_U[2];
        }

        private function fixMoveCanvaPos():void
        {
            moveCav1.x = -71;
            moveCav2.x = 86;
            moveCav3.x = 238;
            moveCav4.x = 0;
            moveCav5.x = 224;
            moveCav6.x = 352;
            moveCav7.x = 480;
            moveCav8.x = 513;
            moveCav9.x = 661;
            moveCav10.x = 630;
        }


    }
}//package com.qeedoo.ui.view.compDragable

