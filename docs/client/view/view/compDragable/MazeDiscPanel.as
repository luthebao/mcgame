// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MazeDiscPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Text;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.net.Responder;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class MazeDiscPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _type:int = 0;
        private var _2147400797skipBtn:Button;
        public var _MazeDiscPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _31228997eventName:RoundedLabel;
        private var _842377084confirmBtn:Button;
        private var _1859786879eventContent:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":340,
                    "height":180,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MazeDiscPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"eventName",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.color = 0xFFFFFF;
                            this.fontSize = 14;
                            this.textAlign = "center";
                            this.top = "39";
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"eventContent",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.top = "67";
                            this.right = "10";
                            this.bottom = "40";
                            this.fontSize = 14;
                            this.color = 0xFFFFFF;
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"confirmBtn",
                        "events":{"click":"__confirmBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":85,
                                "width":60,
                                "height":20,
                                "styleName":"BtnStdRed",
                                "y":148
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"skipBtn",
                        "events":{"click":"__skipBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":227,
                                "width":60,
                                "height":20,
                                "styleName":"BtnStdRed",
                                "y":148
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

        public function MazeDiscPanel()
        {
            mx_internal::_document = this;
            this.width = 340;
            this.height = 180;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___MazeDiscPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MazeDiscPanel._watcherSetupUtil = _arg_1;
        }


        public function confirm():void
        {
            if (this.visible)
            {
                this.visible = false;
            };
            _core.remote.call("mazeConfirm", new Responder(onConfirm));
        }

        public function ___MazeDiscPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get confirmBtn():Button
        {
            return (this._842377084confirmBtn);
        }

        public function __skipBtn_click(_arg_1:MouseEvent):void
        {
            skip();
        }

        public function showPanel(_arg_1:Object):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE);
            if (_local_2)
            {
                _local_2.hide();
            };
            if (!_arg_1)
            {
                return;
            };
            this.visible = true;
            this["eventName"].text = Language.MAZE_DISC_PANEL_U[1].toString().replace("{name}", Language.MAZE_DISC_U[int(_arg_1.type)]);
            this["eventContent"].text = Language.MAZE_DISC_PANEL_U[2].toString().replace("{content}", Language.MAZE_DISC_U[(int(_arg_1.type) + 14)]);
            _type = int(_arg_1.type);
            if ((((((_type == 5) || (_type == 7)) || (_type == 4)) || (_type == 9)) || (_type == 8)))
            {
                skipBtn.visible = false;
                confirmBtn.x = 140;
            }
            else
            {
                confirmBtn.x = 85;
                skipBtn.visible = true;
            };
        }

        public function set skipBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._2147400797skipBtn;
            if (_local_2 !== _arg_1)
            {
                this._2147400797skipBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skipBtn", _local_2, _arg_1));
            };
        }

        public function set eventContent(_arg_1:Text):void
        {
            var _local_2:Object = this._1859786879eventContent;
            if (_local_2 !== _arg_1)
            {
                this._1859786879eventContent = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eventContent", _local_2, _arg_1));
            };
        }

        private function _MazeDiscPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAZE_DISC_PANEL_U[0];
            _local_1 = Language.MAZE_DISC_PANEL_U[1];
            _local_1 = Language.MAZE_DISC_PANEL_U[2];
            _local_1 = Language.MAZE_DISC_PANEL_U[4];
            _local_1 = Language.MAZE_DISC_PANEL_U[5];
        }

        override public function initialize():void
        {
            var target:MazeDiscPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MazeDiscPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MazeDiscPanelWatcherSetupUtil");
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

        public function set eventName(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._31228997eventName;
            if (_local_2 !== _arg_1)
            {
                this._31228997eventName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eventName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get eventContent():Text
        {
            return (this._1859786879eventContent);
        }

        override public function initView():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get eventName():RoundedLabel
        {
            return (this._31228997eventName);
        }

        [Bindable(event="propertyChange")]
        public function get skipBtn():Button
        {
            return (this._2147400797skipBtn);
        }

        public function __confirmBtn_click(_arg_1:MouseEvent):void
        {
            confirm();
        }

        public function onConfirm(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:* = _core.view.getUI(ViewManager.PANEL_MAZE_INFO);
            if (((_local_2) && (_local_2.visible)))
            {
                _local_2.updateData(_arg_1);
            };
        }

        private function _MazeDiscPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_DISC_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeDiscPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MazeDiscPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_DISC_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eventName.text = _arg_1;
            }, "eventName.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_DISC_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eventContent.text = _arg_1;
            }, "eventContent.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_DISC_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                confirmBtn.label = _arg_1;
            }, "confirmBtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_DISC_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                skipBtn.label = _arg_1;
            }, "skipBtn.label");
            result[4] = binding;
            return (result);
        }

        public function set confirmBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._842377084confirmBtn;
            if (_local_2 !== _arg_1)
            {
                this._842377084confirmBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmBtn", _local_2, _arg_1));
            };
        }

        public function onSkip(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:* = _core.view.getUI(ViewManager.PANEL_MAZE_INFO);
            if (_local_2.visible)
            {
                _local_2.updateData(_arg_1);
            };
        }

        public function skip():void
        {
            if (this.visible)
            {
                this.visible = false;
            };
            _core.remote.call("mazeSkip", new Responder(onSkip));
        }


    }
}//package com.qeedoo.ui.view.compDragable

