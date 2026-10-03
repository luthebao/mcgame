// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AddGuildPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.TextInput;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.events.PropertyChangeEvent;
    import mx.controls.Alert;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.CloseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class AddGuildPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _AddGuildPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _AddGuildPanel_BasicGlowButton2:BasicGlowButton;
        public var _AddGuildPanel_RoundedLabel1:RoundedLabel;
        private var _1986547808addGuildInfo:IntroText;
        private var guildList:Object;
        private var _1994489252addGuildButton:BasicGlowButton;
        private var selfGuildMemberData:Object;
        private var _1986228193addGuildText:TextInput;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":340,
                    "height":338,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AddGuildPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"addGuildInfo",
                        "events":{"mouseDown":"__addGuildInfo_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.right = "15";
                            this.left = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":210});
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"addGuildText",
                        "events":{"mouseDown":"__addGuildText_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.top = "268";
                            this.right = "28";
                            this.left = "113";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "maxChars":10,
                                "enabled":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"addGuildButton",
                        "events":{
                            "mouseDown":"__addGuildButton_mouseDown",
                            "click":"__addGuildButton_click"
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":95,
                                "y":298,
                                "styleName":"CrystalBlueButton",
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_AddGuildPanel_BasicGlowButton2",
                        "events":{
                            "mouseDown":"___AddGuildPanel_BasicGlowButton2_mouseDown",
                            "click":"___AddGuildPanel_BasicGlowButton2_click"
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":200,
                                "y":298,
                                "styleName":"CrystalBlueButton",
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_AddGuildPanel_RoundedLabel1",
                        "events":{"mouseDown":"___AddGuildPanel_RoundedLabel1_mouseDown"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":36,
                                "y":270,
                                "width":69
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

        public function AddGuildPanel()
        {
            mx_internal::_document = this;
            this.width = 340;
            this.height = 338;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AddGuildPanel._watcherSetupUtil = _arg_1;
        }


        private function _AddGuildPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ADDGUIDEPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AddGuildPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AddGuildPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addGuildButton.label = _arg_1;
            }, "addGuildButton.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AddGuildPanel_BasicGlowButton2.label = _arg_1;
            }, "_AddGuildPanel_BasicGlowButton2.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ADDGUILDPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AddGuildPanel_RoundedLabel1.text = _arg_1;
            }, "_AddGuildPanel_RoundedLabel1.text");
            result[3] = binding;
            return (result);
        }

        public function __addGuildButton_click(_arg_1:MouseEvent):void
        {
            showAlert();
        }

        override public function initialize():void
        {
            var target:AddGuildPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AddGuildPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AddGuildPanelWatcherSetupUtil");
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
        public function get addGuildText():TextInput
        {
            return (this._1986228193addGuildText);
        }

        [Bindable(event="propertyChange")]
        public function get addGuildInfo():IntroText
        {
            return (this._1986547808addGuildInfo);
        }

        [Bindable(event="propertyChange")]
        public function get addGuildButton():BasicGlowButton
        {
            return (this._1994489252addGuildButton);
        }

        private function _AddGuildPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ADDGUIDEPANEL_U[0];
            _local_1 = Language.INPUTPANEL_U[0];
            _local_1 = Language.INPUTPANEL_U[1];
            _local_1 = Language.ADDGUILDPANEL_S[7];
        }

        public function __addGuildText_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function rand3(_arg_1:Object):Object
        {
            var _local_3:String;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_2.push(_arg_1[_local_3]);
            };
            return (_local_2[Math.floor((Math.random() * _local_2.length))]);
        }

        public function set addGuildText(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1986228193addGuildText;
            if (_local_2 !== _arg_1)
            {
                this._1986228193addGuildText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addGuildText", _local_2, _arg_1));
            };
        }

        public function set addGuildInfo(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1986547808addGuildInfo;
            if (_local_2 !== _arg_1)
            {
                this._1986547808addGuildInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addGuildInfo", _local_2, _arg_1));
            };
        }

        public function set addGuildButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1994489252addGuildButton;
            if (_local_2 !== _arg_1)
            {
                this._1994489252addGuildButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addGuildButton", _local_2, _arg_1));
            };
        }

        private function addGuild(_arg_1:CloseEvent):void
        {
            var _local_2:Number;
            var _local_3:*;
            if (_arg_1.detail == Alert.YES)
            {
                if (((_core.haveSpecialStr(addGuildText.text)) || (_core.haveBadWord(addGuildText.text))))
                {
                    Alert.show(Language.ADDGUILDPANEL_S[0], "", Alert.OK);
                }
                else
                {
                    if (addGuildText.text.length < 2)
                    {
                        Alert.show(Language.ADDGUILDPANEL_S[1], "", Alert.OK);
                    }
                    else
                    {
                        if (addGuildText.text.length > 10)
                        {
                            Alert.show(Language.ADDGUILDPANEL_S[2], "", Alert.OK);
                        }
                        else
                        {
                            if (_core.player.money < 1000000)
                            {
                                Alert.show(Language.ADDGUILDPANEL_S[3], "", Alert.OK);
                            }
                            else
                            {
                                _local_2 = 0;
                                if (guildList != null)
                                {
                                    for each (_local_3 in guildList)
                                    {
                                        if (_local_3 != undefined)
                                        {
                                            if (_local_3.name == addGuildText.text)
                                            {
                                                _local_2 = 1;
                                            };
                                        };
                                    };
                                };
                                if (_local_2 == 1)
                                {
                                    Alert.show(GamePredef.GUILD_EXISTGUILD, "", Alert.OK);
                                }
                                else
                                {
                                    _core.remote.addGuild({"name":addGuildText.text});
                                    visible = false;
                                };
                            };
                        };
                    };
                };
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            selfGuildMemberData = _core.view.getUI(ViewManager.PANEL_GUILD).selfGuildMemberData;
            if (((!(selfGuildMemberData == null)) || (_core.view.getUI(ViewManager.PANEL_GUILD).joinGuildFlag == 1)))
            {
                addGuildInfo.text = GamePredef.GUILD_NOADDGUILD;
                addGuildText.visible = false;
                addGuildButton.visible = false;
            }
            else
            {
                addGuildInfo.text = GamePredef.GUILD_ADDGUILDINFO;
                guildList = _core.view.getUI(ViewManager.PANEL_GUILD).guildList;
                addGuildText.visible = true;
                addGuildButton.visible = true;
            };
        }

        private function setRandName():void
        {
            var _local_3:String;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
            var _local_1:Object = _core.data.gameDataIndex[80];
            var _local_2:Array = [];
            for (_local_3 in _local_1)
            {
                if (_local_3 != "0")
                {
                    _local_2.push(_local_1[_local_3]);
                };
            };
            _local_1 = _local_2[Math.floor((Math.random() * _local_2.length))];
            _local_4 = rand3(_local_1);
            if (((!(_local_4)) || (((!(ToolKit.isEqual(_local_4.type, 32))) && (String(_local_4.name).length < 6)) && (Math.random() > 0.3))))
            {
                _local_5 = rand3(_local_1);
                while (((_local_4.id == _local_5.id) || (String((_local_4.name + _local_5.name)).length > 12)))
                {
                    _local_5 = rand3(_local_1);
                };
            };
            if (((_local_5) && (Math.floor((_local_4.type / 10)) == 2)))
            {
                addGuildText.text = ((_local_4.name + "·") + _local_5.name);
            }
            else
            {
                addGuildText.text = (_local_4.name + ((_local_5) ? _local_5.name : ""));
            };
            if (Math.random() > 0.7)
            {
                _local_6 = rand3(_core.data.gameDataIndex[80][0]).name;
                if (_local_6)
                {
                    addGuildText.text = ((_local_6 + addGuildText.text) + _local_6);
                };
            };
            if (String(Language.GAMEPREDEF_S[338]).indexOf(addGuildText.text) > 0)
            {
                addGuildText.text = "";
                setRandName();
            };
        }

        private function showAlert():void
        {
            var _local_1:* = "";
            if (((addGuildText.text.length > 2) && (addGuildText.text.length < 10)))
            {
                _local_1 = Language.ADDGUILDPANEL_S[4];
                _local_1 = _local_1.replace("{addGuildText.text}", addGuildText.text);
                Alert.show(_local_1, "", (Alert.YES | Alert.NO), this, addGuild);
            }
            else
            {
                Alert.show(Language.ADDGUILDPANEL_S[6]);
            };
        }

        public function ___AddGuildPanel_BasicGlowButton2_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (initialized)
            {
            };
            if (_arg_1 == true)
            {
                initView();
            };
        }

        public function ___AddGuildPanel_RoundedLabel1_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function __addGuildInfo_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function __addGuildButton_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function ___AddGuildPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            hide();
        }


    }
}//package com.qeedoo.ui.view.compDragable

