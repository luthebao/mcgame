// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ChatPanelManager

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.List;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import mx.events.ListEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
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

    public class ChatPanelManager extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var chatListAC:ArrayCollection;
        public var _ChatPanelManager_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1437158422chatList:List;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":166,
                    "height":396,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ChatPanelManager_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":List,
                        "id":"chatList",
                        "events":{"itemDoubleClick":"__chatList_itemDoubleClick"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "40";
                            this.bottom = "20";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "doubleClickEnabled":true
                            });
                        }
                    })]
                });
            }
        });
        public var iconClass:Class = ChatPanelManager_iconClass;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ChatPanelManager()
        {
            mx_internal::_document = this;
            this.width = 166;
            this.height = 396;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ChatPanelManager._watcherSetupUtil = _arg_1;
        }


        private function showChatPanel():void
        {
            ChatPanelUtil.createChatPanel(chatList.selectedItem.id);
        }

        override public function initialize():void
        {
            var target:ChatPanelManager;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ChatPanelManager_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ChatPanelManagerWatcherSetupUtil");
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

        override public function initView():void
        {
            var _local_1:*;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            chatListAC = new ArrayCollection();
            for (_local_1 in ChatPanelUtil.chatData)
            {
                if (ChatPanelUtil.chatData[_local_1] != "")
                {
                    if (ChatPanelUtil.panelStatusObj[_local_1] == "unread")
                    {
                        chatListAC.addItem({
                            "label":ChatPanelUtil.charactorName[_local_1],
                            "id":_local_1,
                            "icon":iconClass
                        });
                    }
                    else
                    {
                        chatListAC.addItem({
                            "label":ChatPanelUtil.charactorName[_local_1],
                            "id":_local_1,
                            "icon":null
                        });
                    };
                };
            };
            chatListAC.source.sortOn("icon");
            chatList.dataProvider = chatListAC;
            chatList.iconField = "icon";
        }

        public function __chatList_itemDoubleClick(_arg_1:ListEvent):void
        {
            showChatPanel();
        }

        [Bindable(event="propertyChange")]
        public function get chatList():List
        {
            return (this._1437158422chatList);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1 == true)
            {
                initView();
            };
        }

        private function _ChatPanelManager_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANELMANAGER_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatPanelManager_BasicTitleCanvas1.text = _arg_1;
            }, "_ChatPanelManager_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANELMANAGER_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                chatList.toolTip = _arg_1;
            }, "chatList.toolTip");
            result[1] = binding;
            return (result);
        }

        private function _ChatPanelManager_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHATPANELMANAGER_U[0];
            _local_1 = Language.CHATPANELMANAGER_S[0];
        }

        public function set chatList(_arg_1:List):void
        {
            var _local_2:Object = this._1437158422chatList;
            if (_local_2 !== _arg_1)
            {
                this._1437158422chatList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chatList", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

