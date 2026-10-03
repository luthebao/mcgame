// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ChatConfigPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.TextArea;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.List;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.controls.Alert;
    import mx.core.ClassFactory;
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

    public class ChatConfigPanel extends DragableCanvas implements IBindingClient 
    {

        private static var index:int = -2;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _ChatConfigPanel_Label1:Label;
        public var _ChatConfigPanel_Label2:Label;
        private var _1048862271newMsg:TextArea;
        private var _8705306configCheck:CheckBox;
        public var _ChatConfigPanel_BasicGlowButton1:BasicGlowButton;
        public var _ChatConfigPanel_BasicGlowButton2:BasicGlowButton;
        public var _ChatConfigPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _105803054pList:List;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":420,
                    "height":326,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ChatConfigPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ChatConfigPanel_BasicGlowButton1",
                        "events":{"click":"___ChatConfigPanel_BasicGlowButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":302.8,
                                "y":263,
                                "styleName":"BtnStdRed",
                                "width":83
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ChatConfigPanel_BasicGlowButton2",
                        "events":{"click":"___ChatConfigPanel_BasicGlowButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":302.8,
                                "y":83,
                                "styleName":"BtnStdRed",
                                "width":83
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"configCheck",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":40,
                                "width":269.8
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":83,
                                "width":269.8,
                                "height":155,
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":List,
                                    "id":"pList",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "10";
                                        this.bottom = "10";
                                        this.right = "10";
                                        this.backgroundAlpha = 0;
                                        this.borderSides = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "labelField":"name",
                                            "itemRenderer":_ChatConfigPanel_ClassFactory1_c()
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"newMsg",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":263,
                                "width":269.8,
                                "styleName":"CSSBorder"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_ChatConfigPanel_Label1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":244,
                                "width":269.8,
                                "styleName":"DescriptionText"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_ChatConfigPanel_Label2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":60,
                                "width":373,
                                "styleName":"DescriptionText"
                            });
                        }
                    })]
                });
            }
        });
        private var _527147437pListArr:ArrayCollection = new ArrayCollection([{
            "name":Language.CHATCONFIGPANEL_U[2],
            "del":false
        }, {
            "name":Language.CHATCONFIGPANEL_U[3],
            "del":false
        }, {
            "name":Language.CHATCONFIGPANEL_U[4],
            "del":false
        }]);
        private var msg:String = Language.CHATCONFIGPANEL_U[1];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ChatConfigPanel()
        {
            mx_internal::_document = this;
            this.width = 420;
            this.height = 326;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ChatConfigPanel._watcherSetupUtil = _arg_1;
        }


        public function set newMsg(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1048862271newMsg;
            if (_local_2 !== _arg_1)
            {
                this._1048862271newMsg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newMsg", _local_2, _arg_1));
            };
        }

        public function onItemClick():void
        {
            msg = pList.selectedItem.name;
            index = pList.selectedIndex;
        }

        override public function initialize():void
        {
            var target:ChatConfigPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ChatConfigPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ChatConfigPanelWatcherSetupUtil");
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

        private function set pListArr(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._527147437pListArr;
            if (_local_2 !== _arg_1)
            {
                this._527147437pListArr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pListArr", _local_2, _arg_1));
            };
        }

        public function ___ChatConfigPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            onDeleteMsg();
        }

        [Bindable(event="propertyChange")]
        public function get pList():List
        {
            return (this._105803054pList);
        }

        private function onDeleteMsg():void
        {
            if (index == pList.selectedIndex)
            {
                if (pList.selectedItem.del)
                {
                    pListArr.removeItemAt(pList.selectedIndex);
                    index = -2;
                    msg = Language.CHATCONFIGPANEL_U[1];
                }
                else
                {
                    Alert.show(Language.CHATCONFIGPANEL_U[6]);
                };
            }
            else
            {
                Alert.show(Language.CHATCONFIGPANEL_U[7]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get newMsg():TextArea
        {
            return (this._1048862271newMsg);
        }

        public function getMsg():String
        {
            return (msg);
        }

        private function _ChatConfigPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHATCONFIGPANEL_U[0];
            _local_1 = Language.CHATCONFIGPANEL_U[8];
            _local_1 = Language.CHATCONFIGPANEL_U[9];
            _local_1 = Language.CHATCONFIGPANEL_U[10];
            _local_1 = pListArr;
            _local_1 = Language.CHATCONFIGPANEL_U[12];
            _local_1 = Language.CHATCONFIGPANEL_U[14];
        }

        private function _ChatConfigPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = ChatConfigPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get pListArr():ArrayCollection
        {
            return (this._527147437pListArr);
        }

        private function _ChatConfigPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCONFIGPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatConfigPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ChatConfigPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCONFIGPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatConfigPanel_BasicGlowButton1.label = _arg_1;
            }, "_ChatConfigPanel_BasicGlowButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCONFIGPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatConfigPanel_BasicGlowButton2.label = _arg_1;
            }, "_ChatConfigPanel_BasicGlowButton2.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCONFIGPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                configCheck.label = _arg_1;
            }, "configCheck.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pListArr);
            }, function (_arg_1:Object):void
            {
                pList.dataProvider = _arg_1;
            }, "pList.dataProvider");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCONFIGPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatConfigPanel_Label1.text = _arg_1;
            }, "_ChatConfigPanel_Label1.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCONFIGPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatConfigPanel_Label2.text = _arg_1;
            }, "_ChatConfigPanel_Label2.text");
            result[6] = binding;
            return (result);
        }

        public function set pList(_arg_1:List):void
        {
            var _local_2:Object = this._105803054pList;
            if (_local_2 !== _arg_1)
            {
                this._105803054pList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pList", _local_2, _arg_1));
            };
        }

        private function onAddMsg():void
        {
            var _local_1:Object;
            if (pListArr.length < 5)
            {
                if (newMsg.text != "")
                {
                    if (newMsg.text.length <= 30)
                    {
                        _local_1 = {};
                        _local_1.name = newMsg.text.toString();
                        _local_1.del = true;
                        pListArr.addItemAt(_local_1, pListArr.length);
                        newMsg.text = "";
                        if (index == -2)
                        {
                            index = (pListArr.length - 1);
                            msg = _local_1.name;
                            pList.selectedIndex = index;
                        };
                    }
                    else
                    {
                        Alert.show(Language.CHATCONFIGPANEL_U[13]);
                    };
                }
                else
                {
                    Alert.show(Language.CHATCONFIGPANEL_U[5]);
                };
            }
            else
            {
                newMsg.text = "";
                Alert.show(Language.CHATCONFIGPANEL_U[11]);
            };
        }

        public function ___ChatConfigPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            onAddMsg();
        }

        public function set configCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._8705306configCheck;
            if (_local_2 !== _arg_1)
            {
                this._8705306configCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "configCheck", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get configCheck():CheckBox
        {
            return (this._8705306configCheck);
        }

        public function isAutoReply():Boolean
        {
            return (configCheck.selected);
        }


    }
}//package com.qeedoo.ui.view.compDragable

