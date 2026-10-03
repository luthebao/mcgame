// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.BattleInfoSinglePlayer

package com.qeedoo.ui.view.compBattle
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.Repeater;
    import mx.containers.HBox;
    import com.qeedoo.ui.view.comp.RoundedText;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import mx.binding.RepeatableBinding;
    import flash.utils.getDefinitionByName;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.vo.BuffVO;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.UIComponent;
    import flash.text.TextFieldAutoSize;
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

    public class BattleInfoSinglePlayer extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _35212935buffIcons:Repeater;
        private var _1055343087buffIconHbox:HBox;
        private var _117054941_BattleInfoSinglePlayer_HBox1:HBox;
        private var nameTXT:RoundedText;
        private var _3198432head:Image;
        public var _BattleInfoSinglePlayer_BattleInfoBuffCanvas1:Array;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":215,
                    "height":50,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"head",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "scaleX":0.6,
                                "scaleY":0.6
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":30,
                                "percentWidth":100,
                                "height":2
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"buffIconHbox",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 3;
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "y":33,
                                "height":25,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Repeater,
                                    "id":"buffIcons",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":BattleInfoBuffCanvas,
                                                "id":"_BattleInfoSinglePlayer_BattleInfoBuffCanvas1"
                                            })]});
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

        public function BattleInfoSinglePlayer()
        {
            mx_internal::_document = this;
            this.width = 215;
            this.height = 50;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BattleInfoSinglePlayer._watcherSetupUtil = _arg_1;
        }


        public function set buffIconHbox(_arg_1:HBox):void
        {
            var _local_2:Object = this._1055343087buffIconHbox;
            if (_local_2 !== _arg_1)
            {
                this._1055343087buffIconHbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buffIconHbox", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get buffIconHbox():HBox
        {
            return (this._1055343087buffIconHbox);
        }

        private function _BattleInfoSinglePlayer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (buffIcons.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _BattleInfoSinglePlayer_BattleInfoBuffCanvas1[_arg_2[0]].refresh = _arg_1;
            }, "_BattleInfoSinglePlayer_BattleInfoBuffCanvas1.refresh");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get buffIcons():Repeater
        {
            return (this._35212935buffIcons);
        }

        public function set head(_arg_1:Image):void
        {
            var _local_2:Object = this._3198432head;
            if (_local_2 !== _arg_1)
            {
                this._3198432head = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "head", _local_2, _arg_1));
            };
        }

        public function init():void
        {
            head.source = null;
            head.filters = null;
            if (nameTXT)
            {
                nameTXT.text = "";
            };
            visible = false;
        }

        public function set buffIcons(_arg_1:Repeater):void
        {
            var _local_2:Object = this._35212935buffIcons;
            if (_local_2 !== _arg_1)
            {
                this._35212935buffIcons = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buffIcons", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:BattleInfoSinglePlayer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BattleInfoSinglePlayer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_BattleInfoSinglePlayerWatcherSetupUtil");
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

        private function buffSort(_arg_1:Array):Array
        {
            var _local_5:ArrayCollection;
            var _local_7:BuffVO;
            var _local_2:Array = [];
            var _local_3:Object = {};
            var _local_4:int;
            while (_local_4 < _arg_1.length)
            {
                if ((((_arg_1[_local_4]) && (_arg_1[_local_4].data)) && (_arg_1[_local_4].data.id)))
                {
                    _local_3[_arg_1[_local_4].data.id] = _arg_1[_local_4];
                };
                _local_4++;
            };
            var _local_6:* = _core.view.getUI(ViewManager.STAGE_BATTLE);
            if (_local_6)
            {
                _local_5 = _local_6.getCharactorBuff();
            };
            if (_local_5)
            {
                for each (_local_7 in _local_5)
                {
                    if (_local_3[_local_7.id])
                    {
                        _local_2.push(_local_3[_local_7.id]);
                    };
                };
            }
            else
            {
                _local_2 = _arg_1;
            };
            return (_local_2);
        }

        private function _BattleInfoSinglePlayer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = buffIcons.currentItem;
        }

        public function refresh(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_5:UIComponent;
            var _local_6:int;
            var _local_7:Object;
            var _local_8:int;
            var _local_9:Object;
            if (!nameTXT)
            {
                nameTXT = new RoundedText();
                _local_5 = new UIComponent();
                _local_5.x = 38;
                nameTXT.x = 0;
                nameTXT.autoSize = TextFieldAutoSize.LEFT;
                _local_5.y = 8;
                nameTXT.width = 200;
                nameTXT.height = 20;
                _local_5.addChild(nameTXT);
                addChild(_local_5);
            };
            if (((!(_arg_1)) || (int(_arg_1.data.hp) == 0)))
            {
                dead();
                return;
            };
            head.filters = [];
            visible = true;
            var _local_2:Array = [];
            head.source = ResManager.getIconUrl(_arg_1.data.gameObject.iconCode);
            nameTXT.text = _arg_1.data.gameObject.name;
            var _local_3:uint = 16777164;
            if (_arg_1.data.gameObject.type == GamePredef.TBL_CREATURE)
            {
                if (_arg_1.data.leftSide)
                {
                    if (_arg_1.data.gameObject.bossFlag == 1)
                    {
                        _local_3 = 0xFF0000;
                    }
                    else
                    {
                        if (_arg_1.data.gameObject.bossFlag == 2)
                        {
                            _local_3 = 0xFF00;
                        };
                    };
                };
            }
            else
            {
                if (_arg_1.data.gameObject.type == GamePredef.TBL_PET)
                {
                };
            };
            if (_arg_1.color)
            {
                _local_3 = _arg_1.color;
            };
            nameTXT.textColor = _local_3;
            for (_local_4 in _arg_1.battleBuff)
            {
                _local_6 = 0;
                if (int(_local_4) > 10000000)
                {
                    _local_6 = int(Math.floor((int(_local_4) / 10000)));
                }
                else
                {
                    _local_6 = int(_local_4);
                };
                _local_7 = _core.data.gameData[GamePredef.TBL_BUFF][_local_6];
                _local_8 = _local_7.skillId;
                _local_9 = _core.data.gameData[GamePredef.TBL_SKILL][_local_8];
                if (!(((_local_9) && (int(_local_9.buffRound) > 10)) || (int(_arg_1.battleBuff[_local_4]) > 10)))
                {
                    _local_2.push({
                        "data":_local_7,
                        "keepRound":_arg_1.battleBuff[_local_4]
                    });
                };
            };
            if (((_arg_1.data.gameObject.id == _core.player.id) && (_local_2.length > 0)))
            {
                _local_2 = buffSort(_local_2);
            };
            buffIcons.dataProvider = _local_2;
        }

        [Bindable(event="propertyChange")]
        public function get _BattleInfoSinglePlayer_HBox1():HBox
        {
            return (this._117054941_BattleInfoSinglePlayer_HBox1);
        }

        [Bindable(event="propertyChange")]
        public function get head():Image
        {
            return (this._3198432head);
        }

        private function dead():void
        {
            ResManager.applyGray(head);
            nameTXT.textColor = 0xD0D0D0;
        }

        public function set _BattleInfoSinglePlayer_HBox1(_arg_1:HBox):void
        {
            var _local_2:Object = this._117054941_BattleInfoSinglePlayer_HBox1;
            if (_local_2 !== _arg_1)
            {
                this._117054941_BattleInfoSinglePlayer_HBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_BattleInfoSinglePlayer_HBox1", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compBattle

